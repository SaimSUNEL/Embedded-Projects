/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright (c) 2020 STMicroelectronics.
  * All rights reserved.</center></h2>
  *
  * This software component is licensed by ST under BSD 3-Clause license,
  * the "License"; You may not use this file except in compliance with the
  * License. You may obtain a copy of the License at:
  *                        opensource.org/licenses/BSD-3-Clause
  *
  ******************************************************************************
  */
/* USER CODE END Header */

/* Includes ------------------------------------------------------------------*/
#include "main.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */
/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/

/* USER CODE BEGIN PV */

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
/* USER CODE BEGIN PFP */

/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */

/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{
  /* USER CODE BEGIN 1 */

  /* USER CODE END 1 */
  

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  /* USER CODE BEGIN 2 */

  /* USER CODE END 2 */
  uint32_t * RCC_APB2ENR = (uint32_t *)(RCC_BASE + 0x18UL); //

  *RCC_APB2ENR |= 0x0000000d+(1 << 11); //PORTA clock enabled TIM1 Clock Enabled...
  HAL_Delay(100);

  uint32_t * RCC_APB1ENR = (uint32_t *)(RCC_BASE+0x1CUL); //

  *RCC_APB1ENR |= 0x1;//TIM2 clock enable

  uint32_t * TIMx_BDTR = (uint32_t *)(TIM1_BASE + 0x44UL); //

  	  *TIMx_BDTR = (1 << 15) |(1 << 14);
  HAL_Delay(250);






  uint32_t * GPIOA_CRL = (uint32_t *)(GPIOA_BASE); //For PA14

  uint32_t * GPIOA_CRH = (uint32_t *)(GPIOA_BASE + 0x4); //For PA14
  uint32_t * GPIOA_ODR = (uint32_t *)(GPIOA_BASE + 0xc);
  //PA14 output, push pull
  *GPIOA_CRL &= 0xffffff00; //PWM pins are alternate push pull
  *GPIOA_CRL |= 0x000000aa;


  *GPIOA_CRH &= 0x00ffff0f;
  *GPIOA_CRH |= 0xaa0000a0;


  //Timer is fed with 8MHZ clock
  uint32_t * TIMx_CR1 = (uint32_t * )(TIM2_BASE);
  uint32_t * TIMx_CR2 = (uint32_t * ) (TIM2_BASE+0x4UL);

  //UIF: Update interrupt flag
  //– This bit is set by hardware on an update event. It is cleared by software.
  //CC1IF: Capture/compare 1 interrupt flag
  //If channel CC1 is configured as output:
  //This flag is set by hardware when the counter matches the compare value, with some
  //exception in center-aligned mode (refer to the CMS bits in the TIMx_CR1 register
  //description). It is cleared by software.
  uint32_t * TIMx_SR = (uint32_t * ) (TIM2_BASE+0x10UL);


  uint32_t * TIMx_CCMR1 = (uint32_t*) (TIM2_BASE+0x18UL);
  uint32_t * TIMx_CCER = (uint32_t*) (TIM2_BASE+0x20UL);
  uint32_t * TIMx_CNT = (uint32_t*)(TIM2_BASE+0x24UL);
  uint32_t * TIMx_PSC = (uint32_t*)(TIM2_BASE+0x28UL);
  uint32_t * TIMx_ARR = (uint32_t*)(TIM2_BASE+0x2cUL);
  uint32_t * TIMx_CCR1 = (uint32_t*)(TIM2_BASE+0x38UL); //actually CCR2
  uint32_t * TIMx_RCR = (uint32_t*)(TIM2_BASE+0x30UL);
  *TIMx_RCR = 0; //Repetition value




  *TIMx_CNT = 0;

  //master modde reset, CCx DMA request sent when CCx event occurs
  *TIMx_CR2 = 0;



  //PWM mode 1, preload enabled, fast enabled, CCPR1 output
  //*TIMx_CCMR1 = 0b110_1_1_00;
  *TIMx_CCMR1 = (0b1101100 << 8); //CCP2 output

// CCP1 output active high, output enable = 1
  *TIMx_CCER = 3 << 3; //CCP2 out enabled..

  *TIMx_PSC = 2000;
  *TIMx_ARR = 1000;
  *TIMx_CCR1 = 800;


  //FLCK/4, ARPE - auot Reload buffer enabled- edge aligned, up counter , counter does not stop at event
   //Only overflow underflow will generate event, update will occur, counter enabled...
   //TIMx_CR1 = 0b10_1_00_0_0_1_0_1;
   *TIMx_CR1 = 0b1010000101;






  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  *GPIOA_ODR ^= (1 << 15);

  while (1)
  {
    /* USER CODE END WHILE */
	  *GPIOA_ODR ^= (1 << 14);
	  *GPIOA_ODR ^= (1 << 15);

		  HAL_Delay(1000);
    /* USER CODE BEGIN 3 */
  }
  /* USER CODE END 3 */
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};

  /** Initializes the CPU, AHB and APB busses clocks 
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.HSICalibrationValue = RCC_HSICALIBRATION_DEFAULT;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_NONE;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }
  /** Initializes the CPU, AHB and APB busses clocks 
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_HSI;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV1;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_0) != HAL_OK)
  {
    Error_Handler();
  }
}

/* USER CODE BEGIN 4 */

/* USER CODE END 4 */

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */

  /* USER CODE END Error_Handler_Debug */
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{ 
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     tex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
