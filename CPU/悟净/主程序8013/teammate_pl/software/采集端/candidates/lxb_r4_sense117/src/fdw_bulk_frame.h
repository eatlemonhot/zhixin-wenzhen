#ifndef FDW_BULK_FRAME_H
#define FDW_BULK_FRAME_H
#include <stddef.h>
#include <stdint.h>
#define FDW_BULK_HEADER_BYTES 128U
uint32_t fdw_crc32(const void *data, size_t length);
int fdw_bulk_frame_open(uint32_t record, uint8_t *header, const int16_t **samples);
void fdw_bulk_frame_close(void);
#endif
