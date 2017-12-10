/*******************************************************************************
  @file tiwi_userLedU8Profile.h

  @desc Implementation of the public interface for the tiwiConnect userLedU8 profile



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
#ifndef _TIWI_USERLEDU8PROFILE_H
#define _TIWI_USERLEDU8PROFILE_H

typedef struct
{

} userLedU8AttData_t;


typedef struct
{
  tc_uint8 ColorParam;            // Change the LED color

} userLedU8_SetColorActionActData_t;


TC_STATUS ActionHandler_userLedU8_SetColorAction( stdParseParams_t* pStruct);

TC_STATUS UserCallback_userLedU8_SetColorAction(userLedU8_SetColorActionActData_t* pStruct );

#define userLedU8_SetColorAction_hash ( 0x7a2c161e )

#endif
