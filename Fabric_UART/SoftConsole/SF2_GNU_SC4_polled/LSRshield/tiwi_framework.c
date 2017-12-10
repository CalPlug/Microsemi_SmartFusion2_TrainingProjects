/**
* @file tiwiFramework.c
* @date
* @brief Framework to support serialization / deserialization using code generated 
*        from TiWi Connect Device Types 
*
*
*
*
* Copyright (c) LS Research LLC 2015
*
* @see
*/

#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>
#include <string.h>

#include "json_helper.h"
#include "tiwi_Framework.h"
#include "tiwi_FrameworkGenerated.h"
#include "jsmn.h"

// Used to support the instance of the jsmn parser we use for parsing JSON from the server 
static jsmn_parser _jparser;
static jsmntok_t _jtokens[JSMN_TOKEN_MAX];


// These are used to manage acks to the actions sent by the server  
static tc_char  _currentActionIdBuffer[ACTION_ID_BUF_LEN]  = "";  // 24 digits plus a null 
static tc_char  _previousActionIdBuffer[ACTION_ID_BUF_LEN] = "";  // used to check for duplicates
static tc_uint32 _pendingActionCount  =  0;  // number of pending actions at the server 

// Buffer that is used to hold the tc packet as it is being constructed 
static tc_char  _txBuffer[TX_BUILDER_BUF_LEN];  // buffer that we use to build the tx message 


// ***********************   Local function prototypes ************************

static TC_STATUS CheckForDuplicateActionId_framework( void );
static TC_STATUS SaveActionId_framework( stdParseParams_t * paramsPtr);
static TC_STATUS ActionCountHandler_framework( stdParseParams_t * paramsPtr);
static TC_STATUS ActionHandler_framework( stdParseParams_t * paramsPtr);
static  TC_STATUS TransmitByteBuffer_framework(tc_char* outputBuffer, tc_uint32 bufLen);


// **********************   External function prototypes **********************

//  Standard / required  interface function prototype 
int TransmitToModuleViaUart( uint8_t* buffer, uint16_t bufLen );

// Local strings for building json msgs to send to the server 
static const char _getActionTemplateString [ ] = "{\"jsonrpc\":\"2.0\",\"method\":\"GetAct\",\"params\":{\"aID\":\"%s\"},\"id\":%d}";
static const char _setAtrributesTemplateString [ ] = "{\"jsonrpc\":\"2.0\",\"method\":\"SetAtts\",\"params\":{%s, \"aID\":\"%s\"},\"id\": %d}";

/******************************************************************************
@fn  GetPendingActionCount_framework()

@brief Returns the number of pending actions as reported by the server   

@param   none 

@return number of pending actions on the server 

******************************************************************************/
tc_uint16 GetPendingActionCount_framework( void )
{
    return _pendingActionCount;
}

/******************************************************************************
@fn TransmitByteBuffer_framework( )

@brief  Abstraction layer to support multiple transports to/from the server

@note   Modify this function to use the desired path e.g. tcp socket or uart 

@param  outputBuffer byte buffer containing a json object 
@param  bufLen number of bytes in outputBuffer

@return status ,  TC_STATUS_OK if no errors 

******************************************************************************/
static TC_STATUS TransmitByteBuffer_framework(char* outputBuffer, tc_uint32 bufLen)
{
    TC_STATUS  status = TC_STATUS_OK;
    
    // Add a semicolon termination and increase the bufLen to accommodate
    outputBuffer[bufLen++] = ';'; 
    
    // Call the function that has been customized to use the desired uart interface functions etc
    status = TransmitToModuleViaUart( (uint8_t*) outputBuffer, bufLen );
    
    return status;
}



/******************************************************************************

@brief  Parses a received json object for any actions and the action ID 
its value to a local variable 

@param  inputBuffer byte buffer containing a json object 
@param  bufLen number of bytes in the inputBuffer

@return status ,  TC_STATUS_OK if no errors 

******************************************************************************/
TC_STATUS ProcessReceiveByteBuffer_framework(tc_char* inputBuffer, tc_uint32 bufLen)
{
    TC_STATUS  status = TC_STATUS_OK;   // Return value
    TC_STATUS  refStatus;		      // intermediate status 
    stdParseParams_t parseParams;       // the usual jsmn parser struct 
    
    // Initialize the parser 
    jsmn_init( &_jparser );
    status = jsmn_parse( &_jparser, (const tc_char *) inputBuffer, _jtokens, JSMN_TOKEN_MAX );
    
    parseParams.parserPtr  = &_jparser;
    parseParams.tokenArray = _jtokens;
    parseParams.buffer	 = (char*)inputBuffer;
    parseParams.tokenIndex = 0;
    
    if ( status == TC_STATUS_OK )
    {
        
        refStatus = ActionHandler_framework( &parseParams);
        
        refStatus = SaveActionId_framework( &parseParams);
        
        refStatus = ActionCountHandler_framework( &parseParams);
        
        status  = refStatus;
    }
    
    return status;
}


/******************************************************************************
@fn SetAttributes_framework( )

@brief  Sends the attributes for the tiwi profiles to the server 
its value to a local variable 

@param  buffer Buffer containing an attributes object e.g.      "rgbLed":{"red":123,"green":233,"blue":255}
@param  bufLen Number of bytes in the attributes object  

@return status ,  TC_STATUS_OK if no errors 

******************************************************************************/

TC_STATUS SetAttributes_framework( tc_char* buffer, tc_uint32 buflen)
{
    TC_STATUS  status = TC_STATUS_OK;
    tc_uint32  charCount;
    
    // Make sure the buffer is null terminated  
    buffer[buflen] = 0;							
    
    // Build the JSON object string note the semicolon at the end which we use as a delimiter 
    charCount = snprintf( _txBuffer, TX_BUILDER_BUF_LEN, _setAtrributesTemplateString , buffer, _currentActionIdBuffer, GetJsonRpcMsgId( ) );
    
    status = TransmitByteBuffer_framework(_txBuffer, charCount);
    
    return status; 
    
}

/******************************************************************************
@fn GetPendingAction_framework( void )

@brief  Sends a get action message to the server  

@param  void

@return status ,  TC_STATUS_OK if no errors 

******************************************************************************/
TC_STATUS GetPendingAction_framework( void )
{
    TC_STATUS  status = TC_STATUS_OK;
    tc_int32  charCount;
    
    // Build the JSON object string note the semicolon at the end which we use as a delimiter 
    charCount = snprintf( _txBuffer, TX_BUILDER_BUF_LEN, _getActionTemplateString  , _currentActionIdBuffer, GetJsonRpcMsgId( ) );
    
    status = TransmitByteBuffer_framework(_txBuffer,(tc_uint32)charCount);
    
    return status; 
    
}


/*****************************************************************************
@fn SaveActionId_framework( )

@brief  Parses a received json object for a string param named "aID" and saves
its value to a local variable 

@param  paramsPtr Pointer to the standard json parser parameters     

@return status ,  TC_STATUS_OK if no errors 

******************************************************************************/
static TC_STATUS  SaveActionId_framework( stdParseParams_t * paramsPtr)
{
    TC_STATUS  status = TC_STATUS_OK;
    
    paramsPtr->tokenIndex = 0; // make sure we start looking at zero 
    
    // Index values are zero if the string was not found
    status = GetFieldIndexJson( paramsPtr, "aID" );
    
    // if we found the aID string then save the action 
    if(status == TC_STATUS_OK)
    {
        // Copy the current buffer into the previous so we can compare the two 
        null_strncpy(_previousActionIdBuffer, _currentActionIdBuffer, ACTION_ID_BUF_LEN);
        
        // The string at the next token is the value of the action ID
        paramsPtr->tokenIndex++;
        
        // save the aID we just got into the current buffer 
        status = GetStringAtIndexJson(paramsPtr, _currentActionIdBuffer, ACTION_ID_BUF_LEN );
        
        // Take apporpriate action if we have a duplicate action ID 
        status = CheckForDuplicateActionId_framework(  );
    }
    
    return status;
    
}


/******************************************************************************
@fn CheckForDuplicateActionId_framework( )

@brief  Parses a received json object for a string param named "aID" and saves
its value to a local variable 

@param  paramsPtr Pointer to the standard json parser parameters     

@return status ,  TC_STATUS_OK if no errors 

******************************************************************************/
static TC_STATUS  CheckForDuplicateActionId_framework( void )
{
    TC_STATUS  status = TC_STATUS_OK;
    
    // compare the current and previous action IDs.  If they are the same, then the 
    // action isn't getting properly cleared at the server so force a clear
    if( 0 == strncmp(_currentActionIdBuffer, _previousActionIdBuffer, ACTION_ID_BUF_LEN ))
    {
        // Sending the string "FORCE" as the action ID will cause the server to discard 
        // action on the top of the queue 
        strncpy(_currentActionIdBuffer, "FORCE", ACTION_ID_BUF_LEN );
    }
    
    return status;
}

/******************************************************************************
@fn ActionHandler_framework( )

@brief  Parses a received action and passes it to the correct handler function
located in on of the profile c code files 

@param  profileNameHash  32 bit hash of the tiwi profile name string 
@param  paramsPtr Pointer to the standard json parser parameters     

@return status ,  TC_STATUS_OK if no errors 

******************************************************************************/
static TC_STATUS  ActionHandler_framework( stdParseParams_t * paramsPtr)
{
    TC_STATUS  status = TC_STATUS_OK;
    jsmntok_t  jsmnToken;
    tc_uint32  bufferIndex; 
    tc_uint32  profileNameHash;				        // Holds the has of the name of the profile 
    char profileActionBuf[PROFILE_ACTION_BUF_LEN];    // Temporary buffer for getting the name of the profile 
    
    paramsPtr->tokenIndex = 0; // make sure we start looking at zero 
    
    // Token Index values in stdParseParams_t  > zero if the string was not found
    status += GetFieldIndexJson( paramsPtr, "result" );
    status += GetFieldIndexJson( paramsPtr, "action" );
    
    
    // If we found and action object following the result object 
    if( TC_STATUS_OK == status)
    {
        
        // This sequence ends up walking the buffer paramsPtr->tokenIndex holds the state
        // of the last token we found / used so we can count on proceeding through the 
        // string unless the token index is set back to zero 
        
        // find the first object that follows the index of the action string 
        status = GetTokenIndexJson(paramsPtr,JSMN_OBJECT );
        
        // The first string in the rpc object is by definition the profile name 
        status = GetTokenIndexJson( paramsPtr, JSMN_STRING );
        
        // Now we get the name of the profile in a buffer 
        status = GetStringAtIndexJson( paramsPtr, profileActionBuf, PROFILE_ACTION_BUF_LEN);
        
        // Get the token that corresponds the the profile name as a string 
        jsmnToken = paramsPtr->tokenArray[paramsPtr->tokenIndex];
        
        // This is the buffer index at the byte following the profile name we just read 
        bufferIndex = jsmnToken.end - jsmnToken.start;
        
        // Set the next byte to be an underscore (our delimiter) and increment the index 
        profileActionBuf[bufferIndex++] = '_';
        
        // find the first object that follows the index of the profile string 
        status = GetTokenIndexJson(paramsPtr,JSMN_OBJECT );
        
        // The first string in the profile object is by definition the actions name 
        status = GetTokenIndexJson( paramsPtr, JSMN_STRING );
       
        // Now we add the action name to the buffer this function guarantees a null termination
        status = GetStringAtIndexJson( paramsPtr, &profileActionBuf[bufferIndex], PROFILE_ACTION_BUF_LEN - bufferIndex);

        // hash the profile name to do the function lookup 
        profileNameHash = Fnv1aStringHash( profileActionBuf, PROFILE_ACTION_BUF_LEN );
        
        // Do a switch on the 32 bit hash of the ascii value of the action's profile name 
        // This Function Is In tiwi_FrameworkGenerated.c
        status = ActionRouter_framework(profileNameHash, paramsPtr);
    }
    
    return status;
}


/******************************************************************************
@fn     ActionCountHandler_framework( )

@brief  Parses a received server response for the received aCnt field and
requests an action from the server if it is non-zero
located in on of the profile c code files 

@param  paramsPtr Pointer to the standard json parser parameters     

@return status ,  TC_STATUS_OK if no errors 

******************************************************************************/
static TC_STATUS  ActionCountHandler_framework( stdParseParams_t * paramsPtr)
{
    TC_STATUS status = TC_STATUS_OK;	// return value 	
    
    paramsPtr->tokenIndex = 0; // make sure we start looking at zero 
    
    // Token Index values in stdParseParams_t  > zero if the string was not found
    status = GetFieldIndexJson( paramsPtr, "result" );
    status = GetFieldIndexJson( paramsPtr, "aCnt" );
    
    // If we found an action count value in the result object
    if( TC_STATUS_OK == status)
    {
        // find the first object that follows the index of the action string 
        status =  GetIntegerByName(paramsPtr, "aCnt",  &_pendingActionCount );   
        
        // If there are any pending actions send a get action request to the server
        if(_pendingActionCount  == 0)
        {
            // If the action count is zero assume we have ack'd everything
            null_strncpy(_currentActionIdBuffer, "", ACTION_ID_BUF_LEN);
        }
        
    }
    
    return status;
}

