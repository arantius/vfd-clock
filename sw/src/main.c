#include <stdio.h>
#include <stdlib.h>

#include "diag/Trace.h"
#include "misc.h"
#include "stm32f10x.h"
#include "stm32f10x_pwr.h"
#include "stm32f10x_rcc.h"
#include "stm32f10x_rtc.h"

// Define either _INT or _EXT to select low-speed clock source.
#define CLK_SRC_INT


// AN2821: Clock/calendar implementation on the STM32F10xxx microcontroller RTC
// http://www.st.com/web/en/resource/technical/document/application_note/CD00207941.pdf
void initRtc() {
  RCC_APB1PeriphClockCmd(RCC_APB1Periph_BKP|RCC_APB1Periph_PWR, ENABLE);
  PWR_BackupAccessCmd(ENABLE);

  #if defined(CLK_SRC_EXT)
    RCC_LSEConfig(RCC_LSE_ON);
    for (uint16_t i = 0; i < 1<<15; i++) {
      if (RCC_GetFlagStatus(RCC_FLAG_LSERDY) == SET) {
        trace_printf("LSE clock became ready at iteration %d.\n", i);
        break;
      }
    }
    RCC_RTCCLKConfig(RCC_RTCCLKSource_LSE);
    RTC_WaitForLastTask();
    RTC_SetPrescaler(32768);  // Watch crystal.
    RTC_WaitForLastTask();
  #elif defined(CLK_SRC_INT)
    RCC_LSICmd(ENABLE);
    for (uint16_t i = 0; i < 1<<15; i++) {
      if (RCC_GetFlagStatus(RCC_FLAG_LSIRDY) == SET) {
        trace_printf("LSI clock became ready at iteration %d.\n", i);
        break;
      }
    }
    RCC_RTCCLKConfig(RCC_RTCCLKSource_LSI);
    RTC_WaitForLastTask();
    // RM0041, page 74: "The clock frequency is around 40kHz."
    RTC_SetPrescaler(40500);
    RTC_WaitForLastTask();
  #endif
  RCC_RTCCLKCmd(ENABLE);
  RTC_WaitForSynchro();
  RTC_WaitForLastTask();

  // Default value: midnight Jan 1, 2015.
  RTC_SetCounter(1420070400);
  RTC_WaitForLastTask();

  RTC_ClearITPendingBit(RTC_IT_SEC);
  RTC_ITConfig(RTC_IT_ALR|RTC_IT_OW, DISABLE);
  RTC_ITConfig(RTC_IT_SEC, ENABLE);
  RTC_WaitForLastTask();

  PWR_BackupAccessCmd(DISABLE);

  NVIC_InitTypeDef NVIC_InitStructure = {
    .NVIC_IRQChannel = RTC_IRQn,
    .NVIC_IRQChannelPreemptionPriority = 1,
    .NVIC_IRQChannelSubPriority = 0,
    .NVIC_IRQChannelCmd = ENABLE
  };
  NVIC_Init(&NVIC_InitStructure);
}


void initGpio() {
  RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOB, ENABLE);
  GPIO_InitTypeDef GPIO_InitStructure = {
      .GPIO_Pin = GPIO_Pin_8,
      .GPIO_Mode = GPIO_Mode_IPU,  // Input, pull up.
      .GPIO_Speed = GPIO_Speed_2MHz,
  };
  GPIO_Init(GPIOB, &GPIO_InitStructure);
}

void RTC_IRQHandler(void) {
  if (RTC_GetFlagStatus(RTC_FLAG_SEC) ) {
    RTC_ClearFlag(RTC_FLAG_SEC);
    trace_printf("RTC Second interrupt! RTC Counter: %d\n", RTC_GetCounter());
  } else {
    trace_puts("Unknown RTC interrupt!");
  }
}


//void SysTick_Handler(void) {
//  trace_printf("Sys tick! RTC Counter: %d\n", RTC_GetCounter());
//}


#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wunused-parameter"
#pragma GCC diagnostic ignored "-Wmissing-declarations"
#pragma GCC diagnostic ignored "-Wreturn-type"
int main(int argc, char* argv[]) {
  trace_puts("VfdClock main() init.");
  initGpio();
  initRtc();
//  SysTick_Config(15000000);
  trace_puts("VfdClock main() init done.");

  while (1) {
    if (GPIO_ReadInputDataBit(GPIOB, GPIO_Pin_8)) {
      trace_puts("Button down!");

      PWR_BackupAccessCmd(ENABLE);
      RTC_WaitForLastTask();
      RTC_SetCounter(1435276229);
      RTC_WaitForLastTask();
      PWR_BackupAccessCmd(DISABLE);
      RTC_WaitForLastTask();
    }
  }
}
#pragma GCC diagnostic pop
