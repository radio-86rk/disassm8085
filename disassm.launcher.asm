;  #############################################################################
;  ##  ЗАПУСКАТЕЛЬ DISASSEMBLER 8080/8085                                     ##
;  #############################################################################
;
;  Author:  Vitaliy Poedinok aka Vital72
;  License: MIT
;  www:     http://www.86rk.ru/
;  e-mail:  vital72@86rk.ru
;  Version: 1
;  Date:    01.05.25
;  =============================================================================
;  КОНФИГУРАЦИЯ DISASSEMBLER 8080/8085  ========================================
;  DISASSM_SUPPORT_8085 = 0 -- дизассемблер не поддерживает инструкции 8085,
;      недокументированные коды будут отображаться прочерком
;  DISASSM_SUPPORT_8085 = 1 -- дизассемблер поддерживает инструкции 8085

DISASSM_SUPPORT_8085	EQU	0

GET_STR		EQU	0F8EEh
STR2HEX		EQU	0F95Ah
OUT_STR		EQU	0F818h

	org	7000h
	lxi	h, START_ADDR_TXT
	call	OUT_STR
	call	GET_STR
	call	STR2HEX
	push	h
	lxi	h, END_ADDR_TXT
	call	OUT_STR
	call	GET_STR
	call	STR2HEX
	xchg
	pop	h
	;  HL = начальный адрес блока
	;  DE = конечный адрес блока

.include disassm.v2.626.inc.asm

START_ADDR_TXT:
	db	"\r\nSTART ADDR: ", 0
END_ADDR_TXT:
	db	"\r\nEND ADDR: ", 0

