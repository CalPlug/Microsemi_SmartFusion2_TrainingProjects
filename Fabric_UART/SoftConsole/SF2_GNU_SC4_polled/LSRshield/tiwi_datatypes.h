/***************************************************************************************************
  @file tiwi_datatypes.h

  @desc Support code to allow build/test of the auto-generated tiwicw framework code


The MIT License (MIT)

Copyright (c) 2015 LSR

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
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

// Windows include
// #include "basetsd.h"

// IAR Includes
#include <stdint.h>
#include <stdbool.h>



#define tc_int8   int8_t
#define tc_uint8  uint8_t

#define tc_char char
#define tc_string char*

#define TC_STATUS int32_t

#define tc_bool    uint8_t

#define tc_int16   int16_t
#define tc_uint16  uint16_t

#define tc_int32  int32_t
#define tc_uint32 uint32_t

#define TC_STATUS_OK 0

#define TC_NULL NULL

#define TC_FALSE  0

#define TC_TRUE   1

#define MAX_BUF_LEN 128


