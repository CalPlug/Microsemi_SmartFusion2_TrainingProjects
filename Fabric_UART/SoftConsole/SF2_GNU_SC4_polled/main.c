/*******************************************************************************
 *  SmartFusion2 KickStart Board  Microcontroller example program
*******************************************************************************/
//----------------------------------------------------------------------------
//      _____
//     *     *
//    *____   *____
//   * *===*   *==*
//  *___*===*___**  AVNET
//       *======*
//        *====*
//----------------------------------------------------------------------------
//
// This design is the property of Avnet.  Publication of this
// design is not authorized without written consent from Avnet.
//
// Please direct any questions or issues to the KickStart board Forum:
//     http://www.tbd??.com
//
// Disclaimer:
//    Avnet, Inc. makes no warranty for the use of this code or design.
//    This code is provided  "As Is". Avnet, Inc assumes no responsibility for
//    any errors, which may appear in this code, nor does it make a commitment
//    to update the information contained herein. Avnet, Inc specifically
//    disclaims any implied warranties of fitness for a particular purpose.
//                     Copyright(c) 2015 Avnet, Inc.
//                             All rights reserved.
//
//----------------------------------------------------------------------------

#include "drivers/mss_uart/mss_uart.h"
#include "drivers/mss_i2c/mss_i2c.h"
#include "drivers/mss_spi/mss_spi.h"
#include "drivers/mss_gpio/mss_gpio.h"
#include "drivers/mss_timer/mss_timer.h"
#include "CMSIS/system_m2sxxx.h"
#include "drivers_config/sys_config/sys_config.h"
#include <stdio.h>

#include "main.h"

#define true	1
#define false	0

//These includes are for using the LSR shield for the web/cloud server:
#include "LSRshield/json_framer.h"
#include "LSRshield/tiwi_framework.h"
#include "LSRshield/tiwi_datatypes.h"
#include "LSRshield/tiwi_pushbuttonSwitches2Profile.h"
#include "LSRshield/tiwi_max21105TemperatureSensorProfile.h"
#include "LSRshield/tiwi_max44009AmbientLightSensorProfile.h"


/*------------------------------------------------------------------------------
  Version Numbers for this Software:
  ------------------------------------------------------------------------------*/
#define CORETEX_M3_SOFTWARE_VERSION_MAJOR   2
#define CORETEX_M3_SOFTWARE_VERSION_MINOR   12

/*------------------------------------------------------------------------------
  FIC Definitions and Declarations:
  ------------------------------------------------------------------------------*/
//address of memory mapped register in fabric:
#define fabric_base_address				0x30001000
//Read Addresses:
#define fabric_status_address			fabric_base_address + 0x00
#define fabric_version_major_address	fabric_base_address + 0x04
#define fabric_version_minor_address	fabric_base_address + 0x08
#define arduino_config_address			fabric_base_address + 0x10
#define arduino_data_address			fabric_base_address + 0x14 /* r or w */
#define pmod1_config_address		 	fabric_base_address + 0x20
#define pmod1_data_address		 		fabric_base_address + 0x24 /* r or w */
#define pmod2_config_address		 	fabric_base_address + 0x30
#define pmod2_data_address		 		fabric_base_address + 0x34 /* r or w */
#define pmod3_config_address		 	fabric_base_address + 0x40
#define pmod3_data_address		 		fabric_base_address + 0x44 /* r or w */
//Write Addresses:
#define fabric_control_address			fabric_base_address + 0x00
#define LEDS_address					fabric_base_address + 0x04
#define led_pwm_brightness_address		fabric_base_address + 0x08
#define led_pwm_blinking_address		fabric_base_address + 0x0C
#define arduino_addr_address			fabric_base_address + 0x18
#define arduino_mode_address			fabric_base_address + 0x1C
#define pmod1_addr_address				fabric_base_address + 0x28
#define pmod1_mode_address				fabric_base_address + 0x2C
#define pmod2_addr_address				fabric_base_address + 0x38
#define pmod2_mode_address				fabric_base_address + 0x3C
#define pmod3_addr_address				fabric_base_address + 0x48
#define pmod3_mode_address				fabric_base_address + 0x4C
#define testpins_address		 		fabric_base_address + 0x50
#define testpins_select_address		 	fabric_base_address + 0x54
#define serialmux_select_address		fabric_base_address + 0x58

uint32_t LED_register = 0x000000FF; //All bits on
uint32_t fabric_status_register;
uint32_t arduino_status_register;
uint32_t pmod_status_register;
uint32_t fabric_version_major;
uint32_t fabric_version_minor;
uint32_t arduino_configuration_state;
uint32_t pmod1_configuration_state;
uint32_t pmod2_configuration_state;
uint32_t pmod3_configuration_state;

//Peripheral registers sub-addresses:
#define REGISTER_PMOD1_SERVO_PWM_LSB	0x01
#define REGISTER_PMOD1_SERVO_PWM_MSB	0x02
#define REGISTER_PMOD1_SERVO_PWM_ENABLE	0x03
//#define REGISTER_PMOD1_SERVO_CLKSCALE	0x04

#define REGISTER_PMOD2_ADC_SETTINGS		0x01
#define REGISTER_PMOD2_ADC0_OFFSET_LSB	0x02
#define REGISTER_PMOD2_ADC0_OFFSET_MSB	0x03
#define REGISTER_PMOD2_ADC1_OFFSET_LSB	0x04
#define REGISTER_PMOD2_ADC1_OFFSET_MSB	0x05
#define REGISTER_PMOD2_ADC_OFFSET_EN	0x06

//For lab exercise to control the LED colors:
volatile unsigned char ucLED_color_index = 0;
/*------------------------------------------------------------------------------
  UART Definitions and Declarations:
  ------------------------------------------------------------------------------*/
mss_uart_instance_t * const gp_my_uart0 = &g_mss_uart0;
mss_uart_instance_t * const gp_my_uart1 = &g_mss_uart1;

uint8_t uart1_rx_buff[256];
uint8_t uart1_tx_buff[256];
unsigned char uart1_rx_buff_getptr;
unsigned char uart1_rx_buff_putptr;
unsigned char uart1_tx_buff_getptr;
unsigned char uart1_tx_buff_putptr;

uint8_t uart1_temp_buff[256];
unsigned char uart1_temp_buff_index;

uint8_t uart0_rx_buff[256];
uint8_t uart0_tx_buff[256];
unsigned char uart0_rx_buff_getptr;
unsigned char uart0_rx_buff_putptr;
unsigned char uart0_tx_buff_getptr;
unsigned char uart0_tx_buff_putptr;

//unsigned char sUART_tx_string[255];
unsigned char sUART_tx_string[100];

volatile unsigned char HostUart_State;
#define STATE_HOST_UART_WAIT_COMMAND       0
#define STATE_HOST_UART_GET_LENGTH1        1
#define STATE_HOST_UART_PROCESS_COMMAND    2

unsigned char ucHostCommand;
unsigned char ucHostCommandLength;
unsigned char ucHostCommandIndex;
#define CMD_DATA_TO_BLE         	'B'
#define CMD_GPIO_LSB            	'g'
#define CMD_GPIO_MSB            	'G'
#define CMD_READLIGHT				'L'
#define CMD_READMOTION				'M'
#define CMD_READTEMPERATURE			'E'
#define CMD_READMAX21105_INFO		'I'
#define CMD_SET_LED					'D'
#define CMD_LED_PWM					'e'
#define CMD_GET_STATUS				'S'
#define CMD_BLE_COMMS_CHANGE		'C'
#define CMD_BLE_SET_CMDMLDP			'K'
#define CMD_WRITE_FABRIC			'w'
#define CMD_READ_FABRIC				'r'
#define CMD_BLE_FACTORY_RESET		'F'
#define CMD_ARM_LIGHT_INT			'H'
#define CMD_PING_ALIVE				'P'
#define CMD_GET_VERSIONS			'V'
#define CMD_SELECT_TESTPINS			'T'
#define CMD_UPDATE_FABRIC_STATUS	'U'
#define CMD_WIFI_ENABLE				'W'
#define CMD_SET_PERIPHERAL_MODE		'J'
#define CMD_CONFIGURE_DSP			'N'
#define CMD_WRITE_DAC				'a'
#define CMD_SET_SERVO_PARAMETERS	'b'
#define CMD_SET_SECURITY_PARAMETERS	's'

#define TOHOST_MSG_DATA_FROM_BLE		'B'
#define TOHOST_MSG_TEXT					'T'
#define TOHOST_MSG_LIGHT				'L'
#define TOHOST_MSG_MOTION				'M'
#define TOHOST_MSG_TEMPERATURE			'E'
#define TOHOST_MSG_MAX21105_INFO		'I'
#define TOHOST_MSG_STATUS				'S'
#define TOHOST_MSG_READ_FABRIC			'r'
#define TOHOST_MSG_PING_ALIVE			'P'
#define TOHOST_MSG_FIRMWARE_VERSIONS	'V'
#define TOHOST_MSG_ADC_DATA				'D'
#define TOHOST_MSG_PASSWORD				'p'

unsigned char ucBT_Connected;
unsigned char bBluetooth_usable;

volatile unsigned char BleUart_State;
#define STATE_BLE_UART_WAIT_PRECOMMAND1		0
#define STATE_BLE_UART_WAIT_PRECOMMAND2		1
#define STATE_BLE_UART_WAIT_COMMAND			2
#define STATE_BLE_UART_GET_LENGTH1			3
#define STATE_BLE_UART_PROCESS_COMMAND		4

#define BLE_CMD_SET_LED						'D'
#define BLE_CMD_GET_STATUS					'S'
#define BLE_CMD_READLIGHT					'L'
#define BLE_CMD_READMOTION					'M'
#define BLE_CMD_READTEMPERATURE				'T'
#define BLE_CMD_PASSWORD					'p'


/*------------------------------------------------------------------------------
  Wi-Fi Definitions and Declarations:
  ------------------------------------------------------------------------------*/
volatile unsigned char bWifiEnabled;
volatile unsigned char bSendWifiUpdate;
pushbuttonSwitches2AttData_t Button_AttData;
max21105TemperatureSensorAttData_t Temperature_AttData;
max44009AmbientLightSensorAttData_t LightSensor_AttData;

float fTemperature;
float flux_value;

/*------------------------------------------------------------------------------
  Demo and Declarations:
  ------------------------------------------------------------------------------*/
unsigned char bServoEnabled;

/*------------------------------------------------------------------------------
  Security Definitions and Declarations:
  ------------------------------------------------------------------------------*/
unsigned char bSecurityModeEnabled;
unsigned char bSecurityAccessGranted;
unsigned char bSecurityAccessAllowed;


/*------------------------------------------------------------------------------
  GPIO Definitions and Declarations:
  ------------------------------------------------------------------------------*/
uint32_t gpio_pattern;
uint32_t gpio_iput_pattern;


/*------------------------------------------------------------------------------
  Light Sensor Definitions and Declarations:
  ------------------------------------------------------------------------------*/
//A0 = LSB of address (bit 1) = 1 :
//#define MAX44009_ADDR   0x96 = 10010110b
//The SF2 call ignores the LSB and takes the 7-bit address:
//Use when A0 is pulled high:
//#define MAX44009_ADDR   0x4B
//Use when A0 is low:
#define MAX44009_ADDR   0x4A
// begin definition of slave addresses for MAX44009
#define INT_STATUS      0x00
#define INT_ENABLE      0x01
#define CONFIG_REG      0x02
#define HIGH_BYTE       0x03
#define LOW_BYTE        0x04
#define THRESH_HIGH     0x05
#define THRESH_LOW      0x06
#define THRESH_TIMER    0x07
// end definition of slave addresses for MAX44009

/*------------------------------------------------------------------------------
  Motion Sensor Definitions and Declarations:
  ------------------------------------------------------------------------------*/
//#define MAX21105_ADDR   0xBO = 10110000b
//Ignore LSB = 01011000b:
#define MAX21105_ADDR   0x58
// begin definition of slave addresses for MAX21105
//BANK CM registers:
#define WHO_AM_I			0x20
#define SILICON_REV_OTP		0x21
#define EXT_STATUS			0x22
#define SYSTEM_STATUS		0x23
#define GYRO_X_H			0x24
#define GYRO_X_L			0x25
#define GYRO_Y_H			0x26
#define GYRO_Y_L			0x27
#define GYRO_Z_H			0x28
#define GYRO_Z_L			0x29
#define ACCE_X_H			0x2A
#define ACCE_X_L			0x2B
#define ACCE_Y_H			0x2C
#define ACCE_Y_L			0x2D
#define ACCE_Z_H			0x2E
#define ACCE_Z_L			0x2F
#define TEMP_H				0x30
#define TEMP_L				0x31
#define TRM_BNK_REG			0x38
#define FIFO_COUNT			0x3C
#define FIFO_STATUS			0x3D
#define FIFO_DATA			0x3E
#define RST_REG				0x3F
//Bank 00 registers:
#define SET_PWR				0x00
#define SNS_CFG_1			0x01
#define SNS_CFG_2			0x02
#define SNS_CFG_3			0x03
#define SET_ACC_PWR			0x04
#define ACC_CFG_1			0x05
#define ACC_CFG_2			0x06
#define SET_TEMP_DR			0x13
#define SET_PU_PD_PAD		0x14
#define SET_I2C_PAD			0x15
#define MIF_CFG				0x16
#define FIFO_STORE			0x17
#define FIFO_THS			0x18
#define FIFO_CFG			0x19
#define OTP_STS_CFG			0x1C
//Bank 01 registers:
#define INT_REF_X			0x00
#define INT_REF_Y			0x01
#define INT_REF_Z			0x02
#define INT_DEB_X			0x03
#define INT_DEB_Y			0x04
#define INT_DEB_Z			0x05
#define INT_THS_X			0x06
#define INT_THS_Y			0x07
#define INT_THS_Z			0x08
#define INT_COND			0x09
#define INT_CFG_1			0x0A
#define INT_CFG_2			0x0B
#define INT_TMO_CFG			0x0C
#define INT_STATUS_UL		0x0D
#define INT_STS				0x0E
#define INT_MSK				0x0F
#define INT_SRC_CFG			0x17
#define SERIAL_NUM_B5		0x1A
#define SERIAL_NUM_B4		0x1B
#define SERIAL_NUM_B3		0x1C
#define SERIAL_NUM_B2		0x1D
#define SERIAL_NUM_B1		0x1E
#define SERIAL_NUM_B0		0x1F
//Bank 02 registers:
#define BIAS_COMP_GX_MSB	0x13
#define BIAS_COMP_GX_LSB	0x14
#define BIAS_COMP_GY_MSB	0x15
#define BIAS_COMP_GY_LSB	0x16
#define BIAS_COMP_GZ_MSB	0x17
#define BIAS_COMP_GZ_LSB	0x18
#define BIAS_COMP_AX		0x19
#define BIAS_COMP_AY		0x1A
#define BIAS_COMP_AZ		0x1B
#define GYR_ODR_TRIM		0x1F
// end definition of slave addresses for MAX21105

/*------------------------------------------------------------------------------
  Bluetooth Definitions and Declarations:
  ------------------------------------------------------------------------------*/
uint8_t BLE_toHost_buff[256];
unsigned char BLE_toHost_buff_getptr;
unsigned char BLE_toHost_buff_putptr;

unsigned char bMLDP_mode;
volatile unsigned char bMLDP_user_ready;

    //Macro's for BLE controls
#define BLE_WAKE_HW_HI gpio_pattern |= 0x8000;MSS_GPIO_set_outputs( gpio_pattern ); // bit 15
#define BLE_WAKE_HW_LO gpio_pattern &= 0x7FFF;MSS_GPIO_set_outputs( gpio_pattern ); // bit 15
#define BLE_WAKE_SW_HI gpio_pattern |= 0x4000;MSS_GPIO_set_outputs( gpio_pattern ); // bit 14
#define BLE_WAKE_SW_LO gpio_pattern &= 0xBFFF;MSS_GPIO_set_outputs( gpio_pattern ); // bit 14
#define BLE_nCMD_HI    gpio_pattern |= 0x0800;MSS_GPIO_set_outputs( gpio_pattern ); // bit 11
#define BLE_nCMD_LO    gpio_pattern &= 0xF7FF;MSS_GPIO_set_outputs( gpio_pattern ); // bit 11


/*------------------------------------------------------------------------------
  Test Pins:
  ------------------------------------------------------------------------------*/
unsigned char ucTestpinShadow = 0;
#define TESTPIN0_HI ucTestpinShadow |=0x01;	*((uint32_t volatile *) (testpins_address))	= ucTestpinShadow;
#define TESTPIN0_LO ucTestpinShadow &=0xFE;	*((uint32_t volatile *) (testpins_address))	= ucTestpinShadow;
#define TESTPIN1_HI ucTestpinShadow |=0x02;	*((uint32_t volatile *) (testpins_address))	= ucTestpinShadow;
#define TESTPIN1_LO ucTestpinShadow &=0xFD;	*((uint32_t volatile *) (testpins_address))	= ucTestpinShadow;
#define TESTPIN2_HI ucTestpinShadow |=0x04;	*((uint32_t volatile *) (testpins_address))	= ucTestpinShadow;
#define TESTPIN2_LO ucTestpinShadow &=0xFB;	*((uint32_t volatile *) (testpins_address))	= ucTestpinShadow;
#define TESTPIN3_HI ucTestpinShadow |=0x08;	*((uint32_t volatile *) (testpins_address))	= ucTestpinShadow;
#define TESTPIN3_LO ucTestpinShadow &=0xF7;	*((uint32_t volatile *) (testpins_address))	= ucTestpinShadow;
#define TESTPIN4_HI ucTestpinShadow |=0x10;	*((uint32_t volatile *) (testpins_address))	= ucTestpinShadow;
#define TESTPIN4_LO ucTestpinShadow &=0xEF;	*((uint32_t volatile *) (testpins_address))	= ucTestpinShadow;
#define TESTPIN5_HI ucTestpinShadow |=0x20;	*((uint32_t volatile *) (testpins_address))	= ucTestpinShadow;
#define TESTPIN5_LO ucTestpinShadow &=0xDF;	*((uint32_t volatile *) (testpins_address))	= ucTestpinShadow;
#define TESTPIN6_HI ucTestpinShadow |=0x40;	*((uint32_t volatile *) (testpins_address))	= ucTestpinShadow;
#define TESTPIN6_LO ucTestpinShadow &=0xBF;	*((uint32_t volatile *) (testpins_address))	= ucTestpinShadow;
#define TESTPIN7_HI ucTestpinShadow |=0x80;	*((uint32_t volatile *) (testpins_address))	= ucTestpinShadow;
#define TESTPIN7_LO ucTestpinShadow &=0x7F;	*((uint32_t volatile *) (testpins_address))	= ucTestpinShadow;


/*------------------------------------------------------------------------------
  I2C Definitions and Declarations:
  ------------------------------------------------------------------------------*/
// I2C master serial address:
#define I2C0MASTER_SER_ADDR     0x21
#define I2C1MASTER_SER_ADDR     0x30
#define I2C0_MASTER &g_mss_i2c0
#define I2C1_MASTER &g_mss_i2c1
 // Receive buffer size:
#define I2C_BUFFER_SIZE    32u
#define ENTER          13u
 // I2C operation timeout value in mS. Define as MSS_I2C_NO_TIMEOUT to disable the timeout functionality.
//#define DEMO_I2C_TIMEOUT 3000u
//Rather use 200 ms:
#define DEMO_I2C_TIMEOUT 200u

//Have you experienced any of the following in your C or C++ embedded code?
//    Code that works fine--until you enable compiler optimizations
//    Code that works fine--until interrupts are enabled
//    Flaky hardware drivers
//    RTOS tasks that work fine in isolation--until some other task is spawned
//If you answered yes to any of the above, it's likely that you didn't use the C keyword volatile.
//C's volatile keyword is a qualifier that is applied to a variable when it is declared.
//It tells the compiler that the value of the variable may change at any time
//without any action being taken by the code the compiler finds nearby.
volatile unsigned char bMyLocalTimoutEnabled;
volatile unsigned char bMyLocalTimoutExpired;
volatile int iMyLocalTimoutCount;
volatile int iServoTimerTickCount;

volatile unsigned char bBleEchoTimoutEnabled;
volatile int iBleEchoTimoutCount;

volatile unsigned char ucReadLight;
volatile unsigned char ucReadMotion;
volatile unsigned char ucLightThresholdTriggered;
volatile unsigned char ucButtonWasPushed;
volatile unsigned char ucBleConnectedStatusChanged;

unsigned char ucLightIntSeconds;
unsigned char ucLightIntEnabled = 0;
unsigned char ucMotionIntEnabled = 0;
unsigned char ucLightUnused;
unsigned char ucLightThresholdIntEnabled = 0;
unsigned char ucLightThresholdUpper;
unsigned char ucLightThresholdLower;
unsigned char ucLightThresholdTimout;

// Counts of I2C data sent by master and received by slave:
//static uint8_t g_tx_length=0x00;
//static uint8_t g_rx_length=0x00;

/*==============================================================================
  Private functions.
  ------------------------------------------------------------------------------*/
unsigned char nibble_to_hexchar_MSN(unsigned char byte_in);
unsigned char nibble_to_hexchar_LSN(unsigned char byte_in);
static void soft_delay100ms(unsigned int delayms);

/*------------------------------------------------------------------------------
 * Send a string to the host UART, adding a command indicator and length before it.
 * Note that it always sends the whole length of the array
 * It does not count to the null termination first.
 *------------------------------------------------------------------------------*/
void send_host_string(void)
{
    unsigned char ucMsgLength;
    unsigned char ucMsgIndex = 0;
    ucMsgLength = sizeof(sUART_tx_string); //Length of message +6?
    uart1_tx_buff[uart1_tx_buff_putptr++] = TOHOST_MSG_TEXT; //Character for text to SF2
    uart1_tx_buff[uart1_tx_buff_putptr++] = ucMsgLength; //Length of message

    while (ucMsgIndex != ucMsgLength)
    {
    	uart1_tx_buff[uart1_tx_buff_putptr++] = sUART_tx_string[ucMsgIndex];
    	ucMsgIndex++;
    }
} //send_host_string()

/*------------------------------------------------------------------------------
 * Send a string to the host UART without using the host out buffer
 * Use this when you have too much text to send before the "ISR" gets time to run.
 *------------------------------------------------------------------------------*/
void send_direct_host_string(void)
{
    unsigned char ucTxChar;
	ucTxChar = TOHOST_MSG_TEXT; //Character for text to SF2
    MSS_UART_polled_tx(gp_my_uart1, &ucTxChar, 1);
    ucTxChar = sizeof(sUART_tx_string); //Length of message +6?
    MSS_UART_polled_tx(gp_my_uart1, &ucTxChar, 1);
    MSS_UART_polled_tx(gp_my_uart1, sUART_tx_string, sizeof(sUART_tx_string)); //Send string
} //send_direct_host_string()

/*------------------------------------------------------------------------------
 * Set a timeout in 10ms ticks.
 *------------------------------------------------------------------------------*/
void SetMyLocalTimeout(int iTimeout)
{
	bMyLocalTimoutEnabled = false; //to protect the change
	iMyLocalTimoutCount = iTimeout;
	bMyLocalTimoutExpired = false;
	bMyLocalTimoutEnabled = true;
}

/*------------------------------------------------------------------------------
 * Wait for a number of 10 ms system ticks.
 *------------------------------------------------------------------------------*/
void WaitLocal10msTimerTicks(int iTicksToWait)
{
	SetMyLocalTimeout(iTicksToWait);
	while (bMyLocalTimoutExpired == false)
	{} //just wait
}




/*------------------------------------------------------------------------------
 * Perform I2C write transaction.
 *------------------------------------------------------------------------------*/
mss_i2c_status_t I2C_WriteByte(mss_i2c_instance_t * I2C_CHANNEL, unsigned char ucDeviceAddress, unsigned char ucRegisterAddress, unsigned char ucData)
{
    mss_i2c_status_t status;
    unsigned char txbuffer [2];

    txbuffer[0] = ucRegisterAddress;
    txbuffer[1] = ucData;

    MSS_I2C_write(I2C_CHANNEL, ucDeviceAddress, txbuffer, 2, MSS_I2C_RELEASE_BUS);
    status = MSS_I2C_wait_complete(I2C_CHANNEL, DEMO_I2C_TIMEOUT);

    return status;
} //I2C_WriteByte()

/*------------------------------------------------------------------------------
 * Perform I2C read of a single byte.
 *------------------------------------------------------------------------------*/
mss_i2c_status_t I2C_ReadByte(mss_i2c_instance_t * I2C_CHANNEL, unsigned char ucDeviceAddress, unsigned char ucRegisterAddress, unsigned char *ucData)
{
    mss_i2c_status_t status;

	MSS_I2C_write_read(I2C_CHANNEL,
			   ucDeviceAddress,
			   &ucRegisterAddress,   //Data to write (could be a buffer)
			   1,					//Write length
			   ucData,				//Where to return the read data
			   1,					//Read length
			   MSS_I2C_RELEASE_BUS);

	status = MSS_I2C_wait_complete(I2C_CHANNEL, DEMO_I2C_TIMEOUT);
    return status;
} //I2C_ReadByte()

/*------------------------------------------------------------------------------
 * Perform I2C read of more than 1 byte.
 *------------------------------------------------------------------------------*/
mss_i2c_status_t I2C_ReadBytes(mss_i2c_instance_t * I2C_CHANNEL, unsigned char ucDeviceAddress, unsigned char ucRegisterAddress, unsigned char *ucData, unsigned char ucLength)
{
    mss_i2c_status_t status;

    MSS_I2C_write_read(I2C_CHANNEL,
				   ucDeviceAddress,
				   &ucRegisterAddress,   //Data to write (could be a buffer)
				   1,					//Write length
				   ucData,				//Where to return the read data
				   ucLength,					//Read length
				   MSS_I2C_RELEASE_BUS);

      status = MSS_I2C_wait_complete(I2C_CHANNEL, DEMO_I2C_TIMEOUT);

    return status;
} //I2C_ReadBytes()

void ArmLightInterrupt()
{
	unsigned char ucLightIntStatus = 0;

	I2C_WriteByte(I2C0_MASTER, MAX44009_ADDR, CONFIG_REG, 0x80); // set to run continuously

	I2C_WriteByte(I2C0_MASTER, MAX44009_ADDR, THRESH_HIGH, ucLightThresholdUpper); // High Threshold
    I2C_WriteByte(I2C0_MASTER, MAX44009_ADDR, THRESH_LOW, ucLightThresholdLower); // Low Threshold
    I2C_WriteByte(I2C0_MASTER, MAX44009_ADDR, THRESH_TIMER, ucLightThresholdTimout); // Disable the timer, interrupt only on thresholds

    if(ucLightThresholdIntEnabled)
    {
    	I2C_ReadByte(I2C0_MASTER, MAX44009_ADDR, INT_STATUS, &ucLightIntStatus); // Read interrupt status to clear it
        I2C_WriteByte(I2C0_MASTER, MAX44009_ADDR, INT_ENABLE, 0x01); // Enable Interrupt
    }
    else
    {
        I2C_WriteByte(I2C0_MASTER, MAX44009_ADDR, INT_ENABLE, 0x00); // Disable Interrupt
    }
} //ArmLightInterrupt

void read_light_sensor()
{
	//unsigned char Ic2ReadData[2];
	unsigned char highByte = 0;
	unsigned char lowByte = 0;

	//Ic2ReadData[0] = 0;
	//Ic2ReadData[1] = 0;
	//This needs to be part of initialization  otherwise you do it every time and the first read might be wrong:
	I2C_WriteByte(I2C0_MASTER, MAX44009_ADDR, CONFIG_REG, 0x80); // set to run continuously

	//I2C_ReadBytes(I2C0_MASTER, MAX44009_ADDR, HIGH_BYTE, &highByte, 1); //Same as below
	I2C_ReadByte(I2C0_MASTER, MAX44009_ADDR, HIGH_BYTE, &highByte);
	//The datasheet says it is best to do the two reads without a stop between them but the SF2 I2C calls seem not to have that option
    //I2C_ReadBytes(I2C0_MASTER, MAX44009_ADDR, LOW_BYTE, &lowByte, 1); //Same as below
    I2C_ReadByte(I2C0_MASTER, MAX44009_ADDR, LOW_BYTE, &lowByte);
	//sprintf((char *)sUART_tx_string,"Light High Byte: %i \n", highByte);
	//send_host_string();
	//sprintf((char *)sUART_tx_string,"Light Low Byte: %i \n", lowByte);
	//send_host_string();
	//This does not work.  One needs to do two separate reads, this below will try to read two bytes from a single write
	//I2C_ReadBytes(MAX44009_ADDR, HIGH_BYTE, &Ic2ReadData[0], 2);
	//highByte = Ic2ReadData[0];
	//lowByte = Ic2ReadData[1];

    int ucLux_exponent = ((highByte >> 4) & 0x0F);
    int ucLux_mantissa = ((highByte & 0x0F) << 4) + (lowByte & 0x0F);
    flux_value = 0.045 * ucLux_mantissa * (1 << ucLux_exponent);
    if(ucLightThresholdTriggered)
    {
    	//I2C_ReadByte(I2C0_MASTER, MAX44009_ADDR, INT_STATUS, &ucLightIntStatus); // Read interrupt status to clear it
        I2C_WriteByte(I2C0_MASTER, MAX44009_ADDR, INT_ENABLE, 0x00); // Disable Interrupt
    }

    //Send "Light" message to host:
    uart1_tx_buff[uart1_tx_buff_putptr++] = TOHOST_MSG_LIGHT; //Character for Light Sensor data to SF2
    uart1_tx_buff[uart1_tx_buff_putptr++] = 4;        //message length
    uart1_tx_buff[uart1_tx_buff_putptr++] = highByte; //light reading MSB
    uart1_tx_buff[uart1_tx_buff_putptr++] = lowByte;  //light reading LSB
    uart1_tx_buff[uart1_tx_buff_putptr++] = ucLightIntEnabled;  //Whether the Interrupt is enabled
    uart1_tx_buff[uart1_tx_buff_putptr++] = ucLightThresholdTriggered;  //Whether the Light threshold was triggered

	gpio_iput_pattern = MSS_GPIO_get_inputs();
	ucBT_Connected = gpio_iput_pattern & 0x20; //Check if Bluetooth is connected
	bBluetooth_usable = ucBT_Connected && (!bMLDP_mode || (bMLDP_mode && bMLDP_user_ready));
    bSecurityAccessAllowed = !bSecurityModeEnabled || (bSecurityModeEnabled && bSecurityAccessGranted);
   	if (bBluetooth_usable && bMLDP_mode && bMLDP_user_ready && bSecurityAccessAllowed)
	{	//We will get an error if we send MLDP data to the device when it is not connected (MLDP gets enables when it connects)
	    //Send the same information to BLE using MLDP:
		uart0_tx_buff[uart0_tx_buff_putptr++] = '=';
		uart0_tx_buff[uart0_tx_buff_putptr++] = '>';
		uart0_tx_buff[uart0_tx_buff_putptr++] = 'L';
		uart0_tx_buff[uart0_tx_buff_putptr++] = nibble_to_hexchar_MSN(highByte);
		uart0_tx_buff[uart0_tx_buff_putptr++] = nibble_to_hexchar_LSN(highByte);
		uart0_tx_buff[uart0_tx_buff_putptr++] = nibble_to_hexchar_MSN(lowByte);
		uart0_tx_buff[uart0_tx_buff_putptr++] = nibble_to_hexchar_LSN(lowByte);
	    if (ucLightIntEnabled)
    	{
			uart0_tx_buff[uart0_tx_buff_putptr++] = '1';
    	}
	    else
	    {
			uart0_tx_buff[uart0_tx_buff_putptr++] = '0';
	    }
	    if (ucLightThresholdTriggered)
    	{
			uart0_tx_buff[uart0_tx_buff_putptr++] = '1';
    	}
	    else
	    {
			uart0_tx_buff[uart0_tx_buff_putptr++] = '0';
	    }
	    uart0_tx_buff[uart0_tx_buff_putptr++] = '\r';
		uart0_tx_buff[uart0_tx_buff_putptr++] = '\n';
	} //if (bBluetooth_usable)

} //read_light_sensor

void read_motion_sensor()
{
	unsigned char ucSystemStatus = 0;
	unsigned char ucGyroX_MSB = 0;
	unsigned char ucGyroX_LSB = 0;
	unsigned char ucGyroY_MSB = 0;
	unsigned char ucGyroY_LSB = 0;
	unsigned char ucGyroZ_MSB = 0;
	unsigned char ucGyroZ_LSB = 0;
	unsigned char ucAccelX_MSB = 0;
	unsigned char ucAccelX_LSB = 0;
	unsigned char ucAccelY_MSB = 0;
	unsigned char ucAccelY_LSB = 0;
	unsigned char ucAccelZ_MSB = 0;
	unsigned char ucAccelZ_LSB = 0;
	unsigned char ucGyro_DataReady = 0;
	unsigned char ucAccel_DataReady = 0;

	///////////////////////////////////////////////////
	//Simple Read-Out Sequence, No FIFO, No Interrupts:
	///////////////////////////////////////////////////
	//Configuration
	I2C_WriteByte(I2C1_MASTER, MAX21105_ADDR, EXT_STATUS, 0x00);	// Select User Bank #0 for settings below
	I2C_WriteByte(I2C1_MASTER, MAX21105_ADDR, SNS_CFG_1 , 0x10);	// 10Hz BW (bandwidth)
	I2C_WriteByte(I2C1_MASTER, MAX21105_ADDR, SNS_CFG_2,  0x01);	// 4 KHz ODR (output data rate)
	I2C_WriteByte(I2C1_MASTER, MAX21105_ADDR, SET_PWR,    0x78);	// Power mode: Acc Low Noise + Gyro Low Noise

	//System Status register bit 0 = gyro_dr and bit 2 = accelerometer_dr
	ucGyro_DataReady = 0;
	SetMyLocalTimeout(10); //100 ms
	while ((ucGyro_DataReady == 0) && (bMyLocalTimoutExpired == false))
	{ //Wait for Gyro data to become ready
		I2C_ReadByte(I2C1_MASTER, MAX21105_ADDR, SYSTEM_STATUS, &ucSystemStatus);
		ucGyro_DataReady = ucSystemStatus & 0x01; //bit 0
	} //Wait for Gyro data to become ready
	//Read the Gyro values:
	I2C_ReadByte(I2C1_MASTER, MAX21105_ADDR, GYRO_X_H, &ucGyroX_MSB);
	I2C_ReadByte(I2C1_MASTER, MAX21105_ADDR, GYRO_X_L, &ucGyroX_LSB);
	I2C_ReadByte(I2C1_MASTER, MAX21105_ADDR, GYRO_Y_H, &ucGyroY_MSB);
	I2C_ReadByte(I2C1_MASTER, MAX21105_ADDR, GYRO_Y_L, &ucGyroY_LSB);
	I2C_ReadByte(I2C1_MASTER, MAX21105_ADDR, GYRO_Z_H, &ucGyroZ_MSB);
	I2C_ReadByte(I2C1_MASTER, MAX21105_ADDR, GYRO_Z_L, &ucGyroZ_LSB);

	ucAccel_DataReady = 0;
	SetMyLocalTimeout(10); //100 ms
	while ((ucAccel_DataReady == 0) && (bMyLocalTimoutExpired == false))
	{ //Wait for Accelerometer data to become ready
		I2C_ReadByte(I2C1_MASTER, MAX21105_ADDR, SYSTEM_STATUS, &ucSystemStatus);
		ucAccel_DataReady = ucSystemStatus & 0x04; //bit 2
	} //Wait for Accelerometer data to become ready
	//Read the Accelerometer values:
	I2C_ReadByte(I2C1_MASTER, MAX21105_ADDR, ACCE_X_H, &ucAccelX_MSB);
	I2C_ReadByte(I2C1_MASTER, MAX21105_ADDR, ACCE_X_L, &ucAccelX_LSB);
	I2C_ReadByte(I2C1_MASTER, MAX21105_ADDR, ACCE_Y_H, &ucAccelY_MSB);
	I2C_ReadByte(I2C1_MASTER, MAX21105_ADDR, ACCE_Y_L, &ucAccelY_LSB);
	I2C_ReadByte(I2C1_MASTER, MAX21105_ADDR, ACCE_Z_H, &ucAccelZ_MSB);
	I2C_ReadByte(I2C1_MASTER, MAX21105_ADDR, ACCE_Z_L, &ucAccelZ_LSB);

	//Send "Motion" message to host:
    uart1_tx_buff[uart1_tx_buff_putptr++] = TOHOST_MSG_MOTION; //Character for Motion Sensor data to SF2
    uart1_tx_buff[uart1_tx_buff_putptr++] = 13;        //message length
    uart1_tx_buff[uart1_tx_buff_putptr++] = ucGyroX_MSB;
    uart1_tx_buff[uart1_tx_buff_putptr++] = ucGyroX_LSB;
    uart1_tx_buff[uart1_tx_buff_putptr++] = ucGyroY_MSB;
    uart1_tx_buff[uart1_tx_buff_putptr++] = ucGyroY_LSB;
    uart1_tx_buff[uart1_tx_buff_putptr++] = ucGyroZ_MSB;
    uart1_tx_buff[uart1_tx_buff_putptr++] = ucGyroZ_LSB;
    uart1_tx_buff[uart1_tx_buff_putptr++] = ucAccelX_MSB;
    uart1_tx_buff[uart1_tx_buff_putptr++] = ucAccelX_LSB;
    uart1_tx_buff[uart1_tx_buff_putptr++] = ucAccelY_MSB;
    uart1_tx_buff[uart1_tx_buff_putptr++] = ucAccelY_LSB;
    uart1_tx_buff[uart1_tx_buff_putptr++] = ucAccelZ_MSB;
    uart1_tx_buff[uart1_tx_buff_putptr++] = ucAccelZ_LSB;
    uart1_tx_buff[uart1_tx_buff_putptr++] = ucMotionIntEnabled;  //Whether the Interrupt is enabled

	gpio_iput_pattern = MSS_GPIO_get_inputs();
	ucBT_Connected = gpio_iput_pattern & 0x20; //Check if Bluetooth is connected
	bBluetooth_usable = ucBT_Connected && (!bMLDP_mode || (bMLDP_mode && bMLDP_user_ready));
    bSecurityAccessAllowed = !bSecurityModeEnabled || (bSecurityModeEnabled && bSecurityAccessGranted);
   	if (bBluetooth_usable && bMLDP_mode && bMLDP_user_ready && bSecurityAccessAllowed)
	{	//We will get an error if we send MLDP data to the device when it is not connected (MLDP gets enables when it connects)
	    //Send the same information to BLE using MLDP:
		uart0_tx_buff[uart0_tx_buff_putptr++] = '=';
		uart0_tx_buff[uart0_tx_buff_putptr++] = '>';
		uart0_tx_buff[uart0_tx_buff_putptr++] = 'M';
		uart0_tx_buff[uart0_tx_buff_putptr++] = nibble_to_hexchar_MSN(ucGyroX_MSB);
		uart0_tx_buff[uart0_tx_buff_putptr++] = nibble_to_hexchar_LSN(ucGyroX_MSB);
		uart0_tx_buff[uart0_tx_buff_putptr++] = nibble_to_hexchar_MSN(ucGyroX_LSB);
		uart0_tx_buff[uart0_tx_buff_putptr++] = nibble_to_hexchar_LSN(ucGyroX_LSB);
		uart0_tx_buff[uart0_tx_buff_putptr++] = nibble_to_hexchar_MSN(ucGyroY_MSB);
		uart0_tx_buff[uart0_tx_buff_putptr++] = nibble_to_hexchar_LSN(ucGyroY_MSB);
		uart0_tx_buff[uart0_tx_buff_putptr++] = nibble_to_hexchar_MSN(ucGyroY_LSB);
		uart0_tx_buff[uart0_tx_buff_putptr++] = nibble_to_hexchar_LSN(ucGyroY_LSB);
		uart0_tx_buff[uart0_tx_buff_putptr++] = nibble_to_hexchar_MSN(ucGyroZ_MSB);
		uart0_tx_buff[uart0_tx_buff_putptr++] = nibble_to_hexchar_LSN(ucGyroZ_MSB);
		uart0_tx_buff[uart0_tx_buff_putptr++] = nibble_to_hexchar_MSN(ucGyroZ_LSB);
		uart0_tx_buff[uart0_tx_buff_putptr++] = nibble_to_hexchar_LSN(ucGyroZ_LSB);
		uart0_tx_buff[uart0_tx_buff_putptr++] = nibble_to_hexchar_MSN(ucAccelX_MSB);
		uart0_tx_buff[uart0_tx_buff_putptr++] = nibble_to_hexchar_LSN(ucAccelX_MSB);
		uart0_tx_buff[uart0_tx_buff_putptr++] = nibble_to_hexchar_MSN(ucAccelX_LSB);
		uart0_tx_buff[uart0_tx_buff_putptr++] = nibble_to_hexchar_LSN(ucAccelX_LSB);
		uart0_tx_buff[uart0_tx_buff_putptr++] = nibble_to_hexchar_MSN(ucAccelY_MSB);
		uart0_tx_buff[uart0_tx_buff_putptr++] = nibble_to_hexchar_LSN(ucAccelY_MSB);
		uart0_tx_buff[uart0_tx_buff_putptr++] = nibble_to_hexchar_MSN(ucAccelY_LSB);
		uart0_tx_buff[uart0_tx_buff_putptr++] = nibble_to_hexchar_LSN(ucAccelY_LSB);
		uart0_tx_buff[uart0_tx_buff_putptr++] = nibble_to_hexchar_MSN(ucAccelZ_MSB);
		uart0_tx_buff[uart0_tx_buff_putptr++] = nibble_to_hexchar_LSN(ucAccelZ_MSB);
		uart0_tx_buff[uart0_tx_buff_putptr++] = nibble_to_hexchar_MSN(ucAccelZ_LSB);
		uart0_tx_buff[uart0_tx_buff_putptr++] = nibble_to_hexchar_LSN(ucAccelZ_LSB);
	    if (ucMotionIntEnabled)
    	{
			uart0_tx_buff[uart0_tx_buff_putptr++] = '1';
    	}
	    else
	    {
			uart0_tx_buff[uart0_tx_buff_putptr++] = '0';
	    }
	    uart0_tx_buff[uart0_tx_buff_putptr++] = '\r';
		uart0_tx_buff[uart0_tx_buff_putptr++] = '\n';
	} //if (bBluetooth_usable)

} //read_motion_sensor

void read_temperature_sensor()
{
	unsigned char ucExternalStatus = 0;
	unsigned char ucTemp_MSB = 0;
	unsigned char ucTemp_LSB = 0;
	unsigned char ucTemp_DataReady = 0;

	I2C_WriteByte(I2C1_MASTER, MAX21105_ADDR, EXT_STATUS,  0x00);	// Select User Bank #0 for settings below
	I2C_WriteByte(I2C1_MASTER, MAX21105_ADDR, SET_TEMP_DR, 0x01);	// Enable temperature sensor
	//The temperature will not read if this is not enabled:
	I2C_WriteByte(I2C1_MASTER, MAX21105_ADDR, SET_PWR,    0x78);	// Power mode: Acc Low Noise + Gyro Low Noise


	//External Status register bit 4 = temp_dr
	ucTemp_DataReady = 0;
	SetMyLocalTimeout(10); //100 ms
	while ((ucTemp_DataReady == 0) && (bMyLocalTimoutExpired == false))
	{ //Wait for Temperature data to become ready
		I2C_ReadByte(I2C1_MASTER, MAX21105_ADDR, EXT_STATUS, &ucExternalStatus);
		ucTemp_DataReady = ucExternalStatus & 0x10; //bit 4
	} //Wait for Temperature data to become ready
	//Read the Temperature values:
	I2C_ReadByte(I2C1_MASTER, MAX21105_ADDR, TEMP_H, &ucTemp_MSB);
	I2C_ReadByte(I2C1_MASTER, MAX21105_ADDR, TEMP_L, &ucTemp_LSB);

	int iTemperature = ucTemp_MSB * 256 + ucTemp_LSB;
	fTemperature = (float)(iTemperature/256.0); //make the float value globally available

	//Send "Temperature" message to host:
    uart1_tx_buff[uart1_tx_buff_putptr++] = TOHOST_MSG_TEMPERATURE; //Character for Temperature data to SF2
    uart1_tx_buff[uart1_tx_buff_putptr++] = 2;        //message length
    uart1_tx_buff[uart1_tx_buff_putptr++] = ucTemp_MSB;
    uart1_tx_buff[uart1_tx_buff_putptr++] = ucTemp_LSB;

	gpio_iput_pattern = MSS_GPIO_get_inputs();
	ucBT_Connected = gpio_iput_pattern & 0x20; //Check if Bluetooth is connected
	bBluetooth_usable = ucBT_Connected && (!bMLDP_mode || (bMLDP_mode && bMLDP_user_ready));
    bSecurityAccessAllowed = !bSecurityModeEnabled || (bSecurityModeEnabled && bSecurityAccessGranted);
   	if (bBluetooth_usable && bMLDP_mode && bMLDP_user_ready && bSecurityAccessAllowed)
	{	//We will get an error if we send MLDP data to the device when it is not connected (MLDP gets enables when it connects)
	    //Send the same information to BLE using MLDP:
		uart0_tx_buff[uart0_tx_buff_putptr++] = '=';
		uart0_tx_buff[uart0_tx_buff_putptr++] = '>';
		uart0_tx_buff[uart0_tx_buff_putptr++] = 'T';
		uart0_tx_buff[uart0_tx_buff_putptr++] = nibble_to_hexchar_MSN(ucTemp_MSB);
		uart0_tx_buff[uart0_tx_buff_putptr++] = nibble_to_hexchar_LSN(ucTemp_MSB);
		uart0_tx_buff[uart0_tx_buff_putptr++] = nibble_to_hexchar_MSN(ucTemp_LSB);
		uart0_tx_buff[uart0_tx_buff_putptr++] = nibble_to_hexchar_LSN(ucTemp_LSB);
	    uart0_tx_buff[uart0_tx_buff_putptr++] = '\r';
		uart0_tx_buff[uart0_tx_buff_putptr++] = '\n';
	} //if (bBluetooth_usable)

} //read_temperature_sensor

void read_MAX21105_info()
{
	unsigned char ucWhoAmI = 0;
	unsigned char ucSiliconRev = 0;
	unsigned char SerialNumB5 = 0;
	unsigned char SerialNumB4 = 0;
	unsigned char SerialNumB3 = 0;
	unsigned char SerialNumB2 = 0;
	unsigned char SerialNumB1 = 0;
	unsigned char SerialNumB0 = 0;

	I2C_ReadByte(I2C1_MASTER, MAX21105_ADDR, WHO_AM_I, &ucWhoAmI);  //This should return 0xB4
	I2C_ReadByte(I2C1_MASTER, MAX21105_ADDR, SILICON_REV_OTP, &ucSiliconRev);

	I2C_WriteByte(I2C1_MASTER, MAX21105_ADDR, EXT_STATUS,  0x01);	// Select User Bank #1 for settings below

	//Read the Serial Number values:
	I2C_ReadByte(I2C1_MASTER, MAX21105_ADDR, SERIAL_NUM_B5, &SerialNumB5);
	I2C_ReadByte(I2C1_MASTER, MAX21105_ADDR, SERIAL_NUM_B4, &SerialNumB4);
	I2C_ReadByte(I2C1_MASTER, MAX21105_ADDR, SERIAL_NUM_B3, &SerialNumB3);
	I2C_ReadByte(I2C1_MASTER, MAX21105_ADDR, SERIAL_NUM_B2, &SerialNumB2);
	I2C_ReadByte(I2C1_MASTER, MAX21105_ADDR, SERIAL_NUM_B1, &SerialNumB1);
	I2C_ReadByte(I2C1_MASTER, MAX21105_ADDR, SERIAL_NUM_B0, &SerialNumB0);

	//Send "MAX_21105 Info" message to host:
    uart1_tx_buff[uart1_tx_buff_putptr++] = TOHOST_MSG_MAX21105_INFO; //Character for MAX21105 Info to SF2
    uart1_tx_buff[uart1_tx_buff_putptr++] = 8;        //message length
    uart1_tx_buff[uart1_tx_buff_putptr++] = ucWhoAmI; //See if it is 0xB4
    uart1_tx_buff[uart1_tx_buff_putptr++] = ucSiliconRev;
    uart1_tx_buff[uart1_tx_buff_putptr++] = SerialNumB5;
    uart1_tx_buff[uart1_tx_buff_putptr++] = SerialNumB4;
    uart1_tx_buff[uart1_tx_buff_putptr++] = SerialNumB3;
    uart1_tx_buff[uart1_tx_buff_putptr++] = SerialNumB2;
    uart1_tx_buff[uart1_tx_buff_putptr++] = SerialNumB1;
    uart1_tx_buff[uart1_tx_buff_putptr++] = SerialNumB0;

} //read_MAX21105_info

void ReportStatus()
{
	unsigned char ucLED_register_MSN;
	unsigned char ucLED_register_LSN;
	unsigned char ucFabricStatus_MSN;
	unsigned char ucFabricStatus_LSN;
	unsigned char ucSoftware_status_register;
	unsigned char ucSoftwareStatus_MSN;
	unsigned char ucSoftwareStatus_LSN;
	unsigned char ucGPIO_LSB_register_MSN;
	unsigned char ucGPIO_LSB_register_LSN;
	unsigned char ucGPIO_MSB_register;

	ucLED_register_MSN = nibble_to_hexchar_MSN((unsigned char)LED_register);
	ucLED_register_LSN = nibble_to_hexchar_LSN((unsigned char)LED_register);
	fabric_status_register = *((uint32_t volatile *) (fabric_status_address));
	ucFabricStatus_MSN = nibble_to_hexchar_MSN((unsigned char)fabric_status_register);
	ucFabricStatus_LSN = nibble_to_hexchar_LSN((unsigned char)fabric_status_register);
	gpio_iput_pattern = MSS_GPIO_get_inputs();
	ucGPIO_MSB_register = (gpio_pattern >> 8) & 0xFF;  //locally shadowed, not read back
 	ucBT_Connected = gpio_iput_pattern & 0x20; //Check if Bluetooth is connected
	bBluetooth_usable = ucBT_Connected && (!bMLDP_mode || (bMLDP_mode && bMLDP_user_ready));

	// ****************************************
	// Bit 7 = BLE WAKE_HW
	// Bit 6 = BLE WAKE_SW
	// Bit 5 = bServoEnabled
	// Bit 4 = bWifiEnabled
	// Bit 3 = BLE_nCMD
	// Bit 2 = bBluetooth_usable
	// Bit 1 = bSecurityAccessGranted
	// Bit 0 = bSecurityModeEnabled
	// ****************************************
	ucSoftware_status_register = ucGPIO_MSB_register & 0xC8; // Keep bits 7=BLE WAKE_HW, 6=BLE_WAKE_SW and 3= BLE_nCMD
	ucSoftware_status_register += bServoEnabled << 5;
	ucSoftware_status_register += bWifiEnabled << 4;
	ucSoftware_status_register += bBluetooth_usable << 2;
	ucSoftware_status_register += bSecurityAccessGranted << 1;
	ucSoftware_status_register += bSecurityModeEnabled << 0;
	ucSoftwareStatus_MSN = nibble_to_hexchar_MSN((unsigned char)ucSoftware_status_register);
	ucSoftwareStatus_LSN = nibble_to_hexchar_LSN((unsigned char)ucSoftware_status_register);
	ucGPIO_LSB_register_MSN = nibble_to_hexchar_MSN((unsigned char)gpio_iput_pattern);
	ucGPIO_LSB_register_LSN = nibble_to_hexchar_LSN((unsigned char)gpio_iput_pattern);

	//Report the status information to the host:
    uart1_tx_buff[uart1_tx_buff_putptr++] = TOHOST_MSG_STATUS; //Character for Status data to SF2
    uart1_tx_buff[uart1_tx_buff_putptr++] = 6;        //message length
    uart1_tx_buff[uart1_tx_buff_putptr++] = (unsigned char)LED_register;
    uart1_tx_buff[uart1_tx_buff_putptr++] = (unsigned char)fabric_status_register;
    uart1_tx_buff[uart1_tx_buff_putptr++] = ucSoftware_status_register;
    uart1_tx_buff[uart1_tx_buff_putptr++] = (unsigned char)gpio_iput_pattern;   //GPIO LSB
    uart1_tx_buff[uart1_tx_buff_putptr++] = ucLightIntEnabled;  //Whether the Interrupt is enabled
    uart1_tx_buff[uart1_tx_buff_putptr++] = ucMotionIntEnabled;  //Whether the Interrupt is enabled

	//Report the same information to the BLE device:
    bSecurityAccessAllowed = !bSecurityModeEnabled || (bSecurityModeEnabled && bSecurityAccessGranted);
   	if (bBluetooth_usable && bMLDP_mode && bMLDP_user_ready && bSecurityAccessAllowed)
	{	//We will get an error if we send MLDP data to the device when it is not connected (MLDP gets enables when it connects)
		//Send MLDP Status to BLE device
		uart0_tx_buff[uart0_tx_buff_putptr++] = '=';
		uart0_tx_buff[uart0_tx_buff_putptr++] = '>';
		uart0_tx_buff[uart0_tx_buff_putptr++] = 'S';
		uart0_tx_buff[uart0_tx_buff_putptr++] = ucLED_register_MSN;
		uart0_tx_buff[uart0_tx_buff_putptr++] = ucLED_register_LSN;
		uart0_tx_buff[uart0_tx_buff_putptr++] = ucFabricStatus_MSN;
		uart0_tx_buff[uart0_tx_buff_putptr++] = ucFabricStatus_LSN;
		uart0_tx_buff[uart0_tx_buff_putptr++] = ucSoftwareStatus_MSN;
		uart0_tx_buff[uart0_tx_buff_putptr++] = ucSoftwareStatus_LSN;
		uart0_tx_buff[uart0_tx_buff_putptr++] = ucGPIO_LSB_register_MSN;
		uart0_tx_buff[uart0_tx_buff_putptr++] = ucGPIO_LSB_register_LSN;
	    if (ucLightIntEnabled)
    	{
			uart0_tx_buff[uart0_tx_buff_putptr++] = '1';
    	}
	    else
	    {
			uart0_tx_buff[uart0_tx_buff_putptr++] = '0';
	    }
	    if (ucMotionIntEnabled)
    	{
			uart0_tx_buff[uart0_tx_buff_putptr++] = '1';
    	}
	    else
	    {
			uart0_tx_buff[uart0_tx_buff_putptr++] = '0';
	    }
		uart0_tx_buff[uart0_tx_buff_putptr++] = '\r';
		uart0_tx_buff[uart0_tx_buff_putptr++] = '\n';
	} //if (bBluetooth_usable)
} //ReportStatus()

void ReportPing()
{
	unsigned char ucLED_register_MSN;
	unsigned char ucLED_register_LSN;
	unsigned char ucFabricStatus_MSN;
	unsigned char ucFabricStatus_LSN;
	unsigned char ucSoftware_status_register;
	unsigned char ucSoftwareStatus_MSN;
	unsigned char ucSoftwareStatus_LSN;
	unsigned char ucGPIO_LSB_register_MSN;
	unsigned char ucGPIO_LSB_register_LSN;
	unsigned char ucGPIO_MSB_register;

	ucLED_register_MSN = nibble_to_hexchar_MSN((unsigned char)LED_register);
	ucLED_register_LSN = nibble_to_hexchar_LSN((unsigned char)LED_register);
	fabric_status_register = *((uint32_t volatile *) (fabric_status_address));
	ucFabricStatus_MSN = nibble_to_hexchar_MSN((unsigned char)fabric_status_register);
	ucFabricStatus_LSN = nibble_to_hexchar_LSN((unsigned char)fabric_status_register);
	gpio_iput_pattern = MSS_GPIO_get_inputs();
	ucGPIO_MSB_register = (gpio_pattern >> 8) & 0xFF;  //locally shadowed, not read back
 	ucBT_Connected = gpio_iput_pattern & 0x20; //Check if Bluetooth is connected
	bBluetooth_usable = ucBT_Connected && (!bMLDP_mode || (bMLDP_mode && bMLDP_user_ready));

	// ****************************************
	// Bit 7 = BLE WAKE_HW
	// Bit 6 = BLE WAKE_SW
	// Bit 5 = bServoEnabled
	// Bit 4 = bWifiEnabled
	// Bit 3 = BLE_nCMD
	// Bit 2 = bBluetooth_usable
	// Bit 1 = bSecurityAccessGranted
	// Bit 0 = bSecurityModeEnabled
	// ****************************************
	ucSoftware_status_register = ucGPIO_MSB_register & 0xC8; // Keep bits 7=BLE WAKE_HW, 6=BLE_WAKE_SW and 3= BLE_nCMD
	ucSoftware_status_register += bServoEnabled << 5;
	ucSoftware_status_register += bWifiEnabled << 4;
	ucSoftware_status_register += bSecurityAccessGranted << 1;
	ucSoftware_status_register += bBluetooth_usable << 2;
	ucSoftware_status_register += bSecurityModeEnabled << 0;
	ucSoftwareStatus_MSN = nibble_to_hexchar_MSN((unsigned char)ucSoftware_status_register);
	ucSoftwareStatus_LSN = nibble_to_hexchar_LSN((unsigned char)ucSoftware_status_register);
	ucGPIO_LSB_register_MSN = nibble_to_hexchar_MSN((unsigned char)gpio_iput_pattern);
	ucGPIO_LSB_register_LSN = nibble_to_hexchar_LSN((unsigned char)gpio_iput_pattern);

	//Report Ping information to the host:
    uart1_tx_buff[uart1_tx_buff_putptr++] = TOHOST_MSG_PING_ALIVE; //Character for Ping to SF2
    uart1_tx_buff[uart1_tx_buff_putptr++] = 6;        //message length
    uart1_tx_buff[uart1_tx_buff_putptr++] = (unsigned char)LED_register;
    uart1_tx_buff[uart1_tx_buff_putptr++] = (unsigned char)fabric_status_register;
    uart1_tx_buff[uart1_tx_buff_putptr++] = ucSoftware_status_register;
    uart1_tx_buff[uart1_tx_buff_putptr++] = (unsigned char)gpio_iput_pattern;   //GPIO LSB
    uart1_tx_buff[uart1_tx_buff_putptr++] = ucLightIntEnabled;  //Whether the Interrupt is enabled
    uart1_tx_buff[uart1_tx_buff_putptr++] = ucMotionIntEnabled;  //Whether the Interrupt is enabled

    //Report the same information to the BLE device:
    bSecurityAccessAllowed = !bSecurityModeEnabled || (bSecurityModeEnabled && bSecurityAccessGranted);
   	if (bBluetooth_usable && bMLDP_mode && bMLDP_user_ready && bSecurityAccessAllowed)
	{	//We will get an error if we send MLDP data to the device when it is not connected (MLDP gets enables when it connects)
		//Send MLDP Status to BLE device
		uart0_tx_buff[uart0_tx_buff_putptr++] = '=';
		uart0_tx_buff[uart0_tx_buff_putptr++] = '>';
		uart0_tx_buff[uart0_tx_buff_putptr++] = 'G';
		uart0_tx_buff[uart0_tx_buff_putptr++] = ucLED_register_MSN;
		uart0_tx_buff[uart0_tx_buff_putptr++] = ucLED_register_LSN;
		uart0_tx_buff[uart0_tx_buff_putptr++] = ucFabricStatus_MSN;
		uart0_tx_buff[uart0_tx_buff_putptr++] = ucFabricStatus_LSN;
		uart0_tx_buff[uart0_tx_buff_putptr++] = ucSoftwareStatus_MSN;
		uart0_tx_buff[uart0_tx_buff_putptr++] = ucSoftwareStatus_LSN;
		uart0_tx_buff[uart0_tx_buff_putptr++] = ucGPIO_LSB_register_MSN;
		uart0_tx_buff[uart0_tx_buff_putptr++] = ucGPIO_LSB_register_LSN;
	    if (ucLightIntEnabled)
    	{
			uart0_tx_buff[uart0_tx_buff_putptr++] = '1';
    	}
	    else
	    {
			uart0_tx_buff[uart0_tx_buff_putptr++] = '0';
	    }
	    if (ucMotionIntEnabled)
    	{
			uart0_tx_buff[uart0_tx_buff_putptr++] = '1';
    	}
	    else
	    {
			uart0_tx_buff[uart0_tx_buff_putptr++] = '0';
	    }
		uart0_tx_buff[uart0_tx_buff_putptr++] = '\r';
		uart0_tx_buff[uart0_tx_buff_putptr++] = '\n';
	} //if (bBluetooth_usable)
} //ReportPing()

void ReportVersions()
{
	fabric_version_major = *((uint32_t volatile *) (fabric_version_major_address));
	fabric_version_minor = *((uint32_t volatile *) (fabric_version_minor_address));
	arduino_configuration_state = *((uint32_t volatile *) (arduino_config_address));
	pmod1_configuration_state = *((uint32_t volatile *) (pmod1_config_address));
	pmod2_configuration_state = *((uint32_t volatile *) (pmod2_config_address));
	pmod3_configuration_state = *((uint32_t volatile *) (pmod3_config_address));

	//Report Version information to the host:
    uart1_tx_buff[uart1_tx_buff_putptr++] = TOHOST_MSG_FIRMWARE_VERSIONS; //Character for Versions to SF2
    uart1_tx_buff[uart1_tx_buff_putptr++] = 8;        //message length
    uart1_tx_buff[uart1_tx_buff_putptr++] = CORETEX_M3_SOFTWARE_VERSION_MAJOR;
    uart1_tx_buff[uart1_tx_buff_putptr++] = CORETEX_M3_SOFTWARE_VERSION_MINOR;
    uart1_tx_buff[uart1_tx_buff_putptr++] = (unsigned char)fabric_version_major;
    uart1_tx_buff[uart1_tx_buff_putptr++] = (unsigned char)fabric_version_minor;
    uart1_tx_buff[uart1_tx_buff_putptr++] = (unsigned char)arduino_configuration_state;
    uart1_tx_buff[uart1_tx_buff_putptr++] = (unsigned char)pmod1_configuration_state;
    uart1_tx_buff[uart1_tx_buff_putptr++] = (unsigned char)pmod2_configuration_state;
    uart1_tx_buff[uart1_tx_buff_putptr++] = (unsigned char)pmod3_configuration_state;

} //ReportVersions()

void SetLED(unsigned char ucLedNumber, unsigned char ucLedSetting)
{
	unsigned char LED_bits;
    uint32_t ucBleLedOnMask;
    uint32_t ucBleLedOffMask;
    uint32_t ucBlePositionMask;

    if (ucLedSetting == 'F')
	{
		LED_bits = 0x0;
	}
	else if (ucLedSetting == 'R')
	{
		LED_bits = 0x1;
	}
	else if (ucLedSetting == 'G')
	{
		LED_bits = 0x2;
	}
	else
	{
		LED_bits = 0x3;
	}
	ucBleLedOnMask = LED_bits << (2*ucLedNumber);
	ucBlePositionMask = 0x3 << (2*ucLedNumber);
	ucBleLedOffMask = 0xFFFFFFFF - ucBlePositionMask;
	LED_register &= ucBleLedOffMask; //Switch LED off
	LED_register |= ucBleLedOnMask; //Switch selected LEDs on
	//Set outputs:
	*((uint32_t volatile *) (LEDS_address)) = LED_register;

} //SetLED()

void BLE_Factory_Reset(unsigned char ucResetLevel)
{
	BLE_WAKE_HW_LO;
    BLE_WAKE_SW_LO;
    soft_delay100ms(5); //Wait
	BLE_WAKE_HW_HI; // Power the device on
	if (ucResetLevel)
	{
		BLE_WAKE_SW_HI; //This will cause a complete factory reset, nothing retained
	}
    //Now toggle WAKE_HW for three Cycles
    //#1
	soft_delay100ms(1); //Wait
	BLE_WAKE_HW_LO;
    soft_delay100ms(1); //Wait
	BLE_WAKE_HW_HI;
    //#2
    soft_delay100ms(1); //Wait
	BLE_WAKE_HW_LO;
    soft_delay100ms(1); //Wait
	BLE_WAKE_HW_HI;
    //#3
    soft_delay100ms(1); //Wait
	BLE_WAKE_HW_LO;
    soft_delay100ms(1); //Wait
	BLE_WAKE_HW_HI;
	//Wait for reset to finish:
    soft_delay100ms(3); //Wait
	//Back to defaults:
	BLE_WAKE_HW_HI;
    BLE_WAKE_SW_HI;
    BLE_nCMD_HI;

} //BLE_Factory_Reset()

unsigned char ComputeBleEchoDataReceived(void)
{
	unsigned char ucDataAvailable;
	/* compute the number of bytes in the buffer */
    if (BLE_toHost_buff_putptr >= BLE_toHost_buff_getptr)
    {
    	ucDataAvailable = (unsigned char) (BLE_toHost_buff_putptr - BLE_toHost_buff_getptr);
    }
    else
    {
    	ucDataAvailable = (unsigned char) (256 + BLE_toHost_buff_putptr - BLE_toHost_buff_getptr);
    }
	return(ucDataAvailable);
} //ComputeBleEchoDataReceived

/*------------------------------------------------------------------------------
 * Function to transmit to LSR shield.
 *------------------------------------------------------------------------------*/
int TransmitToModuleViaUart( uint8_t* buffer , uint16_t bufLen )
{
  int status;
  status = 1;
  if (bWifiEnabled)
  {
	  MSS_UART_polled_tx(gp_my_uart0, buffer, bufLen);
  }
  return status;
}

/*------------------------------------------------------------------------------
 * Function to write DAC data via SPI0
 *------------------------------------------------------------------------------*/
int Write_DtoA_Converter( unsigned char ucDestinationDac, unsigned char ucDacWriteData )
{
	int status;
	unsigned char ucControlWord;
	uint32_t master_tx_frame;

	ucControlWord = 0x00; //By default both DAC registers are loaded from shift register
	if (ucDestinationDac == 0x01)
	{
		ucControlWord =0x03; //Update DAC A DAC register from shift register
	}
	else if (ucDestinationDac == 0x02)
	{
		ucControlWord =0x07; //Update DAC B DAC register from shift register
	}
	master_tx_frame = (ucControlWord << 8) + ucDacWriteData;

	/* Assert slave select. */
	MSS_SPI_set_slave_select(&g_mss_spi0, MSS_SPI_SLAVE_0);

	//Use: uint32_t MSS_SPI_transfer_frame(mss_spi_instance_t * this_spi,uint32_t tx_bits);
	MSS_SPI_transfer_frame( &g_mss_spi0, master_tx_frame);

	/* De-assert slave select. */
	MSS_SPI_clear_slave_select(&g_mss_spi0, MSS_SPI_SLAVE_0);

	status = 1; // for now, return an error if the FIFO is full
	return status;
}

/*------------------------------------------------------------------------------
 * Function to read from a register in a Peripheral
 *------------------------------------------------------------------------------*/
unsigned char ReadPeripheralRegister( unsigned char ucSubAddress) //this must become more generic, currently only for PMOD2
{
	unsigned char ucReadValue;
	*((uint32_t volatile *) (pmod2_addr_address))			=  ucSubAddress;
	ucReadValue = *((uint32_t volatile *) (pmod2_data_address));
	*((uint32_t volatile *) (pmod2_addr_address))			=  0x00; //set the address back to 0, where nothing happens
	return ucReadValue;
}


/*------------------------------------------------------------------------------
* Function to write to a register in a Peripheral
*------------------------------------------------------------------------------*/
void WritePeripheral1_Register( unsigned char ucSubAddress, unsigned char ucDataToRegister ) //this must become more generic, currently only for PMOD1
{
	*((uint32_t volatile *) (pmod1_addr_address))			=  ucSubAddress;
	*((uint32_t volatile *) (pmod1_data_address))			=  ucDataToRegister;
	*((uint32_t volatile *) (pmod1_addr_address))			=  0x00; //set the address back to 0, where nothing happens
}

/*------------------------------------------------------------------------------
* Function to write to a register in a Peripheral
*------------------------------------------------------------------------------*/
void WritePeripheral2_Register( unsigned char ucSubAddress, unsigned char ucDataToRegister ) //this must become more generic, currently only for PMOD2
{
	*((uint32_t volatile *) (pmod2_addr_address))			=  ucSubAddress;
	*((uint32_t volatile *) (pmod2_data_address))			=  ucDataToRegister;
	*((uint32_t volatile *) (pmod2_addr_address))			=  0x00; //set the address back to 0, where nothing happens
}

/*------------------------------------------------------------------------------
 * Function to read the ADC data via SPI1
 *------------------------------------------------------------------------------*/
uint32_t Read_AtoD_Converter( unsigned char ucSourceDac )
{
	uint32_t master_rx_frame;
	uint32_t master_tx_frame;

	master_tx_frame = (0x00 << 8) + 0x00;

	//We use the LSB of the PMOD2 Settings register to select between reading back ADC0 or ADC1
	if (ucSourceDac == 0)
	{
		WritePeripheral2_Register(REGISTER_PMOD2_ADC_SETTINGS,0x00);
	}
	else
	{
		WritePeripheral2_Register(REGISTER_PMOD2_ADC_SETTINGS,0x01);
	}

	/* Assert slave select. */
	MSS_SPI_set_slave_select(&g_mss_spi1, MSS_SPI_SLAVE_0);

	//Use: uint32_t MSS_SPI_transfer_frame(mss_spi_instance_t * this_spi,uint32_t tx_bits);
	master_rx_frame = MSS_SPI_transfer_frame( &g_mss_spi1, master_tx_frame);

	/* De-assert slave select. */
	MSS_SPI_clear_slave_select(&g_mss_spi1, MSS_SPI_SLAVE_0);

	return master_rx_frame;
}


/*==============================================================================
 * main() function.
  ------------------------------------------------------------------------------*/
int main()
{
    size_t  uart0_isr_rx_size;
    uint8_t uart0_isr_rx_buff[1];
    size_t  uart1_isr_rx_size;
    uint8_t uart1_isr_rx_buff[1];
    unsigned char ucByteFromHost;

	int myIndex;
	int iWiFiIndex;
    unsigned char ucBleByte;
    unsigned char ucBleCommand = 0;
    unsigned char ucBleCommandLength;
    unsigned char ucBleCommandIndex = 0;
    unsigned char ucSetLedNumber = 0;
    unsigned char ucSetLedSetting;
    unsigned char ucFabricAccessAddress = 0;

    unsigned char ucWebUpdateRateLSB;
    unsigned char ucWebUpdateRateMSB;
    unsigned char ucSelectedPeriperal;
    unsigned char ucDac1Enabled;
    unsigned char ucDac0Data;
    unsigned char ucDac1Data;
    uint32_t dwADC0data;
    uint32_t dwADC1data;

    unsigned char ucBlePayloadLength_type;
    unsigned char ucBlePayloadLength_tens;
    unsigned char ucBlePayloadLength;
    unsigned char ucBlePayloadLength_ones;


	uart0_rx_buff_getptr = 0;
    uart0_rx_buff_putptr = 0;
    uart0_tx_buff_getptr = 0;
    uart0_tx_buff_putptr = 0;
    uart1_rx_buff_getptr = 0;
    uart1_rx_buff_putptr = 0;
    uart1_tx_buff_getptr = 0;
    uart1_tx_buff_putptr = 0;
    HostUart_State = STATE_HOST_UART_WAIT_COMMAND;
    BLE_toHost_buff_getptr = 0;
    BLE_toHost_buff_putptr = 0;

    // Initialize MSS GPIOs:
    MSS_GPIO_init();
    // Configure MSS GPIOs:
    //MSS_GPIO_config( MSS_GPIO_0 , MSS_GPIO_OUTPUT_MODE );
    //MSS_GPIO_config( MSS_GPIO_1 , MSS_GPIO_OUTPUT_MODE );
    //MSS_GPIO_config( MSS_GPIO_2 , MSS_GPIO_OUTPUT_MODE );
    //MSS_GPIO_config( MSS_GPIO_3 , MSS_GPIO_OUTPUT_MODE );
    MSS_GPIO_config( MSS_GPIO_0 , MSS_GPIO_INPUT_MODE );//Button1 interrupt
    MSS_GPIO_config( MSS_GPIO_1 , MSS_GPIO_INPUT_MODE );//Button2 interrupt
    MSS_GPIO_config( MSS_GPIO_2 , MSS_GPIO_INPUT_MODE );//Button1 de-bounced
    MSS_GPIO_config( MSS_GPIO_3 , MSS_GPIO_INPUT_MODE );//Button2 de-bounced
    MSS_GPIO_config( MSS_GPIO_4 , MSS_GPIO_INPUT_MODE );//Light Interrupt
    MSS_GPIO_config( MSS_GPIO_5 , MSS_GPIO_INPUT_MODE );//BT_CONNECTED
    MSS_GPIO_config( MSS_GPIO_6 , MSS_GPIO_INPUT_MODE );//Still Unused
    MSS_GPIO_config( MSS_GPIO_7 , MSS_GPIO_INPUT_MODE );//Still Unused

//    gpio_pattern = 0x000020AA; // default (WAKE_HW=WAKE_SW=0, CMD=1
    gpio_pattern = 0x000000AA; // default (WAKE_HW=WAKE_SW=0, CMD=0
    MSS_GPIO_set_outputs( gpio_pattern );

    //Fabric AMBA AHB3 interface:
    *((uint32_t volatile *) (LEDS_address)) = LED_register;

    /* Turn off the watchdog */
    SYSREG->WDOG_CR = 0;
    
    /*--------------------------------------------------------------------------
     * Initialize and configure I2C
    ------------------------------------------------------------------------------*/
    // Initialize the MSS I2C slave driver with its I2C serial address and serial clock divider:
    //MSS_I2C_init(I2C_SLAVE, SLAVE_SER_ADDR, MSS_I2C_PCLK_DIV_60);
    // Enable I2C Slave:
    //MSS_I2C_enable_slave(I2C_SLAVE);
    // Initialize the MSS I2C master Drive:

    //The MAX44009 Maximum I2C clock is 400kHz.
    //MSS_I2C_init(I2C0_MASTER, I2C0MASTER_SER_ADDR, MSS_I2C_PCLK_DIV_60); //1.351MHz
    //MSS_I2C_init(I2C0_MASTER, I2C0MASTER_SER_ADDR, MSS_I2C_PCLK_DIV_960); //104.166kHz
    MSS_I2C_init(I2C0_MASTER, I2C0MASTER_SER_ADDR, MSS_I2C_PCLK_DIV_256); //373kHz

    //The MAX21105 minimum I2C clock is 100kHz, while the max is 400kHz.
    //MSS_I2C_init(I2C1_MASTER, I2C1MASTER_SER_ADDR, MSS_I2C_PCLK_DIV_960); //104.166kHz
    MSS_I2C_init(I2C1_MASTER, I2C1MASTER_SER_ADDR, MSS_I2C_PCLK_DIV_256); //373kHz

    // Initialize the system tick for 10mS operation or 1 tick every 100th of
    // a second and also make sure it is lower priority than the MSS I2C IRQs:
    NVIC_SetPriority(SysTick_IRQn, 0xFFu); /* Lowest possible priority */
    //If the systick 10mS calibration factor is set correctly in your design you can use the following:
    //SysTick_Config((SysTick->CALIB));
    SysTick_Config(MSS_SYS_M3_CLK_FREQ / 100);

    //This will make sensors active on power-up and may make debug more difficult
    //So do it for demo only:
    //ucLightIntEnabled = 1;
    //ucMotionIntEnabled = 1;
    //Default: no automatic sensor reading on power-up
    ucLightIntEnabled = 0;
    ucMotionIntEnabled = 0;

    ucReadLight = 0;
    ucReadMotion = 0;
    ucLightThresholdTriggered = 0;
    ucButtonWasPushed	= 0;
    ucBleConnectedStatusChanged = 0;

    /*--------------------------------------------------------------------------
     * Initialize and configure UART1 (FTDI USB to PC)
    ------------------------------------------------------------------------------*/
    MSS_UART_init(gp_my_uart1,
            //MSS_UART_57600_BAUD,
            MSS_UART_115200_BAUD,
                  MSS_UART_DATA_8_BITS | MSS_UART_NO_PARITY | MSS_UART_ONE_STOP_BIT);
    // Send greeting message over the UART.
    sprintf((char *)sUART_tx_string,"***** SmartFusion2 KickStart Board Ready *****\n");
    send_host_string();
    ReportVersions(); //Send Firmware version numbers to host

    soft_delay100ms(2); //Wait for device to wake up
    //Initialize memory-mapped registers:
	*((uint32_t volatile *) (LEDS_address))					= 0xFF;
	*((uint32_t volatile *) (arduino_data_address))			= 0x00;
	*((uint32_t volatile *) (pmod1_data_address))			= 0x00;
	*((uint32_t volatile *) (pmod2_data_address))			= 0x00;
	*((uint32_t volatile *) (pmod3_data_address))			= 0x00;
	*((uint32_t volatile *) (led_pwm_brightness_address))	= 0xFF;
	*((uint32_t volatile *) (led_pwm_blinking_address))		= 0x00;
	*((uint32_t volatile *) (testpins_address))				= 0x00;
	*((uint32_t volatile *) (testpins_select_address))		= 0x05;
	*((uint32_t volatile *) (serialmux_select_address))		= 0x00;
	*((uint32_t volatile *) (fabric_control_address))		= 0x01; //reset firmware status/errors
	*((uint32_t volatile *) (fabric_control_address))		= 0x00; //remove reset for firmware status/errors
	*((uint32_t volatile *) (arduino_mode_address))			= 0x00; //Arduino Inactive
	*((uint32_t volatile *) (pmod1_mode_address))			= 0x00; //PMOD1 Inactive
	*((uint32_t volatile *) (pmod2_mode_address))			= 0x00; //PMOD2 Inactive
	*((uint32_t volatile *) (pmod3_mode_address))			= 0x00; //PMOD3 Inactive

	bWifiEnabled = false;
	bSendWifiUpdate = false;
	iWiFiIndex = 0;
	bServoEnabled = false;

    bSecurityModeEnabled  = false;
	bSecurityAccessGranted = false;

    /*--------------------------------------------------------------------------
     * Initialize and configure UART0 (to RN4020 BLE module)
    ------------------------------------------------------------------------------*/
	BLE_WAKE_HW_HI;
    BLE_WAKE_SW_HI;
    //BLE_nCMD_HI;
    BLE_nCMD_LO; //Change as suggested by Microchip - always keep this pin low and let the Android app specify connection
    bMLDP_mode = true; //by default, we assume an MLDP connection
    bMLDP_user_ready = false;

    soft_delay100ms(5); //Wait for device to wake up
    MSS_UART_init(gp_my_uart0,
                  MSS_UART_115200_BAUD,
                  MSS_UART_DATA_8_BITS | MSS_UART_NO_PARITY | MSS_UART_ONE_STOP_BIT);
    // Initialize RN4020
    MSS_UART_polled_tx_string(gp_my_uart0,(unsigned char *)("SF,1\n\r"));
    MSS_UART_polled_tx_string(gp_my_uart0,(unsigned char *)("SS,F0000000\n\r"));
    //MSS_UART_polled_tx_string(gp_my_uart0,(unsigned char *)("SR,22000000\n\r"));
    //MSS_UART_polled_tx_string(gp_my_uart0,(unsigned char *)("SB,4\n\r")); //set BLE comms to 115200 baud
    MSS_UART_polled_tx_string(gp_my_uart0,(unsigned char *)("SR,32000800\n\r")); // enable MLDP,auto-advertise, hardware-flow control and auto-enter MLDP mode
    MSS_UART_polled_tx_string(gp_my_uart0,(unsigned char *)("R,1\n\r"));

    //Enable Interrupts:
    /* MSS GPIO_0 button Interrupt */
    NVIC_EnableIRQ(GPIO0_IRQn);
    MSS_GPIO_config( MSS_GPIO_0, MSS_GPIO_INPUT_MODE | MSS_GPIO_IRQ_EDGE_POSITIVE );
    MSS_GPIO_enable_irq( MSS_GPIO_0 );

    /* MSS GPIO_1 button Interrupt */
    NVIC_EnableIRQ(GPIO1_IRQn);
    MSS_GPIO_config( MSS_GPIO_1, MSS_GPIO_INPUT_MODE | MSS_GPIO_IRQ_EDGE_POSITIVE );
    MSS_GPIO_enable_irq( MSS_GPIO_1 );

    /* MSS GPIO_4 Light Interrupt */
    NVIC_EnableIRQ(GPIO4_IRQn);
    MSS_GPIO_config( MSS_GPIO_4, MSS_GPIO_INPUT_MODE | MSS_GPIO_IRQ_EDGE_NEGATIVE );
    MSS_GPIO_enable_irq( MSS_GPIO_4 );

    /* MSS GPIO_5 BT_CONNECTED Interrupt */
    NVIC_EnableIRQ(GPIO5_IRQn);
    MSS_GPIO_config( MSS_GPIO_5, MSS_GPIO_INPUT_MODE | MSS_GPIO_IRQ_EDGE_BOTH );
    MSS_GPIO_enable_irq( MSS_GPIO_5 );

    //--------------------------------------------------------------------------
    // Configure Timer1
    //--------------------------------------------------------------------------
    // Use the timer input frequency as load value to achieve a tick duration
       MSS_TIM1_init(MSS_TIMER_PERIODIC_MODE);
       MSS_TIM1_start();
       //MSS_TIM1_load_immediate(g_FrequencyPCLK0*2); //2 seconds
       MSS_TIM1_load_immediate(g_FrequencyPCLK0/2); //0.5 seconds
       //MSS_TIM1_enable_irq();
       if ((ucLightIntEnabled) || (ucMotionIntEnabled))
       {
           MSS_TIM1_clear_irq();
           MSS_TIM1_enable_irq();
       }

       //--------------------------------------------------------------------------
       // Configure Timer2
       //--------------------------------------------------------------------------
       // Use the timer input frequency as load value to achieve a tick duration
          MSS_TIM2_init(MSS_TIMER_PERIODIC_MODE);
          MSS_TIM2_start();
          MSS_TIM2_load_immediate(g_FrequencyPCLK0*2); //2 seconds
          //MSS_TIM2_load_immediate(g_FrequencyPCLK0*1); //1 second
          //MSS_TIM2_load_immediate(g_FrequencyPCLK0/2); //0.5 second
          //MSS_TIM2_load_immediate(g_FrequencyPCLK0*5); //5 seconds
          //MSS_TIM1_enable_irq();
          if (bWifiEnabled)
          {
              MSS_TIM1_clear_irq();
              MSS_TIM1_enable_irq();
          }

          //--------------------------------------------------------------------------
          // Configure SPI busses
          //--------------------------------------------------------------------------

          //Initialize and Configure SPI0 as Master :
           MSS_SPI_init(&g_mss_spi0);
           MSS_SPI_configure_master_mode(&g_mss_spi0,
                                         MSS_SPI_SLAVE_0,		//Identify slave SPI.  Configure must be called for each slave
                                         MSS_SPI_MODE0,			//Clock starts low, data read on clock's rising edge, data changes on falling edge.
                                         //MSS_SPI_MODE1,		//Clock starts low, data read on clock's falling edge, data changes on rising edge.
                                         256u,					//clk_div number of PCLK cycles (2 to 512)
                                         16u);					//frame_bit_length (32 is max)

           //Initialize and Configure SPI1 as Master :
            MSS_SPI_init(&g_mss_spi1);
            MSS_SPI_configure_master_mode(&g_mss_spi1,
                                          MSS_SPI_SLAVE_0,		//Identify slave SPI.  Configure must be called for each slave
                                          MSS_SPI_MODE0,			//Clock starts low, data read on clock's rising edge, data changes on falling edge.
                                          //MSS_SPI_MODE1,		//Clock starts low, data read on clock's falling edge, data changes on rising edge.
                                          256u,					//clk_div number of PCLK cycles (2 to 512)
                                          16u);					//frame_bit_length (32 is max)


    for(;;)
    { //Start infinite loop


    	//--------------------------- "ISRs" Start -------------------------------------------------------------------
		//Receive anything on UART0?  This takes the place of the ISR for now
		uart0_isr_rx_size = MSS_UART_get_rx(gp_my_uart0, uart0_isr_rx_buff, sizeof(uart0_isr_rx_buff));
		if ( uart0_isr_rx_size > 0 )
		{
			uart0_rx_buff[uart0_rx_buff_putptr++] = uart0_isr_rx_buff[0]; // Only one byte for now
			if (bWifiEnabled)
			{
				RxDataFramerAddByte(uart0_isr_rx_buff[0]);
				BLE_toHost_buff[BLE_toHost_buff_putptr++] = uart0_isr_rx_buff[0]; //Echo received data back to USB host
            	bBleEchoTimoutEnabled = false; //to protect the change
            	iBleEchoTimoutCount = 0;
            	bBleEchoTimoutEnabled = true; //un-protect the change

				ParseInterfaceUartRxData() ; //this should actually only be called occasionally...
			}
		} //if( rx_size1 > 0 )


    	//Receive anything on UART1?  This takes the place of the ISR for now
        uart1_isr_rx_size = MSS_UART_get_rx(gp_my_uart1, uart1_isr_rx_buff, sizeof(uart1_isr_rx_buff));
        if ( uart1_isr_rx_size > 0 )
        {
        	uart1_rx_buff[uart1_rx_buff_putptr++] = uart1_isr_rx_buff[0]; // Only one byte for now
        } //if( rx_size1 > 0 )

    	unsigned char UART0_status;
    	unsigned char allow_UART0_Tx;
        if (uart0_tx_buff_getptr != uart0_tx_buff_putptr)
        {
        	//Check CTS so that we can implement flow control:
        	UART0_status = MSS_UART_get_modem_status( gp_my_uart0 );
        	if( UART0_status & MSS_UART_CTS )
        	{
        		allow_UART0_Tx = false;
        	}
        	else
        	{
        		allow_UART0_Tx = true;
        	}

            while (allow_UART0_Tx && (uart0_tx_buff_getptr != uart0_tx_buff_putptr))
            {
            	MSS_UART_polled_tx(gp_my_uart0, &uart0_tx_buff[uart0_tx_buff_getptr++], 1);
            }  //while
        } // if there are UART0 bytes to transmit

        //Because it has more traffic, the UART1 transmit to host is done using the IRQ instead of
        //the polled UART transmit:
        unsigned char ucUART1_TxDone = MSS_UART_tx_complete(&g_mss_uart1);
        if (ucUART1_TxDone && (uart1_tx_buff_getptr != uart1_tx_buff_putptr))
        {
        	uart1_temp_buff_index = 0;
        	while (uart1_tx_buff_getptr != uart1_tx_buff_putptr)
            {
        		uart1_temp_buff[uart1_temp_buff_index++] = uart1_tx_buff[uart1_tx_buff_getptr++];
            }  //while
        	MSS_UART_irq_tx(gp_my_uart1, uart1_temp_buff, uart1_temp_buff_index);
        } // if there are UART1 bytes to transmit

        //--------------------------- "ISRs" End -------------------------------------------------------------------

        //In this state (no comms from host), use the opportunity of being idle to send RN4020 responses back to the host:
        if ((HostUart_State == STATE_HOST_UART_WAIT_COMMAND) && (uart1_rx_buff_getptr == uart1_rx_buff_putptr))
        {
    		unsigned char ucBleEchoBytesAvailable = ComputeBleEchoDataReceived();
        	if ((ucBleEchoBytesAvailable > 50) || (bBleEchoTimoutEnabled && (iBleEchoTimoutCount > 2))) //longer than 20ms since last data added
        	{
            	bBleEchoTimoutEnabled = false;
                uart1_tx_buff[uart1_tx_buff_putptr++] = TOHOST_MSG_DATA_FROM_BLE; //Response from BLE device
            	uart1_tx_buff[uart1_tx_buff_putptr++] = ucBleEchoBytesAvailable;
                for (myIndex=0; myIndex<ucBleEchoBytesAvailable; myIndex++)
                {
                	uart1_tx_buff[uart1_tx_buff_putptr++] = BLE_toHost_buff[BLE_toHost_buff_getptr++];
                } //for
        	}
        } // Echo BLE responses to host

		// This section, when enabled, allows periodic reporting of selected parameters to the web client via the LSR Arduino shield:
		if(bSendWifiUpdate)
		{
			bSendWifiUpdate = false;
			int status;

			if(GetPendingActionCount_framework( ) > 0)
			{
			status = GetPendingAction_framework( );
			}

			//This mechanism sends all the parameters in one go, but you need a delay between parameters (minimum 100 ms) to prevent overrun
			//of the shield code:
			//Button_AttData.sw1Pushbutton = (tc_bool)((gpio_iput_pattern >> 2) & 0x01); //bit 2
			//Button_AttData.sw2Pushbutton = (tc_bool)((gpio_iput_pattern >> 3) & 0x01); //bit 3
			//status = SetAttributes_pushbuttonSwitches2( &Button_AttData);
			//WaitLocal10msTimerTicks(15); //150 ms
			//Temperature_AttData.temperatureSensor = fTemperature;
			//status = SetAttributes_max21105TemperatureSensor( &Temperature_AttData);
			//WaitLocal10msTimerTicks(15); //150 ms
			//LightSensor_AttData.light_sensor = flux_value;
			//status = SetAttributes_max44009AmbientLightSensor( &LightSensor_AttData);

			//This mechanism uses round-robin reporting of parameters, so you are not actively waiting and you can add as many as you want.
			//Each parameter will decrease the update frequency:
			switch(iWiFiIndex)
			{
				case 0:
				{
					Button_AttData.sw1Pushbutton = (tc_bool)((gpio_iput_pattern >> 2) & 0x01); //bit 2
					Button_AttData.sw2Pushbutton = (tc_bool)((gpio_iput_pattern >> 3) & 0x01); //bit 3
					status = SetAttributes_pushbuttonSwitches2( &Button_AttData);
					iWiFiIndex++;
					break;
				}
				case 1:
				{
					Temperature_AttData.temperatureSensor = fTemperature;
					status = SetAttributes_max21105TemperatureSensor( &Temperature_AttData);
					iWiFiIndex++;
					break;
				}
				case 2:
				{
					LightSensor_AttData.light_sensor = flux_value;
					status = SetAttributes_max44009AmbientLightSensor( &LightSensor_AttData);
					iWiFiIndex = 0;
					break;
				}
				default:
				{
					iWiFiIndex = 0;
					break;
				}
				break;
			} //switch(iWiFiIndex)

			ParseInterfaceUartRxData(  );
		} //if(bSendWifiUpdate)

		//***********************************************************************************************************************
		//                                           USB Host UART Rx message decoding
		//***********************************************************************************************************************
		//Process the Host UART receive commands
        if (uart1_rx_buff_getptr != uart1_rx_buff_putptr)
        {
    		while (uart1_rx_buff_getptr != uart1_rx_buff_putptr)
            {
            	ucByteFromHost = uart1_rx_buff[uart1_rx_buff_getptr++]; //Copy latest received byte
    			switch(HostUart_State)
    			{
					case STATE_HOST_UART_WAIT_COMMAND:
					{
			            // Look to see if a new command has been received:
						ucHostCommand = ucByteFromHost;
						ucHostCommandLength = 0;
						//Test to make sure the command is an alphabet ascii character:
						//This came about after the host sent some bogus 0's after a command...
						if (ucHostCommand > 64) //'A' = 65
							{
								HostUart_State = STATE_HOST_UART_GET_LENGTH1;
							}
						break;
					}
					case STATE_HOST_UART_GET_LENGTH1:
					{
						ucHostCommandLength = ucByteFromHost;
						ucHostCommandIndex = ucHostCommandLength;
						HostUart_State = STATE_HOST_UART_PROCESS_COMMAND;
						break;
					}
					case STATE_HOST_UART_PROCESS_COMMAND:
					{
		    			switch(ucHostCommand)
		    			{
							case CMD_DATA_TO_BLE:
							{
								//Send byte to BLE via UART0:
								uart0_tx_buff[uart0_tx_buff_putptr++] = ucByteFromHost;
								ucHostCommandIndex--;
								if (ucHostCommandIndex ==0)
								{
									HostUart_State = STATE_HOST_UART_WAIT_COMMAND;
								}
								break;
							} //case CMD_DATA_TO_BLE
							//case CMD_GPIO_LSB: (THIS IS NOW READ-ONLY)
							//{
							//	//gpio_pattern = MSS_GPIO_get_outputs();
							//	gpio_pattern &= 0xFFFFFF00; //Mask off LSB
							//	gpio_pattern |= ucByteFromHost; //Add Byte from Host
							//	MSS_GPIO_set_outputs( gpio_pattern );
							//	HostUart_State = STATE_HOST_UART_WAIT_COMMAND;
							//	break;
							//} //case CMD_GPIO_LSB
							case CMD_GPIO_MSB:
							{
								//gpio_pattern = MSS_GPIO_get_outputs();
								gpio_pattern &= 0xFFFF00FF; //Mask off MSB
								gpio_pattern |= ucByteFromHost << 8; //Add Byte from Host
								MSS_GPIO_set_outputs( gpio_pattern );
								HostUart_State = STATE_HOST_UART_WAIT_COMMAND;
								break;
							} //case CMD_GPIO_MSB
							case CMD_READLIGHT:
							{
								//Process I2C command:
								ucHostCommandIndex--;
								switch(ucHostCommandIndex)
								{
									case 2:
									{
										ucLightIntSeconds = ucByteFromHost; //Not used yet (set to 2 seconds fixed)
										break;
									}
									case 1:
									{
										ucLightIntEnabled = ucByteFromHost; //This is for a timer interrupt
										break;
									}
									case 0:
									{
										ucLightUnused = ucByteFromHost; //Not used yet
										HostUart_State = STATE_HOST_UART_WAIT_COMMAND; //Last byte, we are done
									    read_light_sensor();
									    if (ucLightIntEnabled)
									    {
									        MSS_TIM1_clear_irq();
									        MSS_TIM1_enable_irq();

									    }
									    else if (!ucMotionIntEnabled) //This is shared!
									    {
									        MSS_TIM1_disable_irq();
									    }
										break;
									}
									default:
									{
										HostUart_State = STATE_HOST_UART_WAIT_COMMAND; //Length must be wrong, we are done
										break;
									}
									break;
								} //switch(ucHostCommandIndex)
								break;
							} //case CMD_READLIGHT
							case CMD_READMAX21105_INFO:
							{
							    read_MAX21105_info();
								HostUart_State = STATE_HOST_UART_WAIT_COMMAND; //Last byte, we are done
								break;
							} //case CMD_READMAX21105_INFO
							case CMD_READTEMPERATURE:
							{
							    read_temperature_sensor();
								HostUart_State = STATE_HOST_UART_WAIT_COMMAND; //Last byte, we are done
								break;
							} //case CMD_READTEMPERATURE
							case CMD_READMOTION:
							{
								//Process I2C command:
								ucHostCommandIndex--;
								switch(ucHostCommandIndex)
								{
									case 2:
									{
										//ucLightIntSeconds = ucByteFromHost; //Not used yet (set to 2 seconds fixed)
										break;
									}
									case 1:
									{
										ucMotionIntEnabled = ucByteFromHost; //This is for a timer interrupt
										break;
									}
									case 0:
									{
										//ucLightUnused = ucByteFromHost; //Not used yet
										HostUart_State = STATE_HOST_UART_WAIT_COMMAND; //Last byte, we are done
									    read_motion_sensor();
									    if (ucMotionIntEnabled)
									    {
									        MSS_TIM1_clear_irq();
									        MSS_TIM1_enable_irq();
									    }
									    else if (!ucLightIntEnabled) //This is shared!
									    {
									        MSS_TIM1_disable_irq();
									    }
										break;
									}
									default:
									{
										HostUart_State = STATE_HOST_UART_WAIT_COMMAND; //Length must be wrong, we are done
										break;
									}
									break;
								} //switch(ucHostCommandIndex)
								break;
							} //case CMD_READMOTION
							case CMD_SET_LED:
							{
								ucHostCommandIndex--;
								switch(ucHostCommandIndex)
								{
									case 1:
									{ // The first byte tells you the LED
										ucSetLedNumber = ucByteFromHost;
										break;
									} //case 1
									case 0:
									{ // The second byte tells you how to set it ('F' for off => 00b,'R' for red = 01b,'G' for green => 10b, 'A' for amber => 11b)
										ucSetLedSetting = ucByteFromHost;
										SetLED(ucSetLedNumber, ucSetLedSetting);
										HostUart_State = STATE_HOST_UART_WAIT_COMMAND; //Last byte, we are done
										break;
									} //case 0
									default:
									{
										HostUart_State = STATE_HOST_UART_WAIT_COMMAND; //Length must be wrong, we are done
										break;
									}
									break;
								} //switch(ucHostCommandIndex)
								break;
							} //case CMD_SET_LED
							case CMD_WRITE_FABRIC:
							{
								ucHostCommandIndex--;
								switch(ucHostCommandIndex)
								{
									case 1:
									{ // Address
										ucFabricAccessAddress = ucByteFromHost;
										break;
									} //case 1
									case 0:
									{ // Pmod2
										*((uint32_t volatile *) (fabric_base_address + ucFabricAccessAddress))   = ucByteFromHost;
										HostUart_State = STATE_HOST_UART_WAIT_COMMAND; //Last byte, we are done
										break;
									} //case 0
									default:
									{
										HostUart_State = STATE_HOST_UART_WAIT_COMMAND; //Length must be wrong, we are done
										break;
									}
									break;
								} //switch(ucHostCommandIndex)
								break;
							} //case CMD_WRITE_FABRIC
							case CMD_LED_PWM:
							{
								ucHostCommandIndex--;
								switch(ucHostCommandIndex)
								{
									case 2:
									{ // PWM enable
										//ucLedPwmEnable = ucByteFromHost; //not used yet
										break;
									} //case 2
									case 1:
									{ // Brightness
										*((uint32_t volatile *) (led_pwm_brightness_address))   = ucByteFromHost;
										break;
									} //case 1
									case 0:
									{ // Blinking
										*((uint32_t volatile *) (led_pwm_blinking_address))   = ucByteFromHost;
										HostUart_State = STATE_HOST_UART_WAIT_COMMAND; //Last byte, we are done
										break;
									} //case 0
									default:
									{
										HostUart_State = STATE_HOST_UART_WAIT_COMMAND; //Length must be wrong, we are done
										break;
									}
									break;
								} //switch(ucHostCommandIndex)
								break;
							} //case CMD_LED_PWM
							case CMD_ARM_LIGHT_INT:
							{
								ucHostCommandIndex--;
								switch(ucHostCommandIndex)
								{
									case 3:
									{ // Address
										ucLightThresholdIntEnabled = ucByteFromHost;
										break;
									} //case 3
									case 2:
									{ // Address
										ucLightThresholdUpper = ucByteFromHost;
										break;
									} //case 2
									case 1:
									{ // Address
										ucLightThresholdLower = ucByteFromHost;
										break;
									} //case 1
									case 0:
									{ // Pmod2
										ucLightThresholdTimout   = ucByteFromHost;
										ArmLightInterrupt();
										HostUart_State = STATE_HOST_UART_WAIT_COMMAND; //Last byte, we are done
										break;
									} //case 0
									default:
									{
										HostUart_State = STATE_HOST_UART_WAIT_COMMAND; //Length must be wrong, we are done
										break;
									}
									break;
								} //switch(ucHostCommandIndex)
								break;
							} //case CMD_ARM_LIGHT_INT
							case CMD_READ_FABRIC:
							{
								ucFabricAccessAddress = ucByteFromHost;
								//Report the same information to the host:
								uart1_tx_buff[uart1_tx_buff_putptr++] = TOHOST_MSG_READ_FABRIC;
								uart1_tx_buff[uart1_tx_buff_putptr++] = 2;        //message length
								uart1_tx_buff[uart1_tx_buff_putptr++] = ucFabricAccessAddress;
								uart1_tx_buff[uart1_tx_buff_putptr++] = *((uint32_t volatile *) (fabric_base_address+ucFabricAccessAddress));
								HostUart_State = STATE_HOST_UART_WAIT_COMMAND; //Last byte, we are done
								break;
							} //case CMD_READ_FABRIC
							case CMD_PING_ALIVE:
							{
								//Respond that we are alive here
								ReportPing();
								HostUart_State = STATE_HOST_UART_WAIT_COMMAND; //Last byte, we are done
								break;
							} //case CMD_PING_ALIVE
							case CMD_GET_STATUS:
							{
							    ReportStatus();
								HostUart_State = STATE_HOST_UART_WAIT_COMMAND; //Last byte, we are done
								break;
							} //case CMD_GET_STATUS
							case CMD_GET_VERSIONS:
							{
							    ReportVersions();
								HostUart_State = STATE_HOST_UART_WAIT_COMMAND; //Last byte, we are done
								break;
							} //case CMD_GET_VERSIONS
							case CMD_BLE_FACTORY_RESET:
							{
							    BLE_Factory_Reset(ucByteFromHost); //0 retains some settings, 1 is a complete factory reset
								HostUart_State = STATE_HOST_UART_WAIT_COMMAND; //Last byte, we are done
								break;
							} //case CMD_BLE_FACTORY_RESET
							case CMD_BLE_COMMS_CHANGE:
							{
							    if (ucByteFromHost == 0)
								{ //Slow
										MSS_UART_init(gp_my_uart0,
													  MSS_UART_38400_BAUD,
													  MSS_UART_DATA_8_BITS | MSS_UART_NO_PARITY | MSS_UART_ONE_STOP_BIT);
								} //Slow
							    else if (ucByteFromHost == 1)
						    	{ //Fast
									MSS_UART_init(gp_my_uart0,
												  MSS_UART_115200_BAUD,
												  MSS_UART_DATA_8_BITS | MSS_UART_NO_PARITY | MSS_UART_ONE_STOP_BIT);
						    	} //Fast
								HostUart_State = STATE_HOST_UART_WAIT_COMMAND; //Last byte, we are done
								break;
							} //case CMD_BLE_COMMS_CHANGE
							case CMD_BLE_SET_CMDMLDP:
							{
							    if (ucByteFromHost == 0)
								{ //CMD_MLDP = 0 -> CMD mode
							    	//Take the device out of MLDP: falling edge is needed
							    	BLE_nCMD_HI;
							    	WaitLocal10msTimerTicks(2);
							    	BLE_nCMD_LO;
							    	bMLDP_mode = false;
								} //0 -> CMD mode
							    else if (ucByteFromHost == 1)
								{ //CMD_MLDP = 1 -> MLDP mode
							    	//BLE_nCMD_HI;
							    	BLE_nCMD_LO; //This does not matter so much.  The user will enable MLDP mode
							    	bMLDP_mode = true;
								} //1 -> MLDP mode
							    else if (ucByteFromHost == 2) //force it high
								{ //CMD_MLDP = 1 -> MLDP mode
							    	BLE_nCMD_HI;
							    	//BLE_nCMD_LO; //This does not matter so much.  The user will enable MLDP mode
							    	bMLDP_mode = true;
								} //1 -> MLDP mode
								HostUart_State = STATE_HOST_UART_WAIT_COMMAND; //Last byte, we are done
								break;
							} //case CMD_BLE_SET_CMDMLDP
							case CMD_SELECT_TESTPINS:
							{
								*((uint32_t volatile *) (testpins_select_address))   = ucByteFromHost;
								HostUart_State = STATE_HOST_UART_WAIT_COMMAND; //Last byte, we are done
								break;
							} //case CMD_SELECT_TESTPINS
							case CMD_UPDATE_FABRIC_STATUS:
							{
								*((uint32_t volatile *) (fabric_control_address))   = ucByteFromHost;
								HostUart_State = STATE_HOST_UART_WAIT_COMMAND; //Last byte, we are done
								break;
							} //case CMD_UPDATE_FABRIC_STATUS
							case CMD_WIFI_ENABLE:
							{
								ucHostCommandIndex--;
								switch(ucHostCommandIndex)
								{
									case 2:
									{
										ucWebUpdateRateLSB = ucByteFromHost;
										break;
									} //case 2
									case 1:
									{
										ucWebUpdateRateMSB = ucByteFromHost;
										break;
									} //case 1
									case 0:
									{
										bWifiEnabled   = ucByteFromHost;
										if (bWifiEnabled)
										{
											*((uint32_t volatile *) (serialmux_select_address))		= 0x01;
											// Intialize the Rx FIFO for the interface UART
											InterfaceUartFifo_Config( );

											// Reset the json parser that determines object boundaries
											JsonParserReset( );

											//Enable us to report status every second or so using a timer:
											int iWebUpdateRate = ucWebUpdateRateLSB + 256 * ucWebUpdateRateMSB;
											int iTimer2Value = (int)(g_FrequencyPCLK0*(iWebUpdateRate/1000.0));
											//MSS_TIM2_load_immediate(g_FrequencyPCLK0*2); //2 seconds
											MSS_TIM2_load_immediate(iTimer2Value);

											MSS_TIM2_clear_irq();
											MSS_TIM2_enable_irq();
										}
										else
										{
									        MSS_TIM2_disable_irq(); //no more timer-driven updates
											*((uint32_t volatile *) (serialmux_select_address))		= 0x00;
										}
										HostUart_State = STATE_HOST_UART_WAIT_COMMAND; //Last byte, we are done
									} //case 0
									default:
									{
										HostUart_State = STATE_HOST_UART_WAIT_COMMAND; //Length must be wrong, we are done
										break;
									}
									break;
								} //switch(ucHostCommandIndex)
								break;
							} //case CMD_WIFI_ENABLE
							case CMD_SET_PERIPHERAL_MODE:
							{
								ucHostCommandIndex--;
								switch(ucHostCommandIndex)
								{
									case 1:
									{
										ucSelectedPeriperal = ucByteFromHost;
										break;
									} //case 1
									case 0:
									{
										if (ucSelectedPeriperal == 0)
										{
											*((uint32_t volatile *) (arduino_mode_address))   = ucByteFromHost;
										}
										if (ucSelectedPeriperal == 1)
										{
											*((uint32_t volatile *) (pmod1_mode_address))   = ucByteFromHost;
										}
										if (ucSelectedPeriperal == 2)
										{
											*((uint32_t volatile *) (pmod2_mode_address))   = ucByteFromHost;
										}
										if (ucSelectedPeriperal == 3)
										{
											*((uint32_t volatile *) (pmod3_mode_address))   = ucByteFromHost;
										}
										HostUart_State = STATE_HOST_UART_WAIT_COMMAND; //Last byte, we are done
									} //case 0
									default:
									{
										HostUart_State = STATE_HOST_UART_WAIT_COMMAND; //Length must be wrong, we are done
										break;
									}
									break;
								} //switch(ucHostCommandIndex)
								break;
							} //case CMD_SET_PERIPHERAL_MODE
							case CMD_WRITE_DAC:
							{
								ucHostCommandIndex--;
								switch(ucHostCommandIndex)
								{
									case 2:
									{
										ucDac1Enabled = ucByteFromHost; //In the host SW this is DAC2...
										break;
									} //case 2
									case 1:
									{
										ucDac0Data = ucByteFromHost;
										break;
									} //case 1
									case 0:
									{
										//Read AtoD's:
										dwADC0data = Read_AtoD_Converter(0); //Read ADC0
										if (ucDac1Enabled)
											dwADC1data = Read_AtoD_Converter(1); //Read ADC1
										//Report the result to the host:
										uart1_tx_buff[uart1_tx_buff_putptr++] = TOHOST_MSG_ADC_DATA;
										uart1_tx_buff[uart1_tx_buff_putptr++] = 8;        //message length
										uart1_tx_buff[uart1_tx_buff_putptr++] = (unsigned char)((dwADC0data & 0x00FF) >> 0);
										uart1_tx_buff[uart1_tx_buff_putptr++] = (unsigned char)((dwADC0data & 0xFF00) >> 8);
										uart1_tx_buff[uart1_tx_buff_putptr++] = (unsigned char)((dwADC1data & 0x00FF) >> 0);
										uart1_tx_buff[uart1_tx_buff_putptr++] = (unsigned char)((dwADC1data & 0xFF00) >> 8);
										uart1_tx_buff[uart1_tx_buff_putptr++] = ReadPeripheralRegister(0x08);
										uart1_tx_buff[uart1_tx_buff_putptr++] = ReadPeripheralRegister(0x09);
										uart1_tx_buff[uart1_tx_buff_putptr++] = ReadPeripheralRegister(0x0A);
										uart1_tx_buff[uart1_tx_buff_putptr++] = ReadPeripheralRegister(0x0B);
										//Write to DAC's:
										ucDac1Data = ucByteFromHost;
										Write_DtoA_Converter(1,ucDac0Data);
										if (ucDac1Enabled)
											Write_DtoA_Converter(2,ucDac1Data);

										HostUart_State = STATE_HOST_UART_WAIT_COMMAND; //Last byte, we are done
									} //case 0
									default:
									{
										HostUart_State = STATE_HOST_UART_WAIT_COMMAND; //Length must be wrong, we are done
										break;
									}
									break;
								} //switch(ucHostCommandIndex)
								break;
							} //case CMD_WRITE_DAC
							case CMD_CONFIGURE_DSP:
							{
								ucHostCommandIndex--;
								switch(ucHostCommandIndex)
								{
									case 4:
									{
										WritePeripheral2_Register(REGISTER_PMOD2_ADC0_OFFSET_LSB, ucByteFromHost);
										break;
									} //case 4
									case 3:
									{
										WritePeripheral2_Register(REGISTER_PMOD2_ADC0_OFFSET_MSB, ucByteFromHost);
										break;
									} //case 3
									case 2:
									{
										WritePeripheral2_Register(REGISTER_PMOD2_ADC1_OFFSET_LSB, ucByteFromHost);
										break;
									} //case 2
									case 1:
									{
										WritePeripheral2_Register(REGISTER_PMOD2_ADC1_OFFSET_MSB, ucByteFromHost);
										break;
									} //case 1
									case 0:
									{
										WritePeripheral2_Register(REGISTER_PMOD2_ADC_OFFSET_EN, ucByteFromHost);
										HostUart_State = STATE_HOST_UART_WAIT_COMMAND; //Last byte, we are done
									} //case 0
									default:
									{
										HostUart_State = STATE_HOST_UART_WAIT_COMMAND; //Length must be wrong, we are done
										break;
									}
									break;
								} //switch(ucHostCommandIndex)
								break;
							} //case CMD_CONFIGURE_DSP
							case CMD_SET_SERVO_PARAMETERS:
							{
								ucHostCommandIndex--;
								switch(ucHostCommandIndex)
								{
									case 2:
									{
										WritePeripheral1_Register(REGISTER_PMOD1_SERVO_PWM_LSB, ucByteFromHost);
										break;
									} //case 2
									case 1:
									{
										WritePeripheral1_Register(REGISTER_PMOD1_SERVO_PWM_MSB, ucByteFromHost);
										break;
									} //case 1
									case 0:
									{
										bServoEnabled = ucByteFromHost;
										iServoTimerTickCount = 0;
										HostUart_State = STATE_HOST_UART_WAIT_COMMAND; //Last byte, we are done
									} //case 0
									default:
									{
										HostUart_State = STATE_HOST_UART_WAIT_COMMAND; //Length must be wrong, we are done
										break;
									}
									break;
								} //switch(ucHostCommandIndex)
								break;
							} //case CMD_SET_SERVO_PARAMETERS

							case CMD_SET_SECURITY_PARAMETERS:
							{
								ucHostCommandIndex--;
								switch(ucHostCommandIndex)
								{
									case 2:
									{
										//WritePeripheral1_Register(REGISTER_PMOD1_SERVO_PWM_LSB, ucByteFromHost);
										break;
									} //case 2
									case 1:
									{
										bSecurityAccessGranted = ucByteFromHost;
										//WritePeripheral1_Register(REGISTER_PMOD1_SERVO_PWM_MSB, ucByteFromHost);
										break;
									} //case 1
									case 0:
									{
										bSecurityModeEnabled = ucByteFromHost;
									    ReportStatus(); // update status.  This will get Android LED colors updated iff it now has access
										HostUart_State = STATE_HOST_UART_WAIT_COMMAND; //Last byte, we are done
										break;
									} //case 0
									default:
									{
										HostUart_State = STATE_HOST_UART_WAIT_COMMAND; //Length must be wrong, we are done
										break;
									}
									break;
								} //switch(ucHostCommandIndex)
								break;
							} //case CMD_SET_SECURITY_PARAMETERS



							default:  /* Unknown Command */
							{
								HostUart_State = STATE_HOST_UART_WAIT_COMMAND;
								break;
							} //default
		    			} //switch ucHostCommand
						break;
					}

					default:  /* Unknown state */
					{
						HostUart_State = STATE_HOST_UART_WAIT_COMMAND;
						break;
					}
    			} //switch HostUart_State
            }  //while (uart1_rx_buff_getptr != uart1_rx_buff_putptr)
        } // if there are UART1 bytes to receive

        if (ucLightThresholdTriggered)
        {
        	read_light_sensor();
        	ucReadLight = 0;
            ucLightThresholdTriggered = 0;
        }
        if (ucReadLight)
        {
        	ucReadLight = 0;
        	read_light_sensor();
        }
        if (ucReadMotion)
        {
        	ucReadMotion = 0;
        	read_motion_sensor();
        	read_temperature_sensor();
        }
        if (ucButtonWasPushed)
        {
        	ReportStatus();
        	ucButtonWasPushed = 0;
        }
        if (ucBleConnectedStatusChanged && bMLDP_user_ready)
        {
        	bSecurityAccessGranted = false;  //immediately upon connection or disconnection assume that security access persmission is no longer valid
//			soft_delay100ms(2); //Wait for phone app to start...
//			soft_delay100ms(10); //Wait for phone app to start... (too short... almost 3 s)
			//soft_delay100ms(15); //Wait for phone app to start... (almost 4.5 seconds) - works
//			soft_delay100ms(20); //Wait for phone app to start... (almost 6 seconds) - works
        	ReportStatus();
        	ucBleConnectedStatusChanged = 0;
        }

		//***********************************************************************************************************************
		//                                           BLE UART Rx message decoding
		//***********************************************************************************************************************

        // Process responses from BLE module
        if ((bWifiEnabled == false) && (uart0_rx_buff_getptr != uart0_rx_buff_putptr))
        {
            while (uart0_rx_buff_getptr != uart0_rx_buff_putptr)
            {
            	ucBleByte = uart0_rx_buff[uart0_rx_buff_getptr++]; //Copy latest received byte
            	bBleEchoTimoutEnabled = false; //to protect the change
            	iBleEchoTimoutCount = 0;
            	bBleEchoTimoutEnabled = true; //un-protect the change
            	BLE_toHost_buff[BLE_toHost_buff_putptr++] = ucBleByte; //Echo received data back to USB host

                bSecurityAccessAllowed = !bSecurityModeEnabled || (bSecurityModeEnabled && bSecurityAccessGranted);
                switch(BleUart_State)
				{
					case STATE_BLE_UART_WAIT_PRECOMMAND1:
					{
						ucBleCommandLength = 0;
						// Wait for '<':
						if (ucBleByte == '<')
						{
							BleUart_State = STATE_BLE_UART_WAIT_PRECOMMAND2;
						}
						break;
					} //case STATE_BLE_UART_WAIT_PRECOMMAND1
					case STATE_BLE_UART_WAIT_PRECOMMAND2:
					{
						// Wait for '=':
						if (ucBleByte == '=')
						{
						    bMLDP_user_ready = true; // we have enough to believe the user can send MLDP commands
							BleUart_State = STATE_BLE_UART_WAIT_COMMAND;
						}
						else
						{
							BleUart_State = STATE_BLE_UART_WAIT_PRECOMMAND1; //bad sequence, go back to waiting
						}
						break;
					} //case STATE_BLE_UART_WAIT_PRECOMMAND2
					case STATE_BLE_UART_WAIT_COMMAND:
					{
						ucBleCommand = ucBleByte;
						ucBleCommandIndex = 0;
		                if ((bSecurityAccessAllowed == false) && (ucBleCommand != BLE_CMD_PASSWORD))
		                { // do not allow processing of any commands except the password
							BleUart_State = STATE_BLE_UART_WAIT_PRECOMMAND1;
		                }
		                else
		                {
		                	BleUart_State = STATE_BLE_UART_PROCESS_COMMAND;
		                }

						break;
					} //case STATE_BLE_UART_WAIT_COMMAND
					case STATE_BLE_UART_PROCESS_COMMAND:
					{
						switch(ucBleCommand)
						{
							case BLE_CMD_SET_LED:
							{
								switch(ucBleCommandIndex)
								{
									case 0:
									{ // The first byte tells you the LED
										ucSetLedNumber = ucBleByte - 0x30; //'0' is ascii 0x30
										break;
									} //case 0
									case 1:
									{ // The second byte tells you how to set it ('F' for off => 00b,'R' for red = 01b,'G' for green => 10b, 'A' for amber => 11b)
										ucSetLedSetting = ucBleByte;
										SetLED(ucSetLedNumber, ucSetLedSetting);
										BleUart_State = STATE_BLE_UART_WAIT_PRECOMMAND1; // we are done
										break;
									} //case 1
									default:
									{
										BleUart_State = STATE_BLE_UART_WAIT_PRECOMMAND1;
										break;
									} //default
								} //switch ucHostCommand
								break;
							} //case BLE_CMD_SET_LED
							case BLE_CMD_PASSWORD:
							{
								switch(ucBleCommandIndex)
								{
									case 0:
									{ // The first byte tells you the password type
										ucBlePayloadLength_type = ucBleByte - 0x30; //'0' is ascii 0x30
										break;
									} //case 0
									case 1:
									{ // The second byte tells you the password length 10's
										ucBlePayloadLength_tens = ucBleByte - 0x30; //'0' is ascii 0x30
										break;
									} //case 1
									case 2:
									{ // The third byte tells you the password length 1's
										ucBlePayloadLength_ones = ucBleByte - 0x30; //'0' is ascii 0x30
										ucBlePayloadLength = 10 * ucBlePayloadLength_tens + ucBlePayloadLength_ones;

										//Relay passwordn information to the USB host:
									    uart1_tx_buff[uart1_tx_buff_putptr++] = TOHOST_MSG_PASSWORD; //Character for Password to SF2
									    uart1_tx_buff[uart1_tx_buff_putptr++] = 1 + ucBlePayloadLength;        //message length
									    uart1_tx_buff[uart1_tx_buff_putptr++] = ucBlePayloadLength_type;   //password type

										break;
									} //case 2
									default:
									{
										uart1_tx_buff[uart1_tx_buff_putptr++] = ucBleByte;
										if (ucBleCommandIndex == (3 + ucBlePayloadLength-1))
										{
											BleUart_State = STATE_BLE_UART_WAIT_PRECOMMAND1; // we are done
										}
										break;
									} //default
								} //switch ucHostCommand
								break;
							} //case BLE_CMD_PASSWORD
							case BLE_CMD_GET_STATUS:
							{
								ReportStatus();
								BleUart_State = STATE_BLE_UART_WAIT_PRECOMMAND1;
								break;
							} //case BLE_CMD_GET_STATUS
							case BLE_CMD_READLIGHT:
							{
								if (ucBleByte == '1')
								{
									ucLightIntEnabled = 1;
								}
								else
								{
									ucLightIntEnabled = 0;
								}
							    read_light_sensor();
							    if (ucLightIntEnabled == 1)
							    {
							        MSS_TIM1_clear_irq();
							        MSS_TIM1_enable_irq();

							    }
							    else if (!ucMotionIntEnabled) //This is shared!
							    {
							        MSS_TIM1_disable_irq();
							    }
								BleUart_State = STATE_BLE_UART_WAIT_PRECOMMAND1;
								break;
							} //case BLE_CMD_READLIGHT
							case BLE_CMD_READMOTION:
							{
								if (ucBleByte == '1')
								{
									ucMotionIntEnabled = 1;
								}
								else
								{
									ucMotionIntEnabled = 0;
								}
							    read_motion_sensor();
							    if (ucMotionIntEnabled == 1)
							    {
							        MSS_TIM1_clear_irq();
							        MSS_TIM1_enable_irq();

							    }
							    else if (!ucLightIntEnabled) //This is shared!
							    {
							        MSS_TIM1_disable_irq();
							    }
								BleUart_State = STATE_BLE_UART_WAIT_PRECOMMAND1;
								break;
							} //case BLE_CMD_READMOTION
							case BLE_CMD_READTEMPERATURE:
							{
								if (ucBleByte == '1')
								{
									ucMotionIntEnabled = 1;
								}
								else
								{
									ucMotionIntEnabled = 0;
								}
							    read_temperature_sensor();
							    if (ucMotionIntEnabled == 1)
							    {
							        MSS_TIM1_clear_irq();
							        MSS_TIM1_enable_irq();

							    }
							    else if (!ucLightIntEnabled) //This is shared!
							    {
							        MSS_TIM1_disable_irq();
							    }
								BleUart_State = STATE_BLE_UART_WAIT_PRECOMMAND1;
								break;
							} //case BLE_CMD_READTEMPERATURE
							default:  /* Unknown Command */
							{
								BleUart_State = STATE_BLE_UART_WAIT_PRECOMMAND1;
								break;
							} //default
						} //switch ucHostCommand
						ucBleCommandIndex++;
						break;
					}//case STATE_BLE_UART_PROCESS_COMMAND

					default:  /* Unknown state */
					{
						BleUart_State = STATE_BLE_UART_WAIT_PRECOMMAND1;
						break;
					}
				} //switch BleUart_State
			}  //while (uart0_rx_buff_getptr != uart0_rx_buff_putptr)
        } // if there are UART0 bytes to receive

    } //end infinite loop


    return 0;
}

/*==============================================================================
  Get Hex Character from a 4-bit nibble
 ===============================================================================*/
unsigned char nibble_to_hexchar(unsigned char nibble_in)
{
	unsigned char char_out;
    switch(nibble_in)
    {
    case 0x0:
     {
    	 char_out = '0';
         break;
     }
    case 0x1:
     {
    	 char_out = '1';
         break;
     }
    case 0x2:
     {
    	 char_out = '2';
         break;
     }
    case 0x3:
     {
    	 char_out = '3';
         break;
     }
    case 0x4:
     {
    	 char_out = '4';
         break;
     }
    case 0x5:
     {
    	 char_out = '5';
         break;
     }
    case 0x6:
     {
    	 char_out = '6';
         break;
     }
    case 0x7:
     {
    	 char_out = '7';
         break;
     }
    case 0x8:
     {
    	 char_out = '8';
         break;
     }
    case 0x9:
     {
    	 char_out = '9';
         break;
     }
    case 0xA:
     {
    	 char_out = 'A';
         break;
     }
    case 0xB:
     {
    	 char_out = 'B';
         break;
     }
    case 0xC:
     {
    	 char_out = 'C';
         break;
     }
    case 0xD:
     {
    	 char_out = 'D';
         break;
     }
    case 0xE:
     {
    	 char_out = 'E';
         break;
     }
    case 0xF:
     {
    	 char_out = 'F';
         break;
     }
    default: //error
     {
    	 char_out = '?';
         break;
    }
    }
  return char_out;
  } //nibble_to_hexchar

/*==============================================================================
  Get Hex Character from a the upper 4-bit nibble of a byte
 ===============================================================================*/
unsigned char nibble_to_hexchar_MSN(unsigned char byte_in)
{
	unsigned char nibble;
	unsigned char nib_result;
	nibble = ((byte_in & 0xF0) >>4); //upper nibble (MSN)
	nib_result = (nibble_to_hexchar(nibble));
	return nib_result;
	//return (nibble_to_hexchar(nibble));
} //nibble_to_hexchar

/*==============================================================================
  Get Hex Character from a the lower 4-bit nibble of a byte
 ===============================================================================*/
unsigned char nibble_to_hexchar_LSN(unsigned char byte_in)
{
	unsigned char nibble;
	nibble = byte_in & 0x0F; //lower nibble (LSN)
    return nibble_to_hexchar(nibble);
} //nibble_to_hexchar

// ==============================================================================

/*------------------------------------------------------------------------------
 * Looped delay count (this is quite inaccurate!  so only use for looong delays)
 *------------------------------------------------------------------------------*/
static void soft_delay100ms(unsigned int delayms)
{
	unsigned int ms_index = delayms;
	volatile uint32_t delay_count;

	while (ms_index >0)
	{
		ms_index--;
		delay_count = SystemCoreClock / 128u;
		while(delay_count > 0u)
		{
			--delay_count;
		}
	}
}

/*------------------------------------------------------------------------------
 * Interrupt Handlers
 *------------------------------------------------------------------------------*/

/*------------------------------------------------------------------------------
 * SysTick_Handler is called every 10ms
 *------------------------------------------------------------------------------*/
void SysTick_Handler(void)
{
	//Service the I2C timeout functionality:
	MSS_I2C_system_tick(I2C0_MASTER, 10);
    MSS_I2C_system_tick(I2C1_MASTER, 10);
    if (iMyLocalTimoutCount && bMyLocalTimoutEnabled)
    {
    	iMyLocalTimoutCount--;
    	if (iMyLocalTimoutCount == 0)
    	{
    		bMyLocalTimoutExpired = true;
    	}
    }
	if (bBleEchoTimoutEnabled)
	{
		iBleEchoTimoutCount ++;
	}
	if (bServoEnabled)
	{  //Cause a new servo pulse every 20ms
		iServoTimerTickCount++;
		if ((iServoTimerTickCount & 0x01) == 0x01)  //every 2 counts = 20ms
		{
			WritePeripheral1_Register(REGISTER_PMOD1_SERVO_PWM_ENABLE, 0x00);
			WritePeripheral1_Register(REGISTER_PMOD1_SERVO_PWM_ENABLE, 0x01); //Cause a rising edge on the enable bit
		}
	}

} //SysTick_Handler

/* GPIO 0 Interrupt Handler */
void GPIO0_IRQHandler( void )
{ //Button 1 IRQ
	ucButtonWasPushed = 1;

	//This is added for a lab exercise to control the LED colors:
	//We get an interrupt on both edges, so check first if the button is high
	gpio_iput_pattern = MSS_GPIO_get_inputs();
	if (gpio_iput_pattern & 0x04) //Check the button level, on bit 2
	{
		ucLED_color_index++; //only the two LSB's are used.  The LSB controls the red filaments, other the green filament
		//Un-comment the line below to have color index go to fabric:
		//*((uint32_t volatile *) (fabric_control_address)) = ucLED_color_index << 1; //The two color control bits are on bits 1 and 2
	}

	MSS_GPIO_clear_irq( MSS_GPIO_0 );
	NVIC_ClearPendingIRQ( GPIO0_IRQn );

} //GPIO0_IRQHandler

/* GPIO 1 Interrupt Handler */
void GPIO1_IRQHandler( void )
{ //Button 2 IRQ
	ucButtonWasPushed = 1;
	MSS_GPIO_clear_irq( MSS_GPIO_1 );
	NVIC_ClearPendingIRQ( GPIO1_IRQn );
} //GPIO1_IRQHandler
/* GPIO 1 Interrupt Handler */

void GPIO4_IRQHandler( void )
{ //Light 2 IRQ
    if(ucLightThresholdIntEnabled)
    { //to eliminate errors when the interrupt line floats
        ucLightThresholdTriggered = 1;
    }
	MSS_GPIO_clear_irq( MSS_GPIO_4 );
	NVIC_ClearPendingIRQ( GPIO4_IRQn );
} //GPIO1_IRQHandler
/* GPIO 4 Interrupt Handler */

void GPIO5_IRQHandler( void )
{ //BT_CONNECTED IRQ
	ucBleConnectedStatusChanged = 1;
	MSS_GPIO_clear_irq( MSS_GPIO_5 );
	NVIC_ClearPendingIRQ( GPIO5_IRQn );
    bMLDP_user_ready = false;
    BLE_nCMD_LO; //make sure we are in CMD mode when we connect
} //GPIO5_IRQHandler


/*==============================================================================
 * Send sensor updates on TIM1 interrupt.
 */
void Timer1_IRQHandler(void)
{
	if (ucLightIntEnabled)
	{
		ucReadLight = 1;
	}
	if (ucMotionIntEnabled)
	{
		ucReadMotion = 1;
	}
	/* Clear TIM1 interrupt */
    MSS_TIM1_clear_irq();
}

/*==============================================================================
 * Send Wi-Fi updates on TIM2 interrupt.
 */
void Timer2_IRQHandler(void)
{
	if (bWifiEnabled)
	{
		bSendWifiUpdate = 1;
	}
	/* Clear TIM2 interrupt */
    MSS_TIM2_clear_irq();
}

