/*
Copyright (C) 2015  Anthony Lieuallen

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#include "diag/Trace.h"
#include "misc.h"
#include "stm32f10x.h"
#include "stm32f10x_pwr.h"
#include "stm32f10x_rcc.h"
#include "stm32f10x_rtc.h"

// Define either _INT or _EXT to select low-speed clock source.
#define CLK_SRC_INT

// \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ //

// Maple's built in LED.
#define LED_PORT GPIOB
#define LED_PIN GPIO_Pin_1
// Maple's built in button.
#define BTN_PORT GPIOB
#define BTN_PIN GPIO_Pin_8

#define BTN_DIM_PORT GPIOB
#define BTN_DIM_PIN GPIO_Pin_10
#define BTN_SET_PORT GPIOB
#define BTN_SET_PIN GPIO_Pin_12
#define BTN_UP_PORT GPIOB
#define BTN_UP_PIN GPIO_Pin_13
#define BTN_DN_PORT GPIOB
#define BTN_DN_PIN GPIO_Pin_11

#define DA_PORT GPIOB
#define DA_PIN GPIO_Pin_6
#define DB_PORT GPIOB
#define DB_PIN GPIO_Pin_5
#define DC_PORT GPIOB
#define DC_PIN GPIO_Pin_4
#define DD_PORT GPIOB
#define DD_PIN GPIO_Pin_3

#define DP_PORT GPIOB  // Decimal point.
#define DP_PIN GPIO_Pin_7

#define STROBE1_PORT GPIOA
#define STROBE1_PIN GPIO_Pin_2
#define STROBE2_PORT GPIOA
#define STROBE2_PIN GPIO_Pin_3
#define STROBE3_PORT GPIOA
#define STROBE3_PIN GPIO_Pin_4
#define STROBE4_PORT GPIOA
#define STROBE4_PIN GPIO_Pin_5
#define STROBE5_PORT GPIOA
#define STROBE5_PIN GPIO_Pin_6
#define STROBE6_PORT GPIOA
#define STROBE6_PIN GPIO_Pin_7

#define GRID_PORT GPIOA
#define GRID_PIN GPIO_Pin_0
#define BUZ_PORT GPIOB
#define BUZ_PIN GPIO_Pin_0

// \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ //

uint8_t gSecondFlag = 0;
time_t gSeconds = 0;

// \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ //

void initGpio() {
  RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA | RCC_APB2Periph_GPIOB, ENABLE);

  GPIO_InitTypeDef GPIO_InitStructure;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_10MHz;

  // Port A, output.
  GPIO_InitStructure.GPIO_Pin = STROBE1_PIN | STROBE2_PIN | STROBE3_PIN
      | STROBE4_PIN | STROBE5_PIN | STROBE6_PIN;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;  // Push-pull output.
  GPIO_Init(GPIOA, &GPIO_InitStructure);

  // Port B, input.
  GPIO_InitStructure.GPIO_Pin = BTN_PIN // Maple's built in button.
      | BTN_DIM_PIN | BTN_SET_PIN | BTN_UP_PIN | BTN_DN_PIN;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IPU;  // Input, pull up.
  GPIO_Init(GPIOB, &GPIO_InitStructure);
  // Port B, output.
  GPIO_InitStructure.GPIO_Pin = LED_PIN // Maple's built in LED.
      | DA_PIN | DB_PIN | DC_PIN | DD_PIN | DP_PIN;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;  // Input, pull up.
  GPIO_Init(GPIOB, &GPIO_InitStructure);
}


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
  #endif
  RCC_RTCCLKCmd(ENABLE);
  RTC_WaitForSynchro();
  RTC_WaitForLastTask();

  // This must come after WaitForSynchro().
  #if defined(CLK_SRC_EXT)
    RTC_SetPrescaler(32768);  // Watch crystal.
    RTC_WaitForLastTask();
  #elif defined(CLK_SRC_INT)
    // RM0041, page 74: "The clock frequency is around 40kHz."
    RTC_SetPrescaler(40500);
    RTC_WaitForLastTask();
  #endif

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


void initTimer() {
  // TIM3 clock enable
  RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM2 | RCC_APB1Periph_TIM3, ENABLE);
  RCC_APB2PeriphClockCmd(RCC_APB2Periph_AFIO, ENABLE);

  // Enable both pins as alternate function.
  GPIO_InitTypeDef GPIO_InitStructure;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_10MHz;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;
  GPIO_InitStructure.GPIO_Pin = GRID_PIN;
  GPIO_Init(GRID_PORT, &GPIO_InitStructure);
  GPIO_InitStructure.GPIO_Pin = BUZ_PIN;
  GPIO_Init(BUZ_PORT, &GPIO_InitStructure);

  // Time base configuration;
  TIM_TimeBaseInitTypeDef  TIM_TimeBaseStructure;
  TIM_TimeBaseStructure.TIM_ClockDivision = TIM_CKD_DIV1;
  TIM_TimeBaseStructure.TIM_CounterMode = TIM_CounterMode_Up;

  TIM_OCInitTypeDef TIM_OCInitStructure;
  TIM_OCInitStructure.TIM_OCMode = TIM_OCMode_PWM1;
  TIM_OCInitStructure.TIM_OCPolarity = TIM_OCPolarity_High;
  TIM_OCInitStructure.TIM_OutputState = TIM_OutputState_Enable;

  // Grid PWM is on PA0 (D11), this is timer 2 channel 1.
  // 72MHz system clock / 1800 / 80 = 500Hz
  TIM_TimeBaseStructure.TIM_Period = 80;
  TIM_TimeBaseStructure.TIM_Prescaler = 1800;
  TIM_TimeBaseInit(TIM2, &TIM_TimeBaseStructure);
  TIM_OCInitStructure.TIM_Pulse = 40;  // 40 of period 80 = 50% duty
  TIM_OC1Init(TIM2, &TIM_OCInitStructure);
  TIM_OC1PreloadConfig(TIM2, TIM_OCPreload_Enable);
  TIM_ARRPreloadConfig(TIM2, ENABLE);  // ARR = Auto Reload Register
  TIM_Cmd(TIM2, ENABLE);

  // Buzzer PWM is on PB0 (D3), this is timer 3 channel 3.
  // 72MHz system clock / 1800 / 67 = ~600 Hz.
  TIM_TimeBaseStructure.TIM_Period = 67;
  TIM_TimeBaseStructure.TIM_Prescaler = 1800;
  TIM_TimeBaseInit(TIM3, &TIM_TimeBaseStructure);
  TIM_OCInitStructure.TIM_Pulse = 40;  // 40 of period 80 = 50% duty
  TIM_OC3Init(TIM3, &TIM_OCInitStructure);
  TIM_OC3PreloadConfig(TIM3, TIM_OCPreload_Enable);
  TIM_ARRPreloadConfig(TIM3, ENABLE);  // ARR = Auto Reload Register
  TIM_Cmd(TIM3, ENABLE);
}

// \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ //

void RTC_IRQHandler(void) {
  if (RTC_GetFlagStatus(RTC_FLAG_SEC) ) {
    RTC_ClearFlag(RTC_FLAG_SEC);
    gSecondFlag = 1;
    gSeconds = RTC_GetCounter();
  }
}

// \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ //

/**
 * Set all four data lines to the 4 LS bits of val.
 *
 * Values 0 through 9 are those digits; 10 through 14 are respectively
 * L H P A -, while 15 is blank.
 */
void setDataLines(uint8_t val) {
  // TODO: One write to all four pins of port A?
  GPIO_WriteBit(DA_PORT, DA_PIN, (val & 0x01) == 0x01 ? Bit_SET : Bit_RESET);
  GPIO_WriteBit(DB_PORT, DB_PIN, (val & 0x02) == 0x02 ? Bit_SET : Bit_RESET);
  GPIO_WriteBit(DC_PORT, DC_PIN, (val & 0x04) == 0x04 ? Bit_SET : Bit_RESET);
  GPIO_WriteBit(DD_PORT, DD_PIN, (val & 0x08) == 0x08 ? Bit_SET : Bit_RESET);
}


/** Turn exactly zero or one strobe lines on. */
void setStrobeLines(uint8_t strobeOn) {
  // TODO: Just two writes (to port A and B) for all values at once?
  GPIO_WriteBit(STROBE1_PORT, STROBE1_PIN, strobeOn==1 ? Bit_SET : Bit_RESET);
  GPIO_WriteBit(STROBE2_PORT, STROBE2_PIN, strobeOn==2 ? Bit_SET : Bit_RESET);
  GPIO_WriteBit(STROBE3_PORT, STROBE3_PIN, strobeOn==3 ? Bit_SET : Bit_RESET);
  GPIO_WriteBit(STROBE4_PORT, STROBE4_PIN, strobeOn==4 ? Bit_SET : Bit_RESET);
  GPIO_WriteBit(STROBE5_PORT, STROBE5_PIN, strobeOn==5 ? Bit_SET : Bit_RESET);
  GPIO_WriteBit(STROBE6_PORT, STROBE6_PIN, strobeOn==6 ? Bit_SET : Bit_RESET);
}


/** Busy loop a delay for the CD4056B while strobe is high. */
void strobeWait() {
  // Chip wants strobe high for 35-220 ns, depending on Vdd, which we're
  // only driving at 3v3, which is in fact lower than the 5v that the 220
  // max quotes.  Be generous, wait 500ns.
  // System clock is 72MHz, or 13.89ns per cycle, so loop for 36 cycles (TODO:
  // how many machine cycles does this really take??) to get 500ns delay.
  int n = 36;
  asm volatile(
      " mov r0, %[n] \n\t"
      "1: subs r0, #1 \n\t"
      " bhi 1b \n\t"
      :
      : [n] "r" (n)
      : "r0");
}

// \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ //

int main() {
  struct tm *t;

  trace_puts(">>> VfdClock main() init");
  initGpio();
  initRtc();
  initTimer();
  trace_puts("<<< VfdClock main() init");

  setDataLines(0xf);
  for (int8_t i = 6; i >= 0; i--) {
    setStrobeLines(i);
    strobeWait();
  }

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

    if (gSecondFlag) {
      gSecondFlag = 0;

      // Blink the LED just to prove I've got my GPIO correct.
      GPIO_WriteBit(LED_PORT, LED_PIN, gSeconds & 1);

      t = gmtime(&gSeconds);
      trace_printf(
          "New second: %d %02d:%02d:%02d\n",
          gSeconds, t->tm_hour, t->tm_min, t->tm_sec);

      setStrobeLines(0); strobeWait();
      setDataLines(t->tm_hour / 10); setStrobeLines(1); strobeWait();
      setDataLines(t->tm_hour % 10); setStrobeLines(2); strobeWait();
      setDataLines(t->tm_min / 10);  setStrobeLines(3); strobeWait();
      setDataLines(t->tm_min % 10);  setStrobeLines(4); strobeWait();
      setDataLines(t->tm_sec / 10);  setStrobeLines(5); strobeWait();
      setDataLines(t->tm_sec % 10);  setStrobeLines(6); strobeWait();
      setStrobeLines(0);
    }
  }
}
