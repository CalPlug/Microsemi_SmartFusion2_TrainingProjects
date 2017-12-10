/***************************************************************************************************

  File:     circular_buffer.h
  Author:   LSR
  Version:  1.0

  Description:   Public interface for circular_buffer.c   

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


#define STATUS_OK  0 
#define STATUS_QUEUE_EMPTY 3
#define STATUS_QUEUE_FULL  4

// buffer element type. defined by the application / use case. * 
typedef struct { uint8_t value; } Item_t;
   
/* Circular buffer object */
typedef struct
{
    int         size;   // max number of items
    int         start;  // first item on queue
    int         end;    // end of queue and next location to write to 
    Item_t     *items;  // array of queue elements 

} tc_queue;



// Public interface for circular_buffer.c

// local function declarations 
int tcqIsFull(tc_queue *tcq);
int tcqIsEmpty(tc_queue *tcq);

void tcqInit(tc_queue *tcq, int size);
int  tcqPush(tc_queue *tcq, Item_t *elem);
int  tcqPop(tc_queue *tcq, Item_t *elem);
int  tcqPopNoCheck(tc_queue *tcq, Item_t *elem);
