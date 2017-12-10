/*******************************************************************************
  @file tiwi_pushbuttonSwitches2Profile.h

  @desc Implementation of the public interface for the tiwiConnect pushbuttonSwitches2 profile



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
#ifndef _TIWI_PUSHBUTTONSWITCHES2PROFILE_H
#define _TIWI_PUSHBUTTONSWITCHES2PROFILE_H

typedef struct
{
  tc_bool sw1Pushbutton;          // SF2 KickStart Board Pushbutton switch SW1
  tc_bool sw2Pushbutton;          // SF2 KickStart Board Pushbutton switch SW1

} pushbuttonSwitches2AttData_t;


TC_STATUS SetAttributes_pushbuttonSwitches2( pushbuttonSwitches2AttData_t* pStruct);

TC_STATUS BuildParamsString_pushbuttonSwitches2( pushbuttonSwitches2AttData_t* pStruct, tc_char* resultBuffer , tc_uint32* numBytesPtr, tc_uint32 maxBytes);

#endif
