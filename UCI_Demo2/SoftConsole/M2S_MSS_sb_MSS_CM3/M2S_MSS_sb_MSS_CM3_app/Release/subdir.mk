################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../main.c 

OBJS += \
./main.o 

C_DEPS += \
./main.d 


# Each subdirectory must supply rules for building sources it contributes
%.o: ../%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU C Compiler'
	arm-none-eabi-gcc -mthumb -mcpu=cortex-m3 -DNDEBUG -IC:\Users\Hiperwall\Desktop\microsemilab\UCI_Demo2\SoftConsole\M2S_MSS_sb_MSS_CM3\M2S_MSS_sb_MSS_CM3_hw_platform -IC:\Users\Hiperwall\Desktop\microsemilab\UCI_Demo2\SoftConsole\M2S_MSS_sb_MSS_CM3\M2S_MSS_sb_MSS_CM3_hw_platform\CMSIS -IC:\Users\Hiperwall\Desktop\microsemilab\UCI_Demo2\SoftConsole\M2S_MSS_sb_MSS_CM3\M2S_MSS_sb_MSS_CM3_hw_platform\CMSIS\startup_gcc -IC:\Users\Hiperwall\Desktop\microsemilab\UCI_Demo2\SoftConsole\M2S_MSS_sb_MSS_CM3\M2S_MSS_sb_MSS_CM3_hw_platform\drivers -IC:\Users\Hiperwall\Desktop\microsemilab\UCI_Demo2\SoftConsole\M2S_MSS_sb_MSS_CM3\M2S_MSS_sb_MSS_CM3_hw_platform\drivers\mss_gpio -IC:\Users\Hiperwall\Desktop\microsemilab\UCI_Demo2\SoftConsole\M2S_MSS_sb_MSS_CM3\M2S_MSS_sb_MSS_CM3_hw_platform\drivers\mss_hpdma -IC:\Users\Hiperwall\Desktop\microsemilab\UCI_Demo2\SoftConsole\M2S_MSS_sb_MSS_CM3\M2S_MSS_sb_MSS_CM3_hw_platform\drivers\mss_i2c -IC:\Users\Hiperwall\Desktop\microsemilab\UCI_Demo2\SoftConsole\M2S_MSS_sb_MSS_CM3\M2S_MSS_sb_MSS_CM3_hw_platform\drivers\mss_nvm -IC:\Users\Hiperwall\Desktop\microsemilab\UCI_Demo2\SoftConsole\M2S_MSS_sb_MSS_CM3\M2S_MSS_sb_MSS_CM3_hw_platform\drivers\mss_pdma -IC:\Users\Hiperwall\Desktop\microsemilab\UCI_Demo2\SoftConsole\M2S_MSS_sb_MSS_CM3\M2S_MSS_sb_MSS_CM3_hw_platform\drivers\mss_rtc -IC:\Users\Hiperwall\Desktop\microsemilab\UCI_Demo2\SoftConsole\M2S_MSS_sb_MSS_CM3\M2S_MSS_sb_MSS_CM3_hw_platform\drivers\mss_spi -IC:\Users\Hiperwall\Desktop\microsemilab\UCI_Demo2\SoftConsole\M2S_MSS_sb_MSS_CM3\M2S_MSS_sb_MSS_CM3_hw_platform\drivers\mss_sys_services -IC:\Users\Hiperwall\Desktop\microsemilab\UCI_Demo2\SoftConsole\M2S_MSS_sb_MSS_CM3\M2S_MSS_sb_MSS_CM3_hw_platform\drivers\mss_timer -IC:\Users\Hiperwall\Desktop\microsemilab\UCI_Demo2\SoftConsole\M2S_MSS_sb_MSS_CM3\M2S_MSS_sb_MSS_CM3_hw_platform\drivers\mss_uart -IC:\Users\Hiperwall\Desktop\microsemilab\UCI_Demo2\SoftConsole\M2S_MSS_sb_MSS_CM3\M2S_MSS_sb_MSS_CM3_hw_platform\drivers_config -IC:\Users\Hiperwall\Desktop\microsemilab\UCI_Demo2\SoftConsole\M2S_MSS_sb_MSS_CM3\M2S_MSS_sb_MSS_CM3_hw_platform\drivers_config\sys_config -IC:\Users\Hiperwall\Desktop\microsemilab\UCI_Demo2\SoftConsole\M2S_MSS_sb_MSS_CM3\M2S_MSS_sb_MSS_CM3_hw_platform\hal -IC:\Users\Hiperwall\Desktop\microsemilab\UCI_Demo2\SoftConsole\M2S_MSS_sb_MSS_CM3\M2S_MSS_sb_MSS_CM3_hw_platform\hal\CortexM3 -IC:\Users\Hiperwall\Desktop\microsemilab\UCI_Demo2\SoftConsole\M2S_MSS_sb_MSS_CM3\M2S_MSS_sb_MSS_CM3_hw_platform\hal\CortexM3\GNU -O2 -ffunction-sections -fdata-sections -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


