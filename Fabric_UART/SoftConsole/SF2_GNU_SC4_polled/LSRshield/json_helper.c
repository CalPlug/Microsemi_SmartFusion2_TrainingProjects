/***************************************************************************************************

  File:     json_helper.c
  Author:   LSR
  Version:  1.0

  Description:     Support functions for json de-serialization   

The MIT License (MIT)

Copyright (c) 2015 LSR

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sub license, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

***************************************************************************************************/
#include "jsmn.h"
#include "tiwi_datatypes.h"
#include "tiwi_framework.h"
#include "json_helper.h"

#include <string.h>
#include <stdio.h>

// Used by the param builder functions to convert 0 or 1 to false or true 
const  char* jsBoolStr[] = { "false", "true" }; 


/******************************************************************************
@fn GetIntegerByName( )

@brief  Scans the jsmn token array for the integer specified and returns the 
value if found 

@note   This function works for any unsigned integer on a little endian processor since
smaller values end up in the LSB you can pass any size for pValue

@param  stdParseParams_t *   paramsPtr "standard" params for dealing with the jsmn parser 
@param  tc_char *fieldName   name of the integer to get 
@param  tc_uint32 * pValue   value of the integer

@return status = TC_STATUS_OK if the integer was found 

*******************************************************************************/
TC_STATUS  GetIntegerByName(stdParseParams_t * paramsPtr, tc_char *fieldName, tc_uint32 * pValue)
{
  TC_STATUS  status = TC_STATUS_OK;
  tc_uint32 tokenIndex;
  tc_uint32 startIndex;
  tc_uint32 length; 
  
  // Get the token index for the field
  status = GetFieldIndexJson( paramsPtr, fieldName);
  
  tokenIndex = paramsPtr->tokenIndex + 1; // the integer value will be in the token after the string with the name 
  
  // Get the starting index in the character array and the length 
  startIndex = paramsPtr->tokenArray[tokenIndex].start;
  length = paramsPtr->tokenArray[tokenIndex].end - paramsPtr->tokenArray[tokenIndex].start;
  
  * pValue = FastAtoiInt32( &(paramsPtr->buffer[startIndex]), length );
  
  return status; 
  
}

/******************************************************************************
@fn GetBoolByName( )

@brief  Scans the jsmn token array for the integer specified and returns the 
value if found 

@note   This function works for any unsigned integer on a little endian processor since
smaller values end up in the LSB you can pass any size for pValue

@param  stdParseParams_t *   paramsPtr "standard" params for dealing with the jsmn parser 
@param  tc_char *fieldName   name of the integer to get 
@param  tc_bool * pValue     value of the bool

@return status = TC_STATUS_OK if the integer was found 

*******************************************************************************/
stdParseParams_t * paramsPtrGlobal; 
tc_bool valueGlobal;
tc_bool * pValueGlobal;

TC_STATUS GetBoolByName(stdParseParams_t * paramsPtr, tc_char *fieldName, tc_bool * pValue)
{
  TC_STATUS  status = TC_STATUS_OK;
  tc_uint32 tokenIndex;
  tc_uint32 startIndex;
  tc_uint32 length; 
  
  paramsPtrGlobal = paramsPtr;
  
  // Get the token index for the field
  status = GetFieldIndexJson( paramsPtr, fieldName);
  
  tokenIndex = paramsPtr->tokenIndex + 1; // the bool value will be in the token after the string containing the field name 
  
  printf(paramsPtr->buffer);
  
  // Get the starting index in the character array and the length 
  startIndex = paramsPtr->tokenArray[tokenIndex].start;
  length = paramsPtr->tokenArray[tokenIndex].end - paramsPtr->tokenArray[tokenIndex].start;
  
  // This is actually a jsmn primitive, but it contains text so we can 
  // treat it like a string. strncmp returns 0 if the strings match 
  *pValue = strncmp(&paramsPtr->buffer[startIndex], "false", length);
  
  // Some true / false checks depend on 0/1 and strncmp can return 
  // negative values, so force a non-zero result to value = 1
  if(*pValue != TC_FALSE)
  {
    *pValue = TC_TRUE;
  }
  
  return status; 
  
}


/******************************************************************************
@fn GetStringByName( )

@brief  Scans the jsmn token array for the string specified and returns the 
value if found 

@note   This function works for any unsigned string on a little endian processor since
smaller values end up in the LSB you can pass any size for pValue

@param  stdParseParams_t *   paramsPtr "standard" params for dealing with the jsmn parser 
@param  tc_char *fieldName   name of the string to get 
@param  tc_string resultStr  buffer for the string

@return status = TC_STATUS_OK if the string was found 

*******************************************************************************/
TC_STATUS GetStringByName(stdParseParams_t * paramsPtr, tc_char *fieldName, tc_string string)
{
  TC_STATUS  status = TC_STATUS_OK;
  tc_uint32 tokenIndex;
  tc_uint32 startIndex;
  tc_uint32 length; 
  
  paramsPtrGlobal = paramsPtr;
  
  // Get the token index for the field
  status = GetFieldIndexJson( paramsPtr, fieldName);
  
  tokenIndex = paramsPtr->tokenIndex + 1; // the string value will be in the token after the string containing the field name 
  
  printf(paramsPtr->buffer);
  
  // Get the starting index in the character array and the length 
  startIndex = paramsPtr->tokenArray[tokenIndex].start;
  length = paramsPtr->tokenArray[tokenIndex].end - paramsPtr->tokenArray[tokenIndex].start;
  
  // This should be a jsmn string but it's not null terminated since it's embedded in the json string 
  memcpy(string, &paramsPtr->buffer[startIndex], length);
  
  string[length] = '\0'; // make the result null terminated
  
  return status; 
  
}

/******************************************************************************
@fn FastAtoiInt32( char * str, int len )

@brief  Fast conversion of an ASCII string to a signed or unsigned 32 bit integer


@note   This function works for any unsigned integer on a little endian processor since
smaller values end up in the LSB you can pass any size for pValue

@param  char * str The ascii string to convert 
@param  the length of the ascii string  

@return tc_int32 the value of the integer (works for 8 to 32 bit little endian) 

*******************************************************************************/
tc_int32 FastAtoiInt32( char * str, int len )
{
  int value = 0;
  int sign = 1;
  
  if ( str[0] == '-' ) // handle negative
  {
    sign = -1;
    ++str;
    --len;
  }
  
  switch ( len )
    // handle up to 10 digits plus sign, assume we're 32-bit
    // this covers signed and unsigned 32 bit max values 
  {
  case 10:
    value += ( str[len - 10] - '0' ) * 1000000000;break;  //break by Stefan
  case 9:
    value += ( str[len - 9] - '0' ) * 100000000;break;  //break by Stefan
  case 8:
    value += ( str[len - 8] - '0' ) * 10000000;break;  //break by Stefan
  case 7:
    value += ( str[len - 7] - '0' ) * 1000000;break;  //break by Stefan
  case 6:
    value += ( str[len - 6] - '0' ) * 100000;break;  //break by Stefan
  case 5:
    value += ( str[len - 5] - '0' ) * 10000;break;  //break by Stefan
  case 4:
    value += ( str[len - 4] - '0' ) * 1000;break;  //break by Stefan
  case 3:
    value += ( str[len - 3] - '0' ) * 100;break;  //break by Stefan
  case 2:
    value += ( str[len - 2] - '0' ) * 10;break;  //break by Stefan
  case 1:
    value += ( str[len - 1] - '0' );
    
    value *= sign;
    break;  //break by Stefan
    default:
    break;  //break by Stefan
//moved from here by Stefan      return value;
  }
  return value;

}



/******************************************************************************

@fn TC_STATUS GetStringAtIndexJson(stdParseParams_t *parseParamPtr, char * resultStr, tc_uint32 maxBufLen )

@brief  Helper function to get the current JSON token as a string

NOTE: The purpose of this function is to allow the user to walk the json object to sort out multiple instances of contained objects and / or params

@param  stdParseParams_t *parseParamPtr  the "standard" struct to deal with jsmn parser output 
@param  char * resultStr  result of the search if a match is found
@param  tc_uint32 maxBufLen  maximum length of the result buffer including the TC_NULL termination

@return status = TC_STATUS_OK if we found a string at the token index provided by parseParamPtr->tokenIndex

*******************************************************************************/
TC_STATUS GetStringAtIndexJson(stdParseParams_t *parseParamPtr, char * resultStr, tc_uint32 maxBufLen )
{
  TC_STATUS status = TC_STATUS_PARSE_ERROR;
  tc_uint16 tokenIndex;
  tc_uint16 resultStrLen;
  
  // This is the token we want the value of
  tokenIndex = parseParamPtr->tokenIndex;
  
  if ( ( parseParamPtr->tokenArray[tokenIndex].type == JSMN_STRING ) && ( tokenIndex < parseParamPtr->parserPtr->toknext ) )
  {
    
    // after the parser is run toknext is one index past the end of the token array
    resultStrLen = parseParamPtr->tokenArray[tokenIndex].end - parseParamPtr->tokenArray[tokenIndex].start;
    
    
    // WE ASSUME THE ACTUAL BUFFER LENGTH IS ONE BYTE MORE THAN THE LENGTH OF ANY STRING PASSED IN
    if ( resultStrLen > maxBufLen - 1 )
    { // max buffer length is one more than the string length
      
      resultStrLen = maxBufLen - 1; // copy up to the full number of bytes leaving one space for TC_NULL
    }
    
    // this function forces a TC_NULL termination in the last buffer position
    // Our source string is NOT TC_NULL terminated so use the string length + 1 at the end of the copy
    null_strncpy( resultStr, (char*) &(parseParamPtr->buffer[parseParamPtr->tokenArray[tokenIndex].start]), resultStrLen + 1 );
    
    status = TC_STATUS_OK;
    
    
  }
  
  return status;
  
}


/******************************************************************************
@fn TC_STATUS GetTokenIndexJson(stdParseParams_t *parseParamPtr, jsmntype_t tokenType )

@brief  Helper function to get tokens in the JSON string by type i.e. JSMN_PRIMITIVE, JSMN_OBJECT, JSMN_ARRAY, JSMN_STRING


NOTE: The purpose of tokenIndex in this function is to allow the user to walk the json object to sort out multiple instances of contained objects
If you don't need to do that BE SURE TO SET tokenIndex to zero before calling this function 

@param  stdParseParams_t *parseParamPtr  the "standard" struct to deal with jsmn parser output 
@param  jsmntype_t tokenType  used to qualify the search as an error check 

@return status = TC_STATUS_OK if we found the right token 
*******************************************************************************/
TC_STATUS GetTokenIndexJson(stdParseParams_t *parseParamPtr, jsmntype_t tokenType )
{
  tc_uint16 tokenIndex;
  TC_STATUS status = TC_STATUS_PARSE_ERROR;
  
  
  tokenIndex = parseParamPtr->tokenIndex;
  
  if ( tokenIndex > parseParamPtr->parserPtr->toknext )
  {
    printf( "Token index out of range \n" );
  }
  
  // allow the user to choose which token to start searching from
  for ( ; tokenIndex < parseParamPtr->parserPtr->toknext; tokenIndex++ )
  {
    if ( parseParamPtr->tokenArray[tokenIndex].type == tokenType )
    {
      // Save the location where we found a match
      parseParamPtr->tokenIndex = tokenIndex;
      status = TC_STATUS_OK;
      break;
    }
  }
  
  return status;
}

/******************************************************************************
@fn TC_STATUS GetFieldIndexJson( stdParseParams_t *parseParamPtr, char *field_name )

@brief  Helper function to get a JSON token by name


NOTE: The purpose of tokenIndex in this function is to allow the user to walk the json object to sort out multiple instances of contained objects
If you don't need to do that BE SURE TO SET tokenIndex to zero before calling this function 

@param  stdParseParams_t *parseParamPtr  the "standard" struct to deal with jsmn parser output 
@param  char *field_name property name to look for

@return TC_STATUS_OK if no errors

*******************************************************************************/
TC_STATUS GetFieldIndexJson( stdParseParams_t *parseParamPtr, char *field_name )
{
  tc_uint16 tokenIndex;
  
  TC_STATUS status = TC_STATUS_PARSE_ERROR;
  
  // This is where we start looking for tokens
  tokenIndex = parseParamPtr->tokenIndex;
  
  // allow the user to choose which token to start searching from
  for ( ; tokenIndex < parseParamPtr->parserPtr->toknext; tokenIndex++ )
  {
    if (parseParamPtr->tokenArray[tokenIndex].type == JSMN_STRING )
    {
      if ( 0 == strncmp( field_name, (char *) &(parseParamPtr->buffer[parseParamPtr->tokenArray[tokenIndex].start]), strlen( field_name ) ) )
      {
        // check to make sure the token is not the last one
        if ( (tokenIndex + 1) < parseParamPtr->parserPtr->toknext )
        {
          // Save the location where we found a match
          parseParamPtr->tokenIndex = tokenIndex;
          
          status = 0;
          
          break;
        }
      }
    }
  }
  
  return status;
}


/******************************************************************************
* @fn tc_uint32 Fnv1aStringHash(char *str)
*
* @brief  - perform a 32 bit Fowler/Noll/Vo FNV-1a hash on a string
*
* input:
*  str - string to hash
*  hval    - previous hash value or FNV1_32A_INIT if first call
*
* returns:
*  32 bit hash as a static hash type
*
* NOTE: To use the recommended 32 bit FNV-1a hash, use FNV1_32A_INIT as the
*       hval arg on the first call to either fnv_32a_buf() or Fnv1aStringHash().

******************************************************************************/
tc_uint32 Fnv1aStringHash( char *str, tc_uint32 maxStrLen )
{
  tc_uint32 ii;
  const tc_uint32 prime = 0x01000193;
  const tc_uint32 seed = 0x811c9dc5;
  
  tc_uint32 hval = seed;
  
  // FNV-1a hash each byte in the string
  
  // do a max string length check
  for ( ii = 0; ii < maxStrLen; ii++ )
  {
    // xor the bottom with the current octet
    hval ^= (tc_uint32) *str++;
    
    // multiply by the 32 bit FNV magic prime mod 2^32
    hval *= prime;
    
    if ( !*str )
      break;
  }
  
  return hval;
}

/******************************************************************************
@fn LocateEndOfHttpHeader( )

@brief  This is a fast search for the pattern "\r\n\r\n" which occurs at the
end of an http header 

Most packets returned from the server are a json rpc ok result which is very
short.  In that case the header will be much longer than the body and the
header contains \r and \n characters.  The fastest search is to start at the
end of the packet and scan toward the beginning. The body normally does not
have any \r or \n characters 

@param input httpBuffer Buffer containing the http packet 
@param input httpBufLenPtr Pointer to the number of used bytes in the buffer 
@param output httpHeaderLenPtr Pointer to the number of bytes in the http header 

@return int_OK if things went OK, TC_STATUS_PARSE_ERROR on error 

******************************************************************************/
TC_STATUS LocateEndOfHttpHeader(char* httpBuffer, tc_uint32 * httpBufLenPtr, tc_uint32 * httpHeaderLenPtr)
{
  tc_uint32 ii;  // counter 
  tc_uint32 len = * httpBufLenPtr;	// length of the http packet 	
  TC_STATUS status = TC_STATUS_PARSE_ERROR;  // return value 
  
  // Start at the end of the http buffer and work toward the beginning
  for(ii = len - 1; ii > 3; ii--)
  {
    if(httpBuffer[ii] == '\n')
    {
      if(httpBuffer[ii - 2] == '\n')
      {
        if((httpBuffer[ii - 1] == '\r'))
        {
          // We found the pattern we were looking for
          status = TC_STATUS_OK;
          // Zero based index so add one for the length 
          *httpHeaderLenPtr = ii + 1;
          // No need to keep searching so break
          break;
        }
        
      }
    }
  }
  return status;
}

/******************************************************************************
@fn null_strncpy

@brief  Version of strncpy that ensures null termination

@param  char * destination
@param  const char * source
@param  size_t num

@return destination

*******************************************************************************/
char * null_strncpy( char * destination, const char * source, size_t bufLen )
{
  // call the clib strncpy
  strncpy( destination, source, bufLen );
  
  // Force a null termination in the last buffer location
  destination[bufLen - 1] = '\0';
  
  // Right now there is no fail mode
  return destination;
  
}


/********************************************************************************
@fn GetMsgId( void )

@brief  Provides a central place to get the json rpc msg ID

@param  void

@return msgId

*******************************************************************************/
tc_int32 GetJsonRpcMsgId( void )
{
  static tc_int32 msgId = 0;
  
  if ( ++msgId > MAX_MSG_ID_VALUE )
  {
    msgId = 0;
  }
  
  return msgId;
}

