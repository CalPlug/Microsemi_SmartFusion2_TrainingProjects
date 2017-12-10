################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../drivers/CoreI2C/core_i2c.c \
../drivers/CoreI2C/i2c_interrupt.c 

OBJS += \
./drivers/CoreI2C/core_i2c.o \
./drivers/CoreI2C/i2c_interrupt.o 

C_DEPS += \
./drivers/CoreI2C/core_i2c.d \
./drivers/CoreI2C/i2c_interrupt.d 


# Each subdirectory must supply rules for building sources it contributes
drivers/CoreI2C/%.o: ../drivers/CoreI2C/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g3 -I../CMSIS -I../hal -I../hal/CortexM3 -I../hal/CortexM3/GNU -I../drivers/CoreUARTapb -I../drivers_config/sys_config -std=gnu11 --specs=cmsis.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


