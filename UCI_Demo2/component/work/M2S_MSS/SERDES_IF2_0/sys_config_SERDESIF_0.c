/*=============================================================*/
/* Created by Microsemi SmartDesign Thu Feb 02 00:50:53 2017   */
/*                                                             */
/* Warning: Do not modify this file, it may lead to unexpected */
/*          functional failures in your design.                */
/*                                                             */
/*=============================================================*/

/*-------------------------------------------------------------*/
/* SERDESIF_0 Initialization                                   */
/*-------------------------------------------------------------*/

#include <stdint.h>
#include "../../CMSIS/sys_init_cfg_types.h"

const cfg_addr_value_pair_t g_m2s_serdes_0_config[] =
{
    { (uint32_t*)( 0x40028000 + 0x2028 ), 0x11C } /* SYSTEM_CONFIG_PHY_MODE_1 */ ,
    { (uint32_t*)( 0x40028000 + 0x1008 ), 0xF8 } /* LANE0_RXIDLE_MAX_ERRCNT_THR */ ,
    { (uint32_t*)( 0x40028000 + 0x2028 ), 0xF1C } /* SYSTEM_CONFIG_PHY_MODE_1 */ 
};

