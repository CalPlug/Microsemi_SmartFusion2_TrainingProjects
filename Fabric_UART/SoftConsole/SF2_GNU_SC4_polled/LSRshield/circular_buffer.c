/***************************************************************************************************

  File:     circular_buffer.c
  Author:   LSR
  Version:  1.1

  Description:      

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

#include "tiwi_datatypes.h"
#include "circular_buffer.h"
#include "json_framer.h"
#include "circular_buffer.h"

// Buffer to be the storage for the queue
static uint8_t byteBuffer[FIFO_BUF_LEN];  

/******************************************************************************
 * @fn  void tcqInit(tc_queue *tcq, int size)
 *
 *
 * @brief  Initialize the memory and data struct for the circular buffer 
 *
 * @param  tc_queue *tcq pointer to the queue to initialize
 * @param  int size  number of elements in the queue  minus one 
 * @return void
******************************************************************************/
void tcqInit(tc_queue *tcq, int size)
{
    tcq->size  = size;  // HAEDT
    tcq->items = (Item_t*)byteBuffer;
    tcq->start = 0;
    tcq->end   = 0;
}

/******************************************************************************
 * @fn  int tcqIsFull(tc_queue *tcq)
 *
 *
 * @brief  Checks to see if the queue is full 
 *
 * @param  tc_queue *tcq the queue we are working with 
 * @return true (i.e. 1) if the queue is full 
******************************************************************************/
int tcqIsFull(tc_queue *tcq)
{
    return (tcq->end + 1) % tcq->size == tcq->start;
}


/******************************************************************************
   @fn  int tcqIsFull(tc_queue *tcq)
  
  
   @brief  Checks to see if the queue is full 
  
   @param  tc_queue *tcq the queue we are working with 
   @return true (i.e. 1) if the queue is full 
******************************************************************************/
int tcqIsEmpty(tc_queue *tcq)
{
    int value = tcq->end == tcq->start;
    return value;
}

/******************************************************************************
   @fn  int tcqPush(tc_queue *tcq, Item_t *elem)
  
  
   @brief  Places and item on the queue 
  
   @param  tc_queue *tcq the queue we are working with 
   @param  pointer to the item to place on the queue

   @return status == STATUS_OK unless the queue is full  
******************************************************************************/
int tcqPush(tc_queue *tcq, Item_t *elem)
{
    int status =  STATUS_OK;

    if(true == tcqIsFull(tcq))
    {
        status = STATUS_QUEUE_FULL;
    }
    else
    {
        tcq->items[tcq->end] = *elem;
        tcq->end = (tcq->end + 1) % tcq->size;

        if (tcq->end == tcq->start)
        {
            tcq->start = (tcq->start + 1) % tcq->size; /* full, overwrite */
        }
    }

    return status;
}

/******************************************************************************
   @fn  int tcqPush(tc_queue *tcq, Item_t *elem)
  
  
   @brief  Places and item on the queue 
  
   @param  tc_queue *tcq the queue we are working with 
   @param  pointer to the item to place on the queue

   @return status == STATUS_OK unless the queue is full  
******************************************************************************/
int tcqPop(tc_queue *tcq, Item_t *item)
{
    if(true == tcqIsEmpty(tcq))
    {
        return STATUS_QUEUE_EMPTY;
        
    }

    *item = tcq->items[tcq->start];
    tcq->start = (tcq->start + 1) % tcq->size;

    return STATUS_OK;
}
