/***************************************************************************************************

  File:     tiwi_framework.h
  Author:   LSR
  Version:  1.0

  Description:   Public interface for tiwi_framework.h and the tiwi error codes    


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

#include "json_helper.h"


#define ACTION_ID_BUF_LEN    25		// 24 bytes plus a null
#define TX_BUILDER_BUF_LEN  512     // number of bytes 
#define RX_PARSER_BUF_LEN   512     // number of bytes 

#define PROFILE_ACTION_BUF_LEN  64      // Length of an actions method string plus one for a null termination 


#define TC_STATUS_OK                            0
#define TC_STATUS_ERROR_GENERIC                 1
#define TC_STATUS_ERROR_CONFIG                  2
#define TC_STATUS_BUFFER_POOL_FULL              3
#define TC_STATUS_INVALID_BUFFER                4

#define TC_STATUS_ALLOCATION_ERROR              5
#define TC_STATUS_INVALID_QUEUE_NODE            6
#define TC_STATUS_QUEUE_ALLOC_FAILURE           7
#define TC_STATUS_QUEUE_FULL                    8
#define TC_STATUS_QUEUE_EMPTY                   9

#define TC_STATUS_NULL_ARGUMENT                 10
#define TC_STATUS_SOCKET_ERROR                  11
#define TC_STATUS_CONNECT_ERROR                 12
#define TC_STATUS_SEND_BYTES_MISMATCH           13
#define TC_STATUS_RECEIVE_ERROR                 14

#define TC_STATUS_SOCKET_CLOSE_ERROR            15
#define TC_STATUS_PARSE_ERROR                   16
#define TC_STATUS_UPDATE_ERROR                  17
#define TC_STATUS_DATA_TRUNCATED                18
#define TC_STATUS_TIMEOUT                       19

#define TC_STATUS_TUNNEL_PAYLOAD_TOO_LARGE      20
#define TC_STATUS_BUSY                          21
#define TC_STATUS_BUFFER_POOL_EMPTY             22
#define TC_STATUS_DUPLICATE_MSG                 23
#define TC_STATUS_DEVICE_ID_ERROR               24

#define TC_STATUS_DEVICE_KEY_ERROR              25
#define TC_STATUS_NETWORK_INTERFACE_NOT_READY   26
#define TC_STATUS_NO_SERVER_IP                  27



// This is the public interface to the tiwi embedded framework 
tc_uint16 GetPendingActionCount_framework( void );

TC_STATUS GetPendingAction_framework( void );

TC_STATUS SetAttributes_framework( tc_char* buffer, tc_uint32 buflen);

TC_STATUS ProcessReceiveByteBuffer_framework(tc_char* inputBuffer, tc_uint32 bufLen);

TC_STATUS TransmitViaNetwork_framework(tc_char* outputBuffer, tc_uint32 bufLen);

TC_STATUS ActionRouter_framework( tc_uint32 profileNameHash, stdParseParams_t * paramsPtr);

TC_STATUS HandleHttpServerResponse_framework(tc_char* inputBuffer, tc_uint32 bufLen);

TC_STATUS TransmitViaUart_framework(tc_char* outputBuffer, tc_uint32 bufLen);


