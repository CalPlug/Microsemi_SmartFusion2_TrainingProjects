/*******************************************************************************
  @file tiwi_userLedU7Profile.c

  @desc Implementation of the API functions for the tiwiConnect userLedU7 profile



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
 

#include "tiwi_userLedU7Profile.h" 

//By Stefan:
#include "../main.h"

/*************************************************************************************************
 @fn ActionHandler_userLedU7_SetColorAction

 @brief Handles actions sent from the server for the userLedU7 profile


 @param stdParseParams_t*  pStruct standard structure used when parsing json from the server

 @return TC_STATUS status TC_STATUS_OK or fail code

*************************************************************************************************/
TC_STATUS ActionHandler_userLedU7_SetColorAction( stdParseParams_t* pStruct)
{
    tc_uint32 intResult;
    TC_STATUS  status = TC_STATUS_OK;
    userLedU7_SetColorActionActData_t userLedU7_SetColorAction;
    
    status = GetIntegerByName(pStruct, "ColorParam",  &intResult);
    userLedU7_SetColorAction.ColorParam = (tc_uint8) intResult;

    status = UserCallback_userLedU7_SetColorAction( &userLedU7_SetColorAction);

    return status; 
}


/*************************************************************************************************
 @fn UserCallback_userLedU7

 @brief Called by the action handler, provides data from the server for the userLedU7 profile. 


 @param userLedU7_SetColorActionActData_t* pStruct Attribute struct to be populated with data from the server

 @return TC_STATUS status TC_STATUS_OK or fail code

*************************************************************************************************/
TC_STATUS UserCallback_userLedU7_SetColorAction(userLedU7_SetColorActionActData_t* pStruct )
{
    TC_STATUS status = TC_STATUS_OK; 
 
    // User code goes here 
	switch(pStruct->ColorParam)
	{
		case 0:
		{
			SetLED(2, 'F');
			break;
		}
		case 1:
		{
			SetLED(2, 'R');
			break;
		}
		case 2:
		{
			SetLED(2, 'G');
			break;
		}
		default:
		{
			SetLED(2, 'A');
			break;
		}
		break;
	} //switch

 
    return status; 
 }

