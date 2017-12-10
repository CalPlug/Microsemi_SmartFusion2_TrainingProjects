/*******************************************************************************
  @file tiwi_frameworkGenerated.c

  @desc Implementation of the framework code that is customized for the device profiles.

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

*******************************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>


#include "tiwi_datatypes.h"
#include "json_helper.h"
#include "tiwi_frameworkGenerated.h"
#include "tiwi_userLedU7Profile.h" 
#include "tiwi_userLedU5Profile.h" 
#include "tiwi_userLedU6Profile.h" 
#include "tiwi_userLedU8Profile.h" 



/*************************************************************************************************
 @fn ActionRouter_framework

 @brief Routes messages from the server to their local handler functions.


 @param tc_uint32 profileNameHash 32 bit hash of the profile name to speed lookup
 @param stdParseParams_t * paramsPtr "standard" struct for dealing with jsmn parser output.

 @return TC_STATUS status TC_STATUS_OK or fail code

*************************************************************************************************/
TC_STATUS  ActionRouter_framework( tc_uint32 profileActionHash, stdParseParams_t * paramsPtr)
{
    TC_STATUS status = TC_STATUS_OK; 
 
    switch ( profileActionHash )
    {
    case userLedU7_SetColorAction_hash:
        status = ActionHandler_userLedU7_SetColorAction( paramsPtr );
        break;
    case userLedU5_SetColorAction_hash:
        status = ActionHandler_userLedU5_SetColorAction( paramsPtr );
        break;
    case userLedU6_SetColorAction_hash:
        status = ActionHandler_userLedU6_SetColorAction( paramsPtr );
        break;
    case userLedU8_SetColorAction_hash:
        status = ActionHandler_userLedU8_SetColorAction( paramsPtr );
        break;
    default:
        break;
    }

    return status;
}


