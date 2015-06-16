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

// See: Clock/calendar implementation on the STM32F10xxx microcontroller RTC
// http://www.st.com/web/en/resource/technical/document/application_note/CD00207941.pdf
void initRtc() {
  // Enable the APB1 backup domain and power register
  RCC_APB1PeriphClockCmd(RCC_APB1Periph_BKP|RCC_APB1Periph_PWR, ENABLE);
  // Disable backup domain write protection.
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
  #elif defined(CLK_SRC_INT)
    RCC_LSICmd(ENABLE);
    for (uint16_t i = 0; i < 1<<15; i++) {
      if (RCC_GetFlagStatus(RCC_FLAG_LSIRDY) == SET) {
        trace_printf("LSI clock became ready at iteration %d.\n", i);
        break;
      }
    }
    RCC_RTCCLKConfig(RCC_RTCCLKSource_LSI);
  #endif
  RCC_RTCCLKCmd(ENABLE);
  RTC_WaitForSynchro();
  RTC_WaitForLastTask();

  RTC_EnterConfigMode();
  RTC_SetPrescaler(124 * 295);  // Value: app note 3371 page 9/45.
  RTC_ITConfig(RTC_IT_SEC|RTC_IT_ALR, ENABLE);
  RTC_WaitForLastTask();
  RTC_ExitConfigMode();

  PWR_BackupAccessCmd(DISABLE);

  NVIC_InitTypeDef NVIC_InitStructure;
  NVIC_InitStructure.NVIC_IRQChannel = RTC_IRQn;
  NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 0;
  NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0;
  NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
  NVIC_Init(&NVIC_InitStructure);
  NVIC_SetPriority(RTC_IRQn, NVIC_EncodePriority(0, 0, 0));
}


void RTC_IRQHandler(void) {
  if (RTC_GetFlagStatus(RTC_FLAG_SEC) ) {
    RTC_ClearFlag(RTC_FLAG_SEC);
    trace_puts("RTC Second interrupt!");
  } else {
    trace_puts("Unknown RTC interrupt!");
  }
}


void RCC_IRQHandler(void) {
  if (RTC_GetFlagStatus(RTC_FLAG_SEC) ) {
    RTC_ClearFlag(RTC_FLAG_SEC);
    trace_puts("RCC Second interrupt!");
  } else {
    trace_puts("Unknown RCC interrupt!");
  }
}


#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wunused-parameter"
#pragma GCC diagnostic ignored "-Wmissing-declarations"
#pragma GCC diagnostic ignored "-Wreturn-type"
int main(int argc, char* argv[]) {
  trace_puts("VfdClock main() init.");
  initRtc();
  trace_puts("VfdClock main() init done.");
  while (1) {
    (void)0;
  }
}
#pragma GCC diagnostic pop
