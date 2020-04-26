################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include Drivers/STM32F1xx_HAL_Driver/Src/subdir.mk
-include Core/Startup/subdir.mk
-include Core/Src/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
EXECUTABLES += \
STM32Timer2Pwm.elf \

SIZE_OUTPUT += \
default.size.stdout \

OBJDUMP_LIST += \
STM32Timer2Pwm.list \

OBJCOPY_HEX += \
STM32Timer2Pwm.hex \

OBJCOPY_BIN += \
STM32Timer2Pwm.bin \


# All Target
all: STM32Timer2Pwm.elf secondary-outputs

# Tool invocations
STM32Timer2Pwm.elf: $(OBJS) $(USER_OBJS) C:\Users\Saim\STM32CubeIDE\workspace_1.2.0\STM32Timer2Pwm\STM32F103C6TX_FLASH.ld
	arm-none-eabi-gcc -o "STM32Timer2Pwm.elf" @"objects.list" $(USER_OBJS) $(LIBS) -mcpu=cortex-m3 -T"C:\Users\Saim\STM32CubeIDE\workspace_1.2.0\STM32Timer2Pwm\STM32F103C6TX_FLASH.ld" --specs=nosys.specs -Wl,-Map="STM32Timer2Pwm.map" -Wl,--gc-sections -static --specs=nano.specs -mfloat-abi=soft -mthumb -Wl,--start-group -lc -lm -Wl,--end-group
	@echo 'Finished building target: $@'
	@echo ' '

default.size.stdout: $(EXECUTABLES)
	arm-none-eabi-size  $(EXECUTABLES)
	@echo 'Finished building: $@'
	@echo ' '

STM32Timer2Pwm.list: $(EXECUTABLES)
	arm-none-eabi-objdump -h -S $(EXECUTABLES) > "STM32Timer2Pwm.list"
	@echo 'Finished building: $@'
	@echo ' '

STM32Timer2Pwm.hex: $(EXECUTABLES)
	arm-none-eabi-objcopy  -O ihex $(EXECUTABLES) "STM32Timer2Pwm.hex"
	@echo 'Finished building: $@'
	@echo ' '

STM32Timer2Pwm.bin: $(EXECUTABLES)
	arm-none-eabi-objcopy  -O binary $(EXECUTABLES) "STM32Timer2Pwm.bin"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) *
	-@echo ' '

secondary-outputs: $(SIZE_OUTPUT) $(OBJDUMP_LIST) $(OBJCOPY_HEX) $(OBJCOPY_BIN)

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
