/***************************************************************************************************

  File:     json_helper.h
  Author:   LSR
  Version:  1.0

  Description:     Public interface for  json_helper.c

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
#pragma once
#include "tiwi_datatypes.h"
#include "jsmn.h"

#define JSMN_TOKEN_MAX (64)      // max number of tokens we can have in a JSON string

// This is somewhat arbitrary http headers are normally 170 bytes so use 180
#define MAX_JSON_BUF_LEN (480)  // Maximum length of a complete json rpc message 
#define MAX_MSG_ID_VALUE ( 99)  // limit to two digits


// Standard info from the parse that gets passed from layer to layer 
typedef struct
{
  jsmn_parser * parserPtr;
  jsmntok_t   * tokenArray;
  tc_char     * buffer;
  tc_uint16    tokenIndex;

} stdParseParams_t;


//  { "TC_FALSE", "TC_TRUE" };  used to convert 0, 1 to true, false
extern const  char* jsBoolStr[]; 

// Prototypes for functions located int json_helper.c
tc_int32   FastAtoiInt32( char * str, int len );
tc_uint32  Fnv1aStringHash( char *str,  tc_uint32 maxStrLen );
tc_int32   GetJsonRpcMsgId( void );

TC_STATUS  GetIntegerByName(stdParseParams_t * paramsPtr, tc_char *fieldName, tc_uint32 * pValue);
TC_STATUS  GetBoolByName(stdParseParams_t * paramsPtr, tc_char *fieldName, tc_bool * pValue);
TC_STATUS  GetStringByName(stdParseParams_t * paramsPtr, tc_char *fieldName, tc_string string);

TC_STATUS  LocateEndOfHttpHeader(char* httpBuffer, tc_uint32 * httpBufLenPtr, tc_uint32 * httpHeaderLenPtr);
TC_STATUS  GetFieldIndexJson( stdParseParams_t* parseParamPtr, char *field_name );
TC_STATUS  GetTokenIndexJson(stdParseParams_t *parseParamPtr, jsmntype_t tokenType);
TC_STATUS  GetStringAtIndexJson(stdParseParams_t *parseParamPtr, char * resultStr, tc_uint32 maxBufLen );

//tc_char *  null_strncpy( char * destination, const char * source, tc_uint32 bufLen ); //changed by stefan to match .c file
char * null_strncpy( char * destination, const char * source, unsigned int bufLen );
