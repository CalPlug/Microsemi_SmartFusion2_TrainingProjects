/*
 * main.c
 *
 *  Created on: Feb 6, 2017
 *      Author: Hiperwall
 */

#include "drivers/mss_gpio/mss_gpio.h"
#include "CMSIS/system_m2sxxx.h"

/*======================================================================
  Private functions.
 */
static void delay(void);

/*======================================================================
 * main() function.
 */
int main()
{
	/*
	 * Initialize MSS GPIOs.
	 */

	MSS_GPIO_init( );

	/*
	 * Configure MSS GPIOs.
	 */
	MSS_GPIO_config( MSS_GPIO_0 , MSS_GPIO_OUTPUT_MODE );
	MSS_GPIO_config( MSS_GPIO_1 , MSS_GPIO_OUTPUT_MODE );
	MSS_GPIO_config( MSS_GPIO_2 , MSS_GPIO_OUTPUT_MODE );
	MSS_GPIO_config( MSS_GPIO_3 , MSS_GPIO_OUTPUT_MODE );

	/*
	 * Infinite Loop.
	 */
	for(;;)
	{
		uint32_t gpio_pattern;
		/*
		 * Decrement delay counter.
		 */
		delay();

		/*
		 * Toggle GPIO output pattern by doing an exclusive OR of all
		 * pattern bits with ones.
		 */
		gpio_pattern = MSS_GPIO_get_outputs();
		gpio_pattern ^= 0xFFFFFFFF;
		MSS_GPIO_set_outputs( gpio_pattern );
	}

	return 0;
}

/*======================================================================
  Delay between displays of the watch dog counter value.
 */
static void delay(void)
{
	volatile uint32_t delay_count = SystemCoreClock / 128u;

	while(delay_count > 0u)
	{
		--delay_count;
	}
}

