/***************************************************************************************************

  File:     json_framer.h
  Author:   LSR
  Version:  1.0

  Description:      Public interface for json_framer.c 


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
#pragma once 

// #include "stm32l1xx_nucleo.h"

// Buffer sizes
#define FIFO_BUF_LEN                      256    // bytes  
#define JSON_BUF_LEN                      256    // bytes       
#define RXBUFFERSIZE                      1      // receive byte by byte

// Interface UART JSON Parser States   
typedef enum {
  
    PARSER_STATE_SOF,      // Looking for SOF     
    PARSER_STATE_EOF,      // Looking for EOF    
    PARSER_STATE_VALID,    // Valid json packet found
    PARSER_STATE_COUNT     // Number of states we have 
      
} ParserStateEnum_t;

#define JSON_START_BYTE  '{'
#define JSON_END_BYTE    '}'
#define JSON_TERM_BYTE   ';'   // Not a valid json char can't be burried in strings 

// Public interface to json_framer.c
void InterfaceUartFifo_Config( void );
int RxDataFramerAddByte(uint8_t rxByte);


int   ParseInterfaceUartRxData( void );
void  JsonParserReset(void);
int   JsonParserSOF(uint8_t byte);
int   JsonParserEOF(uint8_t byte);
int   JsonParserProcessObject( uint8_t* buffer, uint16_t bufLen );

