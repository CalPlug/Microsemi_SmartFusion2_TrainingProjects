/*******************************************************************************
  @file tiwi_max44009AmbientLightSensorProfile.c

  @desc Implementation of the API functions for the tiwiConnect max44009AmbientLightSensor profile



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
#include "tiwi_Framework.h" 
#include "jsmn.h" 
 

#include "tiwi_max44009AmbientLightSensorProfile.h" 

/*************************************************************************************************
 @fn SetAttributes_max44009AmbientLightSensor

 @brief Sends the data from the max44009AmbientLightSensor profile to the server


 @param max44009AmbientLightSensorAttData_t pStruct pointer to the attributes struct

 @return TC_STATUS status TC_STATUS_OK or fail code

*************************************************************************************************/
TC_STATUS SetAttributes_max44009AmbientLightSensor( max44009AmbientLightSensorAttData_t* pStruct)
{
    TC_STATUS  status = TC_STATUS_OK;
    tc_char resultBuffer [MAX_BUF_LEN];
    tc_uint32 numBytes;
    tc_uint32 maxBytes = MAX_BUF_LEN;
    
    status = BuildParamsString_max44009AmbientLightSensor( pStruct, resultBuffer,  &numBytes, maxBytes);
    
    status = SetAttributes_framework(resultBuffer, numBytes); 
 
    return status; 
}


/*************************************************************************************************
 @fn BuildParamsString_max44009AmbientLightSensor

 @brief Builds the params portion of the json rpc call for the max44009AmbientLightSensor profile


 @param max44009AmbientLightSensorAttData_t pStruct Pointer to the attributes struct
 @param tc_char*  resultBuffer completed string to insert in the rpc call
 @param tc_uint32*  numBytesPtr number of characters in the constructed string
 @param tc_uint32 maxBytes maximum number of characters to allow when constructing the string

 @return TC_STATUS status TC_STATUS_OK or fail code

*************************************************************************************************/
TC_STATUS BuildParamsString_max44009AmbientLightSensor( max44009AmbientLightSensorAttData_t* pStruct, tc_char* resultBuffer , tc_uint32* numBytesPtr, tc_uint32 maxBytes)
{
    TC_STATUS  status = TC_STATUS_OK;
    tc_uint32  charCount;
    
    charCount = snprintf( resultBuffer, maxBytes, " \"max44009AmbientLightSensor\":{\"light_sensor\":%.2f}", pStruct->light_sensor );

     *numBytesPtr = charCount;

    return status; 
}

