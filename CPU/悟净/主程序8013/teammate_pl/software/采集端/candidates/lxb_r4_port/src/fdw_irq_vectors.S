#define FPU_HARD_FLOAT_ABI_ENABLED 1
/******************************************************************************
* Copyright (c) 2009 - 2021 Xilinx, Inc.  All rights reserved.
* SPDX-License-Identifier: MIT
******************************************************************************/
/*****************************************************************************/
/**
* @file asm_vectors.S
*
* This file contains the initial vector table for the Cortex A9 processor
*
* <pre>
* MODIFICATION HISTORY:
*
* Ver   Who     Date     Changes
* ----- ------- -------- ---------------------------------------------------
* 1.00a ecm/sdm 10/20/09 Initial version
* 3.05a sdm	02/02/12 Save lr when profiling is enabled
* 3.10a srt     04/18/13 Implemented ARM Erratas. Please refer to file
*			 'xil_errata.h' for errata description
* 4.00a pkp	22/01/14 Modified return addresses for interrupt
*			 handlers (DataAbortHandler and SVCHandler)
*			 to fix CR#767251
* 5.1	pkp	05/13/15 Saved the addresses of instruction causing data
*			 abort and prefetch abort into DataAbortAddr and
*			 PrefetchAbortAddr for further use to fix CR#854523
* 5.4	pkp	12/03/15 Added handler for undefined exception
* 6.8	mus	04/27/18 Removed __ARM_NEON__ flag definition. Now,
*			 saving/restoring of of HW floating point register
*			 would be done through newly introduced flag
*			 FPU_HARD_FLOAT_ABI_ENABLED. This new flag will be
*			 configured based on the -mfpu-abi option in extra
*			 compiler flags.
* </pre>
*
* @note
*
* None.
*
******************************************************************************/
#include "xil_errata.h"
#include "bspconfig.h"

.org 0
.text

.globl _vector_table

.section .vectors
_vector_table:
	B	_boot
	B	Undefined
	B	SVCHandler
	B	PrefetchAbortHandler
	B	DataAbortHandler
	NOP
	B	IRQHandler
	B	FIQHandler


IRQHandler:

	stmdb	sp!,{r0-r3,r12,lr}
#if FPU_HARD_FLOAT_ABI_ENABLED
	vpush {d0-d7}
	vpush {d16-d31}
	vmrs r1, FPSCR
	push {r1}
	vmrs r1, FPEXC
	push {r1}
#endif

#ifdef PROFILING
	ldr	r2, =prof_pc
	subs	r3, lr, #0
	str	r3, [r2]
#endif

	bl	IRQInterrupt

#if FPU_HARD_FLOAT_ABI_ENABLED
	pop 	{r1}
	vmsr    FPEXC, r1
	pop 	{r1}
	vmsr    FPSCR, r1
	vpop    {d16-d31}
	vpop    {d0-d7}
#endif
	ldmia	sp!,{r0-r3,r12,lr}


	subs	pc, lr, #4


FIQHandler:
	stmdb	sp!,{r0-r3,r12,lr}
#if FPU_HARD_FLOAT_ABI_ENABLED
	vpush {d0-d7}
	vpush {d16-d31}
	vmrs r1, FPSCR
	push {r1}
	vmrs r1, FPEXC
	push {r1}
#endif

FIQLoop:
	bl	FIQInterrupt

#if FPU_HARD_FLOAT_ABI_ENABLED
	pop 	{r1}
	vmsr    FPEXC, r1
	pop 	{r1}
	vmsr    FPSCR, r1
	vpop    {d16-d31}
	vpop    {d0-d7}
#endif
	ldmia	sp!,{r0-r3,r12,lr}
	subs	pc, lr, #4


Undefined:
	stmdb	sp!,{r0-r3,r12,lr}
	ldr     r0, =UndefinedExceptionAddr
	sub     r1, lr, #4
	str     r1, [r0]

	bl	UndefinedException
	ldmia	sp!,{r0-r3,r12,lr}
	movs	pc, lr

SVCHandler:
	stmdb	sp!,{r0-r3,r12,lr}

	tst	r0, #0x20
	ldrneh	r0, [lr,#-2]
	bicne	r0, r0, #0xff00
	ldreq	r0, [lr,#-4]
	biceq	r0, r0, #0xff000000

	bl	SWInterrupt

	ldmia	sp!,{r0-r3,r12,lr}

	movs	pc, lr


DataAbortHandler:
#ifdef CONFIG_ARM_ERRATA_775420
	dsb
#endif
	stmdb	sp!,{r0-r3,r12,lr}
	ldr     r0, =DataAbortAddr
	sub     r1, lr, #8
	str     r1, [r0]

	bl	DataAbortInterrupt

	ldmia	sp!,{r0-r3,r12,lr}

	subs	pc, lr, #8

PrefetchAbortHandler:
#ifdef CONFIG_ARM_ERRATA_775420
	dsb
#endif
	stmdb	sp!,{r0-r3,r12,lr}
	ldr     r0, =PrefetchAbortAddr
	sub     r1, lr, #4
	str     r1, [r0]

	bl	PrefetchAbortInterrupt

	ldmia	sp!,{r0-r3,r12,lr}

	subs	pc, lr, #4

.end
