;  #############################################################################
;  ##  DISASSEMBLER 8080/8085                                                 ##
;  #############################################################################
;
;  Author:  Vitaliy Poedinok aka Vital72
;  License: MIT
;  www:     http://www.86rk.ru/
;  e-mail:  vital72@86rk.ru
;  Version: 2.626
;  Date:    01.05.25
;  =============================================================================

DISASSM_OUT_STR		EQU	0F818h
DISASSM_OUT_WORD	EQU	0FB78h
DISASSM_CMP_HL_DE	EQU	0F990h
DISASSM_CHECK_CTRL_C	EQU	0F9A4h
DISASSM_MONITOR_PROMPT	EQU	0F86Ch
DISASSM_MNEMO		EQU	07633h
DISASSM_BUFFER		EQU	07635h

;  =============================================================================

;  mnemo 00-3F
MNEMO3	LXI, 'L', 'X', 'I'
MNEMO3	MVI, 'M', 'V', 'I'
MNEMO3	INX, 'I', 'N', 'X'
MNEMO3	DCX, 'D', 'C', 'X'
MNEMO3	INR, 'I', 'N', 'R'
MNEMO3	DCR, 'D', 'C', 'R'
MNEMO3	DAD, 'D', 'A', 'D'
MNEMO3	NOP, 'N', 'O', 'P'
MNEMO	ARHL, 'A', 'R', 'H', 'L'
MNEMO3	RIM, 'R', 'I', 'M'
MNEMO3	SIM, 'S', 'I', 'M'
MNEMO	STAX, 'S', 'T', 'A', 'X'
MNEMO	SHLD, 'S', 'H', 'L', 'D'
MNEMO3	STA, 'S', 'T', 'A'
MNEMO3	RLC, 'R', 'L', 'C'
MNEMO3	RAL, 'R', 'A', 'L'
MNEMO3	DAA, 'D', 'A', 'A'
MNEMO3	STC, 'S', 'T', 'C'
MNEMO	DSUB, 'D', 'S', 'U', 'B'
MNEMO	RLDE, 'R', 'L', 'D', 'E'
MNEMO	LDHI, 'L', 'D', 'H', 'I'
MNEMO	LDSI, 'L', 'D', 'S', 'I'
MNEMO	LDAX, 'L', 'D', 'A', 'X'
MNEMO	LHLD, 'L', 'H', 'L', 'D'
MNEMO3	LDA, 'L', 'D', 'A'
MNEMO3	RRC, 'R', 'R', 'C'
MNEMO3	RAR, 'R', 'A', 'R'
MNEMO3	CMC, 'C', 'M', 'C'
MNEMO3	CMA, 'C', 'M', 'A'

;  mnemo 40-BF
MNEMO3	HLT, 'H', 'L', 'T'
MNEMO3	MOV, 'M', 'O', 'V'
MNEMO3	ADD, 'A', 'D', 'D'
MNEMO3	ADC, 'A', 'D', 'C'
MNEMO3	SUB, 'S', 'U', 'B'
MNEMO3	SBB, 'S', 'B', 'B'
MNEMO3	ANA, 'A', 'N', 'A'
MNEMO3	ORA, 'O', 'R', 'A'
MNEMO3	XRA, 'X', 'R', 'A'
MNEMO3	CMP, 'C', 'M', 'P'

;  mnemo C0-FF
MNEMO	R, 'R', 0, 0, 10h
MNEMO3	POP, 'P', 'O', 'P'
MNEMO	J, 'J', 0, 0, 10h
MNEMO	C, 'C', 0, 0, 10h
MNEMO	PUSH, 'P', 'U', 'S', 'H'
MNEMO3	RST, 'R', 'S', 'T'
MNEMO3	JMP, 'J', 'M', 'P'
MNEMO3	OUT, 'O', 'U', 'T'
MNEMO	XTHL, 'X', 'T', 'H', 'L'
MNEMO2	DI, 'D', 'I'
MNEMO3	ADI, 'A', 'D', 'I'
MNEMO3	SUI, 'S', 'U', 'I'
MNEMO3	ANI, 'A', 'N', 'I'
MNEMO3	ORI, 'O', 'R', 'I'
MNEMO3	RET, 'R', 'E', 'T'
MNEMO	SHLX, 'S', 'H', 'L', 'X'
MNEMO	PCHL, 'P', 'C', 'H', 'L'
MNEMO	SPHL, 'S', 'P', 'H', 'L'
MNEMO	RSTV, 'R', 'S', 'T', 'V'
MNEMO2	IN, 'I', 'N'
MNEMO	XCHG, 'X', 'C', 'H', 'G'
MNEMO2	EI, 'E', 'I'
MNEMO	CALL, 'C', 'A', 'L', 'L'
MNEMO3	JNK, 'J', 'N', 'K'
MNEMO	LHLX, 'L', 'H', 'L', 'X'
MNEMO2	JK, 'J', 'K'
MNEMO3	ACI, 'A', 'C', 'I'
MNEMO3	SBI, 'S', 'B', 'I'
MNEMO3	XRI, 'X', 'R', 'I'
MNEMO3	CPI, 'C', 'P', 'I'

MNEMO2	NONE, '_', '_'

;  CC
MNEMO3	xNZ, 0, 'N', 'Z'
MNEMO3	xNC, 0, 'N', 'C'
MNEMO3	xPO, 0, 'P', 'O'
MNEMO3	xPE, 0, 'P', 'E'
MNEMO2	xZ, 0, 'Z'
MNEMO2	xC, 0, 'C'
MNEMO2	xP, 0, 'P'
MNEMO2	xM, 0, 'M'

;  REG16
MNEMO2	B, 'B', 0
MNEMO2	D, 'D', 0
MNEMO2	H, 'H', 0
MNEMO2	SP, 'S', 'P'
MNEMO3	PSW, 'P', 'S', 'W'

MNEMO_OP_NONE		EQU	0
MNEMO_OP_N		EQU	1
MNEMO_OP_R8		EQU	2
MNEMO_OP_R16		EQU	3
MNEMO_OP_IM8		EQU	4
MNEMO_OP_IM16		EQU	5
MNEMO_OP_R8_IM8		EQU	6
MNEMO_OP_R16_IM16	EQU	7
MNEMO_OP_CC		EQU	8
MNEMO_OP_CC_IM16	EQU	9
MNEMO_OP_R16_C0		EQU	10

;  =============================================================================

.macro	MNEMO
	MNEMO_%%1 = ((%%2 + 0) & 1Fh << 11) | ((%%3 + 0) & 1Fh << 6) | ((%%4 + 0) & 1Fh << 1) | ((%%5 + 0) & 10h >> 4) | ((%%5 + 0) & 0Fh << 20)
.endm

.macro	MNEMO3
	MNEMO %%1, %%2, %%3, %%4, 0
.endm

.macro	MNEMO2
	MNEMO %%1, %%2, %%3, 0, 0
.endm

.macro	table_mnemo
	dw	%%1 & 0FFFFh
	db	(%%1 >> 16) | %%2
.endm

.macro	sub_table
	dw	%%1 & 0FF00h
	db	%%1 & 0FFh
.endm

;  =============================================================================
;  ДИЗАССЕМБЛИРОВАНИЕ БЛОКА КОДА  ______________________________________________
;  вход:  HL - начальный адрес блока
;         DE - конечный адрес блока

disassm:
	push	d
	push	h		;  addr of first byte
	lxi	d, disassm_out
	push	d
	mov	a, m
	inx	h
	push	h
	lxi	h, disassm_table_8085_C0_FF
	mov	c, a
	mvi	b, 0
	sui	0C0h
	jnc	$+9
	jm	disassm_hndlr_40_BF
	lxi	h, disassm_table_8085_00_3F
	ani	0Fh
	mov	e, a
	mov	d, b
	dad	d
	dad	d
	dad	d
	mov	a, c
	rrc
	rrc
	rrc
	mov	c, a
	mov	e, m
	inr	e
	dcr	e
	jnz	disassm_lbl1
	rrc
	ani	00000011b
	mov	e, a
	inx	h
	mov	b, m
	inx	h
	mov	l, m
	mov	h, b
	dad	d
	dad	d
	dad	d
	mov	e, m
disassm_lbl1:
	inx	h
	mov	d, m
	inx	h
	mov	b, m		;  b = 4th letter & operands
	mov	a, b
	ani	00001111b
	lxi	h, disassm_op
	add	l
	mov	l, a
	mov	l, m
	xchg			;  hl = mnemo
disassm_lbl2:
	shld	DISASSM_MNEMO
	lxi	h, DISASSM_BUFFER
	mvi	a, 18
	mvi	m, ' '
	inx	h
	dcr	a
	jnz	$-4
	xchg			;  hl = operand handler address
	xthl			;  hl = addr of second byte
	mov	a, c
	ani	00000111b
	ret

	;  начиная отсюда и до метки disassm_op_end весь код должен
	;  находиться в одном 256-байтовом сегменте

	.if msb(disassm_op_end - 1) - msb($)
	.error code cross a 256 byte boundary
	.endif

disassm_op_r8_r8:
	mov	a, c
	rrc
	rrc
	rrc
	call	disassm_op_r8_r8_lbl
	mvi	a, ','
	stax	d
	inx	d
	mov	a, c
disassm_op_r8_r8_lbl:
	ani	00000111b

disassm_op_r8:
	push	h
	lxi	h, disassm_reg8_8085
	add	l
	mov	l, a
	mov	a, m
	pop	h
	stax	d
	inx	d
	ret

disassm_op_r16_c0:
	cpi	3 * 2
	cmc
	aci	1

disassm_op_r16:
	push	h
	lxi	h, disassm_reg16_8085
	call	disassm_get_word
	call	disassm_put_str
	pop	h
	ret

disassm_op_r8_im8:
	call	disassm_op_r8
	mvi	a, ','
	stax	d
	inx	d

disassm_op_im8:
	mov	a, m
	inx	h
	push	psw
	rrc
	rrc
	rrc
	rrc
	call	$+4
	pop	psw
	ani	0Fh
	cpi	10
	sbi	'0' - 1
	daa
	stax	d
	inx	d
	ret

disassm_op_r16_im16:
	call	disassm_op_r16
	mvi	a, ','
	stax	d
	inx	d
	stc

disassm_op_cc_im16:
	cnc	disassm_op_cc

disassm_op_im16:
	inx	h
	call	disassm_op_im8
	dcx	h
	dcx	h
	call	disassm_op_im8
	inx	h
	ret

disassm_op_n:
	adi	'0'
	stax	d
	inx	d
disassm_op_none:
	ret

disassm_op_cc:
	push	d
	push	h
	add	a
	lxi	h, disassm_table_8085_cc
	call	disassm_get_word
	xchg
	lhld	DISASSM_MNEMO
	dad	d
	shld	DISASSM_MNEMO
	pop	h
	pop	d
	ret

disassm_op:
	db	disassm_op_none & 0FFh, disassm_op_n & 0FFh
	db	disassm_op_r8 & 0FFh, disassm_op_r16 & 0FFh
	db	disassm_op_im8 & 0FFh, disassm_op_im16 & 0FFh
	db	disassm_op_r8_im8 & 0FFh, disassm_op_r16_im16 & 0FFh
	db	disassm_op_cc & 0FFh, disassm_op_cc_im16 & 0FFh
	db	disassm_op_r16_c0 & 0FFh
disassm_op_end:

disassm_hndlr_40_BF:
	lxi	h, disassm_lbl2
	push	h
	lxi	d, disassm_op_none
	lxi	h, MNEMO_HLT
	cpi	76h - 0C0h
	rz
	mvi	e, disassm_op_r8_r8 & 0FFh
	lxi	h, MNEMO_MOV
	cpi	0C0h
	rc
	mvi	e, disassm_op_r8 & 0FFh
	lxi	h, disassm_table_8085_80_BF
	rrc
	rrc

disassm_get_word:
	ani	00001110b
	add	l
	mov	l, a
	mov	a, m
	inx	h
	mov	h, m
	mov	l, a
	ret

disassm_out:
	xra	a
	stax	d
	mov	c, l
	xthl			;  hl = addr of first byte
	call	DISASSM_OUT_WORD
	mvi	e, (DISASSM_BUFFER + 2) & 0FFh
	call	disassm_op_im8
	inx	d
	mov	a, l
	cmp	c
	jnz	$-6
	mvi	e, (DISASSM_BUFFER + 12) & 0FFh
	lhld	DISASSM_MNEMO
	call	disassm_put_str
	mov	a, b
	rar
	ora	h
	mov	h, a
	call	disassm_put_char
	lxi	h, DISASSM_BUFFER
	call	DISASSM_OUT_STR
	call	DISASSM_CHECK_CTRL_C
	pop	h
	pop	d
	dcx	h
	call	DISASSM_CMP_HL_DE
	inx	h
	jc	disassm
	jmp	DISASSM_MONITOR_PROMPT

disassm_put_str:
	call	disassm_put_char
	call	disassm_put_char
disassm_put_char:
	xra	a
	dad	h
	ral
	dad	h
	ral
	dad	h
	ral
	dad	h
	ral
	dad	h
	ral
	ana	a
	rz
	adi	40h
	stax	d
	inx	d
	ret

;  =============================================================================

disassm_table_8085_00_3F:
	sub_table	disassm_table_8085_00_x0
	table_mnemo	MNEMO_LXI,  MNEMO_OP_R16_IM16
	sub_table	disassm_table_8085_00_x2
	table_mnemo	MNEMO_INX,  MNEMO_OP_R16
	table_mnemo	MNEMO_INR,  MNEMO_OP_R8
	table_mnemo	MNEMO_DCR,  MNEMO_OP_R8
	table_mnemo	MNEMO_MVI,  MNEMO_OP_R8_IM8
	sub_table	disassm_table_8085_00_x7
	sub_table	disassm_table_8085_00_x8
	table_mnemo	MNEMO_DAD,  MNEMO_OP_R16
	sub_table	disassm_table_8085_00_xA
	table_mnemo	MNEMO_DCX,  MNEMO_OP_R16
	table_mnemo	MNEMO_INR,  MNEMO_OP_R8
	table_mnemo	MNEMO_DCR,  MNEMO_OP_R8
	table_mnemo	MNEMO_MVI,  MNEMO_OP_R8_IM8
	sub_table	disassm_table_8085_00_xF

disassm_table_8085_00_x0:
	table_mnemo	MNEMO_NOP,  MNEMO_OP_NONE
	.if DISASSM_SUPPORT_8085
	table_mnemo	MNEMO_ARHL, MNEMO_OP_NONE
	table_mnemo	MNEMO_SIM,  MNEMO_OP_NONE
	table_mnemo	MNEMO_RIM,  MNEMO_OP_NONE
	.else
	table_mnemo	MNEMO_NONE,  MNEMO_OP_NONE
	table_mnemo	MNEMO_NONE,  MNEMO_OP_NONE
	table_mnemo	MNEMO_NONE,  MNEMO_OP_NONE
	.endif

disassm_table_8085_00_x2:
	table_mnemo	MNEMO_STAX, MNEMO_OP_R16
	table_mnemo	MNEMO_STAX, MNEMO_OP_R16
	table_mnemo	MNEMO_SHLD, MNEMO_OP_IM16
	table_mnemo	MNEMO_STA,  MNEMO_OP_IM16

disassm_table_8085_00_x7:
	table_mnemo	MNEMO_RLC,  MNEMO_OP_NONE
	table_mnemo	MNEMO_RAL,  MNEMO_OP_NONE
	table_mnemo	MNEMO_DAA,  MNEMO_OP_NONE
	table_mnemo	MNEMO_STC,  MNEMO_OP_NONE

disassm_table_8085_00_x8:
	.if DISASSM_SUPPORT_8085
	table_mnemo	MNEMO_DSUB, MNEMO_OP_NONE
	table_mnemo	MNEMO_RLDE, MNEMO_OP_NONE
	table_mnemo	MNEMO_LDHI, MNEMO_OP_IM8
	table_mnemo	MNEMO_LDSI, MNEMO_OP_IM8
	.else
	table_mnemo	MNEMO_NONE,  MNEMO_OP_NONE
	table_mnemo	MNEMO_NONE,  MNEMO_OP_NONE
	table_mnemo	MNEMO_NONE,  MNEMO_OP_NONE
	table_mnemo	MNEMO_NONE,  MNEMO_OP_NONE
	.endif

disassm_table_8085_00_xA:
	table_mnemo	MNEMO_LDAX, MNEMO_OP_R16
	table_mnemo	MNEMO_LDAX, MNEMO_OP_R16
	table_mnemo	MNEMO_LHLD, MNEMO_OP_IM16
	table_mnemo	MNEMO_LDA,  MNEMO_OP_IM16

disassm_table_8085_00_xF:
	table_mnemo	MNEMO_RRC,  MNEMO_OP_NONE
	table_mnemo	MNEMO_RAR,  MNEMO_OP_NONE
	table_mnemo	MNEMO_CMA,  MNEMO_OP_NONE
	table_mnemo	MNEMO_CMC,  MNEMO_OP_NONE

disassm_table_8085_C0_FF:
	table_mnemo	MNEMO_R,    MNEMO_OP_CC
	table_mnemo	MNEMO_POP,  MNEMO_OP_R16_C0
	table_mnemo	MNEMO_J,    MNEMO_OP_CC_IM16
	sub_table	disassm_table_8085_C0_x3
	table_mnemo	MNEMO_C,    MNEMO_OP_CC_IM16
	table_mnemo	MNEMO_PUSH, MNEMO_OP_R16_C0
	sub_table	disassm_table_8085_C0_x6
	table_mnemo	MNEMO_RST,  MNEMO_OP_N
	table_mnemo	MNEMO_R,    MNEMO_OP_CC
	sub_table	disassm_table_8085_C0_x9
	table_mnemo	MNEMO_J,    MNEMO_OP_CC_IM16
	sub_table	disassm_table_8085_C0_xB
	table_mnemo	MNEMO_C,    MNEMO_OP_CC_IM16
	sub_table	disassm_table_8085_C0_xD
	sub_table	disassm_table_8085_C0_xE
	table_mnemo	MNEMO_RST,  MNEMO_OP_N

disassm_table_8085_C0_x3:
	table_mnemo	MNEMO_JMP,  MNEMO_OP_IM16
	table_mnemo	MNEMO_OUT,  MNEMO_OP_IM8
	table_mnemo	MNEMO_XTHL, MNEMO_OP_NONE
	table_mnemo	MNEMO_DI,   MNEMO_OP_NONE

disassm_table_8085_C0_x6:
	table_mnemo	MNEMO_ADI,  MNEMO_OP_IM8
	table_mnemo	MNEMO_SUI,  MNEMO_OP_IM8
	table_mnemo	MNEMO_ANI,  MNEMO_OP_IM8
	table_mnemo	MNEMO_ORI,  MNEMO_OP_IM8

disassm_table_8085_C0_x9:
	table_mnemo	MNEMO_RET,  MNEMO_OP_NONE
	.if DISASSM_SUPPORT_8085
	table_mnemo	MNEMO_SHLX, MNEMO_OP_NONE
	.else
	table_mnemo	MNEMO_NONE,  MNEMO_OP_NONE
	.endif
	table_mnemo	MNEMO_PCHL, MNEMO_OP_NONE
	table_mnemo	MNEMO_SPHL, MNEMO_OP_NONE

disassm_table_8085_C0_xB:
	.if DISASSM_SUPPORT_8085
	table_mnemo	MNEMO_RSTV, MNEMO_OP_NONE
	.else
	table_mnemo	MNEMO_NONE,  MNEMO_OP_NONE
	.endif
	table_mnemo	MNEMO_IN,   MNEMO_OP_IM8
	table_mnemo	MNEMO_XCHG, MNEMO_OP_NONE
	table_mnemo	MNEMO_EI,   MNEMO_OP_NONE

disassm_table_8085_C0_xD:
	table_mnemo	MNEMO_CALL, MNEMO_OP_IM16
	.if DISASSM_SUPPORT_8085
	table_mnemo	MNEMO_JNK,  MNEMO_OP_IM16
	table_mnemo	MNEMO_LHLX, MNEMO_OP_NONE
	table_mnemo	MNEMO_JK,   MNEMO_OP_IM16
	.else
	table_mnemo	MNEMO_NONE,  MNEMO_OP_NONE
	table_mnemo	MNEMO_NONE,  MNEMO_OP_NONE
	table_mnemo	MNEMO_NONE,  MNEMO_OP_NONE
	.endif

disassm_table_8085_C0_xE:
	table_mnemo	MNEMO_ACI,  MNEMO_OP_IM8
	table_mnemo	MNEMO_SBI,  MNEMO_OP_IM8
	table_mnemo	MNEMO_XRI,  MNEMO_OP_IM8
	table_mnemo	MNEMO_CPI,  MNEMO_OP_IM8

disassm_table_8085_80_BF:
	.if msb(disassm_table_8085_80_BF_end - 1) - msb($)
	.error disassm_table_8085_80_BF
	.endif
	dw	MNEMO_ADD, MNEMO_ADC
	dw	MNEMO_SUB, MNEMO_SBB
	dw	MNEMO_ANA, MNEMO_XRA
	dw	MNEMO_ORA, MNEMO_CMP
disassm_table_8085_80_BF_end:

disassm_table_8085_cc:
	.if msb(disassm_table_8085_cc_end - 1) - msb($)
	.error disassm_table_8085_cc
	.endif
	dw	MNEMO_xNZ - 1, MNEMO_xZ  - 1
	dw	MNEMO_xNC - 1, MNEMO_xC  - 1
	dw	MNEMO_xPO - 1, MNEMO_xPE - 1
	dw	MNEMO_xP  - 1, MNEMO_xM  - 1
disassm_table_8085_cc_end:

disassm_reg8_8085:
	.if msb(disassm_reg8_8085_end - 1) - msb($)
	.error disassm_reg8_8085
	.endif
	db	"BCDEHLMA"
disassm_reg8_8085_end:

disassm_reg16_8085:
	.if msb(disassm_reg16_8085_end - 1) - msb($)
	.error disassm_reg16_8085
	.endif
	dw	MNEMO_B
	dw	MNEMO_D
	dw	MNEMO_H
	dw	MNEMO_SP
	dw	MNEMO_PSW
disassm_reg16_8085_end:

;  =============================================================================
;  end of file
