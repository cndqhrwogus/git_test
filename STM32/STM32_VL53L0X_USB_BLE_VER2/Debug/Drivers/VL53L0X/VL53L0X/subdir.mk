################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/VL53L0X/VL53L0X/vl53l0x_api.c \
../Drivers/VL53L0X/VL53L0X/vl53l0x_api_calibration.c \
../Drivers/VL53L0X/VL53L0X/vl53l0x_api_core.c \
../Drivers/VL53L0X/VL53L0X/vl53l0x_api_ranging.c \
../Drivers/VL53L0X/VL53L0X/vl53l0x_api_strings.c \
../Drivers/VL53L0X/VL53L0X/vl53l0x_i2c_platform_hal.c \
../Drivers/VL53L0X/VL53L0X/vl53l0x_platform.c \
../Drivers/VL53L0X/VL53L0X/vl53l0x_platform_log.c 

OBJS += \
./Drivers/VL53L0X/VL53L0X/vl53l0x_api.o \
./Drivers/VL53L0X/VL53L0X/vl53l0x_api_calibration.o \
./Drivers/VL53L0X/VL53L0X/vl53l0x_api_core.o \
./Drivers/VL53L0X/VL53L0X/vl53l0x_api_ranging.o \
./Drivers/VL53L0X/VL53L0X/vl53l0x_api_strings.o \
./Drivers/VL53L0X/VL53L0X/vl53l0x_i2c_platform_hal.o \
./Drivers/VL53L0X/VL53L0X/vl53l0x_platform.o \
./Drivers/VL53L0X/VL53L0X/vl53l0x_platform_log.o 

C_DEPS += \
./Drivers/VL53L0X/VL53L0X/vl53l0x_api.d \
./Drivers/VL53L0X/VL53L0X/vl53l0x_api_calibration.d \
./Drivers/VL53L0X/VL53L0X/vl53l0x_api_core.d \
./Drivers/VL53L0X/VL53L0X/vl53l0x_api_ranging.d \
./Drivers/VL53L0X/VL53L0X/vl53l0x_api_strings.d \
./Drivers/VL53L0X/VL53L0X/vl53l0x_i2c_platform_hal.d \
./Drivers/VL53L0X/VL53L0X/vl53l0x_platform.d \
./Drivers/VL53L0X/VL53L0X/vl53l0x_platform_log.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/VL53L0X/VL53L0X/%.o Drivers/VL53L0X/VL53L0X/%.su: ../Drivers/VL53L0X/VL53L0X/%.c Drivers/VL53L0X/VL53L0X/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32WB55xx -c -I../Core/Inc -I"C:/Users/ccfox/STM32CubeIDE/workspace_1.10.1/STM32_VL53L0X_USB_BLE_VER2/Drivers/VL53L0X/VL53L0X" -I../USB_Device/App -I../USB_Device/Target -I../Drivers/STM32WBxx_HAL_Driver/Inc -I../Drivers/STM32WBxx_HAL_Driver/Inc/Legacy -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I../Drivers/CMSIS/Device/ST/STM32WBxx/Include -I../Drivers/CMSIS/Include -I../STM32_WPAN/App -I../Utilities/lpm/tiny_lpm -I../Middlewares/ST/STM32_WPAN -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/tl -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/shci -I../Middlewares/ST/STM32_WPAN/utilities -I../Middlewares/ST/STM32_WPAN/ble/core -I../Middlewares/ST/STM32_WPAN/ble/core/auto -I../Middlewares/ST/STM32_WPAN/ble/core/template -I../Middlewares/ST/STM32_WPAN/ble/svc/Inc -I../Middlewares/ST/STM32_WPAN/ble/svc/Src -I../Utilities/sequencer -I../Middlewares/ST/STM32_WPAN/ble -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-VL53L0X-2f-VL53L0X

clean-Drivers-2f-VL53L0X-2f-VL53L0X:
	-$(RM) ./Drivers/VL53L0X/VL53L0X/vl53l0x_api.d ./Drivers/VL53L0X/VL53L0X/vl53l0x_api.o ./Drivers/VL53L0X/VL53L0X/vl53l0x_api.su ./Drivers/VL53L0X/VL53L0X/vl53l0x_api_calibration.d ./Drivers/VL53L0X/VL53L0X/vl53l0x_api_calibration.o ./Drivers/VL53L0X/VL53L0X/vl53l0x_api_calibration.su ./Drivers/VL53L0X/VL53L0X/vl53l0x_api_core.d ./Drivers/VL53L0X/VL53L0X/vl53l0x_api_core.o ./Drivers/VL53L0X/VL53L0X/vl53l0x_api_core.su ./Drivers/VL53L0X/VL53L0X/vl53l0x_api_ranging.d ./Drivers/VL53L0X/VL53L0X/vl53l0x_api_ranging.o ./Drivers/VL53L0X/VL53L0X/vl53l0x_api_ranging.su ./Drivers/VL53L0X/VL53L0X/vl53l0x_api_strings.d ./Drivers/VL53L0X/VL53L0X/vl53l0x_api_strings.o ./Drivers/VL53L0X/VL53L0X/vl53l0x_api_strings.su ./Drivers/VL53L0X/VL53L0X/vl53l0x_i2c_platform_hal.d ./Drivers/VL53L0X/VL53L0X/vl53l0x_i2c_platform_hal.o ./Drivers/VL53L0X/VL53L0X/vl53l0x_i2c_platform_hal.su ./Drivers/VL53L0X/VL53L0X/vl53l0x_platform.d ./Drivers/VL53L0X/VL53L0X/vl53l0x_platform.o ./Drivers/VL53L0X/VL53L0X/vl53l0x_platform.su ./Drivers/VL53L0X/VL53L0X/vl53l0x_platform_log.d ./Drivers/VL53L0X/VL53L0X/vl53l0x_platform_log.o ./Drivers/VL53L0X/VL53L0X/vl53l0x_platform_log.su

.PHONY: clean-Drivers-2f-VL53L0X-2f-VL53L0X

