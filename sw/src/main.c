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
#include "stm32f10x_gpio.h"
#include "stm32f10x_pwr.h"
#include "stm32f10x_rcc.h"
#include "stm32f10x_rtc.h"
#include "stm32f10x_tim.h"

// \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ //

// Maple's built in LED.
#define LED_PORT GPIOB
#define LED_PIN GPIO_Pin_1

// Maple's built in button.
#define BTN_MAPLE_PIN GPIO_Pin_8

#define BTN_PORT GPIOB
#define BTN_DIM_PIN GPIO_Pin_10
#define BTN_SET_PIN GPIO_Pin_12
#define BTN_UP_PIN GPIO_Pin_13
#define BTN_DN_PIN GPIO_Pin_11
typedef enum {BTN_NONE, BTN_MAPLE, BTN_UP, BTN_DOWN, BTN_DIM, BTN_SET} buttonId;
#define BTN_ALL_PINS (BTN_MAPLE_PIN|BTN_DIM_PIN|BTN_SET_PIN|BTN_UP_PIN|BTN_DN_PIN)

#define DATA_PORT GPIOB
#define DA_PIN GPIO_Pin_6
#define DB_PIN GPIO_Pin_5
#define DC_PIN GPIO_Pin_4
#define DD_PIN GPIO_Pin_3
#define DATA_PIN_MASK (GPIO_Pin_6|GPIO_Pin_5|GPIO_Pin_4|GPIO_Pin_3)

#define DP_PORT GPIOB  // Decimal point.
#define DP_PIN GPIO_Pin_7

#define STROBE_PORT GPIOA
#define STROBE1_PIN GPIO_Pin_2
#define STROBE2_PIN GPIO_Pin_3
#define STROBE3_PIN GPIO_Pin_4
#define STROBE4_PIN GPIO_Pin_5
#define STROBE5_PIN GPIO_Pin_6
#define STROBE6_PIN GPIO_Pin_7
#define STROBE_ALL_PINS ( \
    STROBE1_PIN | STROBE2_PIN | STROBE3_PIN \
    | STROBE4_PIN | STROBE5_PIN | STROBE6_PIN)

#define GRID_PORT GPIOA
#define GRID_PIN GPIO_Pin_0
#define BUZ_PORT GPIOB
#define BUZ_PIN GPIO_Pin_0

#define DIGIT_L 10
#define DIGIT_H 11
#define DIGIT_P 12
#define DIGIT_A 13
#define DIGIT_DASH 14
#define DIGIT_BLANK 15

// \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ //

volatile uint16_t gDpTick = 0;
volatile uint8_t gBlinkStatus = 0;
volatile uint8_t gBlinkPos = 0;
volatile uint16_t gBlinkTick = 0;
volatile uint8_t gButtonDebounce = 0;
volatile uint8_t gButtonPending = 0;
volatile uint8_t gButtonPressed = 0;
TIM_OCInitTypeDef gBuzOc;
TIM_OCInitTypeDef gGridOc;
uint8_t gSecondFlag = 0;
time_t gSeconds = 0;

// Since the data pins' order are reversed as compared to the bits of the
// GPIOB register, we need to reverse (i.e. 0b0001 -> 0b1000) their order
// to match, in order to do an atomic write of all four.
const uint8_t gDataBitsReversed[16] = {
    0b0000, 0b1000, 0b0100, 0b1100, 0b0010, 0b1010, 0b0110, 0b1110,
    0b0001, 0b1001, 0b0101, 0b1101, 0b0011, 0b1011, 0b0111, 0b1111};
// Amount to change the current time by, when setting this digit up/down.
const uint16_t gSettingChange[6] = {0, 3600, 600, 60, 10, 1};
const uint16_t gStrobePins[6] = {
    STROBE1_PIN, STROBE2_PIN, STROBE3_PIN,
    STROBE4_PIN, STROBE5_PIN, STROBE6_PIN};

// \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ //

void initGpio() {
  // We have to 1) Enable the GPIO clocks.
  RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA | RCC_APB2Periph_GPIOB, ENABLE);
  // 2) Enable AFIO (we want it later for timers and interrupts, and ...)
  RCC_APB2PeriphClockCmd(RCC_APB2Periph_AFIO, ENABLE);
  // 3) Disable JTAG (... which must be after AFIO enable) to release its pins.
  GPIO_PinRemapConfig(GPIO_Remap_SWJ_JTAGDisable, ENABLE);

  GPIO_InitTypeDef GPIO_InitStructure;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_10MHz;

  // Port A, output.
  GPIO_InitStructure.GPIO_Pin = STROBE1_PIN | STROBE2_PIN | STROBE3_PIN
      | STROBE4_PIN | STROBE5_PIN | STROBE6_PIN;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;  // Push-pull output.
  GPIO_Init(GPIOA, &GPIO_InitStructure);

  // Port B, input.
  GPIO_InitStructure.GPIO_Pin = BTN_MAPLE_PIN; // Maple's built in button.
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IPD;  // Input, pull down.
  GPIO_Init(GPIOB, &GPIO_InitStructure);
  GPIO_InitStructure.GPIO_Pin =
      BTN_DIM_PIN | BTN_SET_PIN | BTN_UP_PIN | BTN_DN_PIN;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IPU;  // Input, pull up.
  GPIO_Init(GPIOB, &GPIO_InitStructure);
  // Port B, output.
  GPIO_InitStructure.GPIO_Pin = LED_PIN // Maple's built in LED.
      | DA_PIN | DB_PIN | DC_PIN | DD_PIN | DP_PIN;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;  // Push-pull output.
  GPIO_Init(GPIOB, &GPIO_InitStructure);
}


// Define either _INT or _EXT to select low-speed clock source.
#define CLK_SRC_EXT

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

  RTC_ClearITPendingBit(RTC_IT_SEC);
  RTC_ITConfig(RTC_IT_ALR|RTC_IT_OW, DISABLE);
  RTC_ITConfig(RTC_IT_SEC, ENABLE);
  RTC_WaitForLastTask();

  PWR_BackupAccessCmd(DISABLE);

  NVIC_InitTypeDef NVIC_InitStructure = {
    .NVIC_IRQChannel = RTC_IRQn,
    .NVIC_IRQChannelPreemptionPriority = 1,
    .NVIC_IRQChannelSubPriority = 0,
    .NVIC_IRQChannelCmd = ENABLE,
  };
  NVIC_Init(&NVIC_InitStructure);
}


void initTimer() {
  // TIM3 clock enable
  RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM2 | RCC_APB1Periph_TIM3, ENABLE);

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

  // Grid PWM is on PA0 (D11), this is timer 2 channel 1.
  // 72MHz system clock / 1800 / 80 = 500Hz
  TIM_TimeBaseStructure.TIM_Period = 80;
  TIM_TimeBaseStructure.TIM_Prescaler = 1800;
  TIM_TimeBaseInit(TIM2, &TIM_TimeBaseStructure);
  gGridOc.TIM_OCMode = TIM_OCMode_PWM1;
  gGridOc.TIM_OCPolarity = TIM_OCPolarity_High;
  gGridOc.TIM_OutputState = TIM_OutputState_Enable;
  gGridOc.TIM_Pulse = 40;  // 40 of period 80 = 50% duty
  TIM_OC1Init(TIM2, &gGridOc);
  TIM_OC1PreloadConfig(TIM2, TIM_OCPreload_Enable);
  TIM_ARRPreloadConfig(TIM2, ENABLE);  // ARR = Auto Reload Register
  TIM_Cmd(TIM2, ENABLE);

  // Buzzer PWM is on PB0 (D3), this is timer 3 channel 3.
  // 72MHz system clock / 1800 / 67 = ~600 Hz.
  TIM_TimeBaseStructure.TIM_Period = 67;
  TIM_TimeBaseStructure.TIM_Prescaler = 1800;
  TIM_TimeBaseInit(TIM3, &TIM_TimeBaseStructure);
  gBuzOc.TIM_OCMode = TIM_OCMode_PWM1;
  gBuzOc.TIM_OCPolarity = TIM_OCPolarity_High;
  gBuzOc.TIM_OutputState = TIM_OutputState_Enable;
  gBuzOc.TIM_Pulse = 30;
  TIM_OC3Init(TIM3, &gBuzOc);
  TIM_OC3PreloadConfig(TIM3, TIM_OCPreload_Enable);
  TIM_ARRPreloadConfig(TIM3, ENABLE);  // ARR = Auto Reload Register
  TIM_Cmd(TIM3, ENABLE);
}

// \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ //

void RTC_IRQHandler(void) {
  if (RTC_GetFlagStatus(RTC_FLAG_SEC) != RESET) {
    RTC_ClearFlag(RTC_FLAG_SEC);
    gSecondFlag = 1;
    gSeconds = RTC_GetCounter();
  }
}

void SysTick_Handler(void) {
  gBlinkTick++;
  if (gBlinkTick > 125) {
    gBlinkTick = 0;
    gBlinkStatus = !gBlinkStatus;
  }

  uint8_t btnPressed = 0;
  uint16_t btns = GPIO_ReadInputData(BTN_PORT) & BTN_ALL_PINS;
  if ((btns & BTN_MAPLE_PIN) == BTN_MAPLE_PIN) btnPressed = BTN_MAPLE;
  else if ((btns & BTN_DIM_PIN) == 0) btnPressed = BTN_DIM;
  else if ((btns & BTN_DN_PIN) == 0) btnPressed = BTN_DOWN;
  else if ((btns & BTN_UP_PIN) == 0) btnPressed = BTN_UP;
  else if ((btns & BTN_SET_PIN) == 0) btnPressed = BTN_SET;
  if (btnPressed && gButtonPending == btnPressed) {
    if (gButtonDebounce > 10) {
      // Button already activated, still held, do nothing.
    } else if (gButtonDebounce == 10) {
      // Transition!  Set pressed button.
      gButtonPressed = btnPressed;
      gButtonDebounce++;
    } else {
      gButtonDebounce++;
    }
  } else {
    gButtonDebounce = 0;
    gButtonPending = btnPressed;
  }

  if (gDpTick > 0) {
    gDpTick--;
    if (gDpTick == 0) {
      GPIO_WriteBit(DP_PORT, DP_PIN, RESET);
    }
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
  GPIO_Write(
      GPIOB, (GPIOB->ODR & ~DATA_PIN_MASK) | (gDataBitsReversed[val] << 3) );
}


/** Turn exactly zero or one strobe lines on. */
void setStrobeLines(uint8_t strobeLine) {
  GPIO_ResetBits(STROBE_PORT, STROBE_ALL_PINS);
  if (strobeLine > 0) {
    GPIO_SetBits(STROBE_PORT, gStrobePins[strobeLine - 1]);
  }
}


void setRtcTime(time_t current) {
  PWR_BackupAccessCmd(ENABLE);
  RTC_WaitForLastTask();
  RTC_SetCounter(current);
  RTC_WaitForLastTask();
  PWR_BackupAccessCmd(DISABLE);
  RTC_WaitForLastTask();
}


/** Busy loop a delay for the CD4056B while strobe is high. */
inline void strobeWait() {
  // Chip wants strobe high for 35-220 ns, depending on Vdd.  More time
  // when driven at lower voltages.  At 15v, max is 70ns, and we're above 15.
  // Let's be generous, wait at least 100ns.  At 72MHz a clock cycle is
  // 13.89ns; eight of them is enough to consistently measure high for over
  // 100ns as per my logic analyzer (sampling at 24MHz), Release build.
  asm("NOP");
  asm("NOP");
  asm("NOP");
  asm("NOP");
  asm("NOP");
  asm("NOP");
  asm("NOP");
  asm("NOP");
}

void pulseStrobeLine(uint8_t strobeLine) {
  setStrobeLines(strobeLine);
  strobeWait();
  setStrobeLines(0);
}

void setDisplay(uint8_t digits[]) {
  setStrobeLines(0);
  strobeWait();
  setDataLines(digits[0]); pulseStrobeLine(1);
  setDataLines(digits[1]); pulseStrobeLine(2);
  setDataLines(digits[2]); pulseStrobeLine(3);
  setDataLines(digits[3]); pulseStrobeLine(4);
  setDataLines(digits[4]); pulseStrobeLine(5);
  setDataLines(digits[5]); pulseStrobeLine(6);
  setDataLines(0);
}

// \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ //

int main() {
  trace_puts(">>> VfdClock main() init");
  initGpio();
  initRtc();
  initTimer();
  SysTick_Config(72000);  // 1kHz
  trace_puts("<<< VfdClock main() init");

  // Disable buzzer.
  GPIO_WriteBit(BUZ_PORT, BUZ_PIN, RESET);
  TIM_Cmd(TIM3, DISABLE);

  uint8_t digits[6] = {
      DIGIT_BLANK, DIGIT_DASH, DIGIT_DASH, DIGIT_DASH, DIGIT_DASH, DIGIT_BLANK};
  setDisplay(digits);
  gSeconds = RTC_GetCounter();
  struct tm *t = gmtime(&gSeconds);

  // Logic loop.
  while (1) {
    digits[0] = t->tm_hour / 10;
    digits[1] = t->tm_hour % 10;
    digits[2] = t->tm_min / 10;
    digits[3] = t->tm_min % 10;
    digits[4] = t->tm_sec / 10;
    digits[5] = t->tm_sec % 10;

    switch (gButtonPressed) {
    case BTN_MAPLE:
      trace_puts("Maple button!");
      setRtcTime(1420070400);
      break;
    case BTN_SET:
      gBlinkPos += 1;
      if (gBlinkPos > 5) {
        gBlinkPos = 0;
        setDisplay(digits);
      }
      trace_printf("Set button; new pos %d\n", gBlinkPos);
      break;
    case BTN_DIM:
      gGridOc.TIM_Pulse += 10;
      gGridOc.TIM_Pulse %= 80;
      TIM_OC1Init(TIM2, &gGridOc);
      trace_printf("Dim button; pulse now %d of 80.\n", gGridOc.TIM_Pulse);
      break;
    case BTN_UP:
      trace_puts("Up button!");
      gSeconds = RTC_GetCounter() + gSettingChange[gBlinkPos];
      setRtcTime(gSeconds);
      gSecondFlag = 1;
      break;
    case BTN_DOWN:
      trace_puts("Down button!");
      gSeconds = RTC_GetCounter() - gSettingChange[gBlinkPos];
      setRtcTime(gSeconds);
      gSecondFlag = 1;
      break;
    default:
      // No button pressed, ignore.
      break;
    }
    gButtonPressed = BTN_NONE;

    if (gBlinkPos > 0) {
      if (gBlinkStatus) {
        digits[gBlinkPos] = DIGIT_BLANK;
        // gBlinkPos of 1 means "hours"; blink both digits.
        if (gBlinkPos == 1) {
          digits[0] = DIGIT_BLANK;
        }
      }
      setDisplay(digits);
    }

    if (gSecondFlag) {
      gSecondFlag = 0;
      t = gmtime(&gSeconds);
      setDisplay(digits);
      // Blink decimal point.
      GPIO_WriteBit(DP_PORT, DP_PIN, SET);
      gDpTick = 500;
    }
  }
}
