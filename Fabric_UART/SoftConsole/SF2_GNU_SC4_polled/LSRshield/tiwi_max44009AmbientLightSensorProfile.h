/*******************************************************************************
  @file tiwi_max44009AmbientLightSensorProfile.h

  @desc Implementation of the public interface for the tiwiConnect max44009AmbientLightSensor profile



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
#ifndef _TIWI_MAX44009AMBIENTLIGHTSENSORPROFILE_H
#define _TIWI_MAX44009AMBIENTLIGHTSENSORPROFILE_H

typedef struct
{
//by Stefan	  tc_float light_sensor;          // Measures ambient light in lux
	  float light_sensor;          // Measures ambient light in lux

} max44009AmbientLightSensorAttData_t;


TC_STATUS SetAttributes_max44009AmbientLightSensor( max44009AmbientLightSensorAttData_t* pStruct);

TC_STATUS BuildParamsString_max44009AmbientLightSensor( max44009AmbientLightSensorAttData_t* pStruct, tc_char* resultBuffer , tc_uint32* numBytesPtr, tc_uint32 maxBytes);

#endif
