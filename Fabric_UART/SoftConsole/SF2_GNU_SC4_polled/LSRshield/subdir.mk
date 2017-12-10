################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../LSRshield/circular_buffer.c \
../LSRshield/jsmn.c \
../LSRshield/json_framer.c \
../LSRshield/json_helper.c \
../LSRshield/tiwi_framework.c \
../LSRshield/tiwi_frameworkGenerated.c \
../LSRshield/tiwi_max21105TemperatureSensorProfile.c \
../LSRshield/tiwi_max44009AmbientLightSensorProfile.c \
../LSRshield/tiwi_pushbuttonSwitches2Profile.c \
../LSRshield/tiwi_userLedU5Profile.c \
../LSRshield/tiwi_userLedU6Profile.c \
../LSRshield/tiwi_userLedU7Profile.c \
../LSRshield/tiwi_userLedU8Profile.c 

OBJS += \
./LSRshield/circular_buffer.o \
./LSRshield/jsmn.o \
./LSRshield/json_framer.o \
./LSRshield/json_helper.o \
./LSRshield/tiwi_framework.o \
./LSRshield/tiwi_frameworkGenerated.o \
./LSRshield/tiwi_max21105TemperatureSensorProfile.o \
./LSRshield/tiwi_max44009AmbientLightSensorProfile.o \
./LSRshield/tiwi_pushbuttonSwitches2Profile.o \
./LSRshield/tiwi_userLedU5Profile.o \
./LSRshield/tiwi_userLedU6Profile.o \
./LSRshield/tiwi_userLedU7Profile.o \
./LSRshield/tiwi_userLedU8Profile.o 

C_DEPS += \
./LSRshield/circular_buffer.d \
./LSRshield/jsmn.d \
./LSRshield/json_framer.d \
./LSRshield/json_helper.d \
./LSRshield/tiwi_framework.d \
./LSRshield/tiwi_frameworkGenerated.d \
./LSRshield/tiwi_max21105TemperatureSensorProfile.d \
./LSRshield/tiwi_max44009AmbientLightSensorProfile.d \
./LSRshield/tiwi_pushbuttonSwitches2Profile.d \
./LSRshield/tiwi_userLedU5Profile.d \
./LSRshield/tiwi_userLedU6Profile.d \
./LSRshield/tiwi_userLedU7Profile.d \
./LSRshield/tiwi_userLedU8Profile.d 


# Each subdirectory must supply rules for building sources it contributes
LSRshield/%.o: ../LSRshield/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g -I../hal -I../hal/CortexM3 -I../hal/CortexM3/GNU -I../LSRshield -std=gnu11 --specs=cmsis.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


