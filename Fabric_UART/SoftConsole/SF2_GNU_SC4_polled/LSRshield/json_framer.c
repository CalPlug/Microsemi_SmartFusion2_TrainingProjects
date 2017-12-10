/***************************************************************************************************

  File:     json_framer.c
  Author:   LSR
  Version:  1.0

  Description:      


The MIT License (MIT)

Copyright (c) 2015 LSR

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sub-license, and/or sell
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

#include "tiwi_datatypes.h"
#include "tiwi_framework.h"
#include "json_framer.h"
#include "circular_buffer.h"

// Variables for the interface UART 
static tc_queue _tcqRxData;             // Rx data FIFO         
static ParserStateEnum_t _parserState;  // JSON packet parser 
static int _parserByteCount;            // packet length 
uint8_t jsonPacketBuffer[JSON_BUF_LEN]; // completed JSON packet buffer

/***************************************************************************************************

  @brief  Initializes the Rx data fifo for the interface uart 

  @see circular_buffer.c 

  @param  None          
  @retval None

***************************************************************************************************/
void InterfaceUartFifo_Config( void )
{
  tcqInit(&_tcqRxData, FIFO_BUF_LEN);
}

/***************************************************************************************************

  @brief  Rx byte received callback
   
  @param  uint8_t rxByteUartHandle the receive data to put on the Rx software FIFO         
  @retval None
***************************************************************************************************/
int RxDataFramerAddByte(uint8_t rxByte)
{
    int status = STATUS_OK ;
    
  // Place the received byte on the rx FIFO 
  tcqPush(&_tcqRxData, (Item_t *) &rxByte);
  
  return status;
}

/***************************************************************************************************
  
  @brief  Gets data from the UART software  Rx FIFO and sends it to the JSON packet framer  
 
  @see circular_buffer.c 

  @param  None          
  @retval None
***************************************************************************************************/
int ParseInterfaceUartRxData( void )
{
  int status = STATUS_OK ;
  uint8_t rxByte;
  
  // While there is data on the queue, get it and send it to the framer
  while( tcqPop(&_tcqRxData,  (Item_t *) &rxByte) == STATUS_OK)
  {
   
    // The parser has two states, looking for the object start and looking for the termination 
    switch(_parserState)
    {
    case PARSER_STATE_SOF:
      JsonParserSOF(rxByte);
      break;  
      
    case PARSER_STATE_EOF:
     JsonParserEOF(rxByte);
      break; 
      
    default:
      JsonParserReset( );
      break; 
    }
    
  }
  
  return status;
  
}

/***************************************************************************************************
 
  @brief  Resets the JSON parser at start-up and for error recovery 
         
  @param  none
  @return none
***************************************************************************************************/
void  JsonParserReset(void)
{
  
  // Set the parser to start looking for the start of frame 
  _parserState = PARSER_STATE_SOF;
  _parserByteCount = 0;
  
  
}

/***************************************************************************************************
 
  @brief Checks for the JSON start of object (frame) character and advances the framer to 
      to the next state when found 
     
 
  @param  uint8_t byte
  @return STATUS_OK

***************************************************************************************************/
int JsonParserSOF(uint8_t byte)
{
  int status = STATUS_OK;
  
  // If we found the object start byte, save it and change to the next state 
  if(byte == JSON_START_BYTE)
  {
    // we count the number of bytes in the object as is comes in 
    _parserByteCount = 0;
    jsonPacketBuffer[_parserByteCount++] = byte;
    
    _parserState++;
    
  }
  
  return status;
}

/***************************************************************************************************
 
  @brief Checks for the end of frame character ';' used by the tiwiConnect Module, to be a 
         real end of frame jit must be preceeded immediatly by the JSON end of object '}' 
         
  @param  uint8_t byte     The byte to process 
  @return STATUS_OK
***************************************************************************************************/
int JsonParserEOF(uint8_t byte)
{
  int status = STATUS_OK;
  
  // Increment the byte count 
  jsonPacketBuffer[_parserByteCount++] = byte;
  
  // If we found the frame termination ';' check that it is preceeded byt '}' 
  if(byte == JSON_TERM_BYTE)
  {
    if(jsonPacketBuffer[_parserByteCount - 2] == JSON_END_BYTE)
    {
       // Replace the terminating semicolon with a null char
       jsonPacketBuffer[ _parserByteCount] = '\0';
       JsonParserProcessObject(jsonPacketBuffer, _parserByteCount );
    }

    // Anytime we get a semicolon (end of frame character) then reset the parser
    JsonParserReset( );
    
  }
  
  return status;
}
/***************************************************************************************************
 
  @brief  Wrapper function to call the JSON Rx object handler in the tiwiConnect framework. 
         
 
  @param  uint8_t* buffer  byte buffer containing a complete JSON object 
  @param  uint16_t bufLen  number of bytes (chars) in the JSON object
  @return see the return for ProcessReceiveByteBuffer_framework( )
***************************************************************************************************/
int JsonParserProcessObject( uint8_t* buffer, uint16_t bufLen )
{
  int status = 0;
  
  // process the object
  status =  ProcessReceiveByteBuffer_framework((char*)buffer, bufLen);
  

  
  return status;
}
