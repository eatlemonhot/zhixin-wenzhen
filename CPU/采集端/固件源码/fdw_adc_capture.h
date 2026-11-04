#ifndef FDW_ADC_CAPTURE_H
#define FDW_ADC_CAPTURE_H

#include <stdint.h>

#define FDW_ADC_SAMPLE_COUNT 8192U
#define FDW_ADC_SAMPLE_RATE_HZ 25000000U
#define FDW_ADC_FLAG_DISCONTINUOUS 0x00000004U
#define FDW_ADC_FLAG_CONTINUITY_CHECKED 0x00000008U
#define FDW_ADC_TRIGGER_EVENT_ACCEPTED 0x00000010U
#define FDW_ADC_TRIGGER_MODE_ENABLED 0x00000040U

/*
 * 初始化 AXI DMA 和控制 GPIO。
 * 返回0表示初始化成功，负数表示对应阶段失败。
 */
int fdw_adc_capture_init(void);

int fdw_adc_capture_frame(int16_t *samples, uint32_t sample_count,
                          uint32_t *overrange_count);

/* 最近成功接收帧的采集状态；连续性检查不等同于电压或外部时钟标定。 */
uint32_t fdw_adc_capture_frame_flags(void);

int fdw_adc_capture_set_trigger(uint32_t trigger);
uint32_t fdw_adc_capture_trigger_status(void);

int fdw_adc_capture_start(uint32_t timeout_us);
int fdw_adc_capture_poll(int16_t *samples, uint32_t count, uint32_t *overrange_count);
int fdw_adc_capture_cancel(void);

#endif
