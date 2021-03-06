; Assembly for dcdemo2020.bas
; compiled with mcbasic -native

; Equates for MC-10 MICROCOLOR BASIC 1.0
; 
; Direct page equates
DP_LNUM	.equ	$E2	; current line in BASIC
DP_TABW	.equ	$E4	; current tab width on console
DP_LPOS	.equ	$E6	; current line position on console
DP_LWID	.equ	$E7	; current line width of console
; 
; Memory equates
M_PMSK	.equ	$423C	; pixel mask for SET, RESET and POINT
M_IKEY	.equ	$427F	; key code for INKEY$
M_CRSR	.equ	$4280	; cursor location
M_LBUF	.equ	$42B2	; line input buffer (130 chars)
M_MSTR	.equ	$4334	; buffer for small string moves
M_CODE	.equ	$4346	; start of program space
; 
; ROM equates
R_BKMSG	.equ	$E1C1	; 'BREAK' string location
R_ERROR	.equ	$E238	; generate error and restore direct mode
R_BREAK	.equ	$E266	; generate break and restore direct mode
R_RESET	.equ	$E3EE	; setup stack and disable CONT
R_SPACE	.equ	$E7B9	; emit " " to console
R_QUEST	.equ	$E7BC	; emit "?" to console
R_REDO	.equ	$E7C1	; emit "?REDO" to console
R_EXTRA	.equ	$E8AB	; emit "?EXTRA IGNORED" to console
R_DMODE	.equ	$F7AA	; display OK prompt and restore direct mode
R_KPOLL	.equ	$F879	; if key is down, do KEYIN, else set Z CCR flag
R_KEYIN	.equ	$F883	; poll key for key-down transition set Z otherwise
R_PUTC	.equ	$F9C9	; write ACCA to console
R_MKTAB	.equ	$FA7B	; setup tabs for console
R_GETLN	.equ	$FAA4	; get line, returning with X pointing to M_BUF-1
R_SETPX	.equ	$FB44	; write pixel character to X
R_CLRPX	.equ	$FB59	; clear pixel character in X
R_MSKPX	.equ	$FB7C	; get pixel screen location X and mask in R_PMSK
R_CLSN	.equ	$FBC4	; clear screen with color code in ACCB
R_CLS	.equ	$FBD4	; clear screen with space character
R_SOUND	.equ	$FFAB	; play sound with pitch in ACCA and duration in ACCB
R_MCXID	.equ	$FFDA	; ID location for MCX BASIC

; direct page registers
	.org	$80
strbuf	.block	2
strend	.block	2
strfree	.block	2
strstop	.block	2
dataptr	.block	2
inptptr	.block	2
redoptr	.block	2
letptr	.block	2
	.org	$a3
r1	.block	5
r2	.block	5
rend
rvseed	.block	2
tmp1	.block	2
tmp2	.block	2
tmp3	.block	2
tmp4	.block	2
tmp5	.block	2
argv	.block	10


; main program
	.org	M_CODE

	jsr	progbegin

	jsr	clear

LINE_5

	; SC=0

	ldx	#INTVAR_SC
	ldab	#0
	jsr	ld_ix_pb

LINE_6

	; XX=0

	ldx	#INTVAR_XX
	ldab	#0
	jsr	ld_ix_pb

LINE_7

	; T=0

	ldx	#INTVAR_T
	ldab	#0
	jsr	ld_ix_pb

LINE_10

	; CLS 0

	ldab	#0
	jsr	clsn_pb

LINE_20

	; FOR X=5 TO 15

	ldx	#INTVAR_X
	ldab	#5
	jsr	for_ix_pb

	ldab	#15
	jsr	to_ip_pb

LINE_30

	; SET(X,15,4)

	ldx	#INTVAR_X
	jsr	ld_ir1_ix

	ldab	#15
	jsr	ld_ir2_pb

	ldab	#4
	jsr	setc_ir1_ir2_pb

	; NEXT

	jsr	next

LINE_40

	; FOR X=4 TO 16

	ldx	#INTVAR_X
	ldab	#4
	jsr	for_ix_pb

	ldab	#16
	jsr	to_ip_pb

	; SET(X,16,4)

	ldx	#INTVAR_X
	jsr	ld_ir1_ix

	ldab	#16
	jsr	ld_ir2_pb

	ldab	#4
	jsr	setc_ir1_ir2_pb

	; NEXT

	jsr	next

LINE_50

	; FOR X=4 TO 20

	ldx	#INTVAR_X
	ldab	#4
	jsr	for_ix_pb

	ldab	#20
	jsr	to_ip_pb

	; SET(X,17,4)

	ldx	#INTVAR_X
	jsr	ld_ir1_ix

	ldab	#17
	jsr	ld_ir2_pb

	ldab	#4
	jsr	setc_ir1_ir2_pb

	; SET(X,18,4)

	ldx	#INTVAR_X
	jsr	ld_ir1_ix

	ldab	#18
	jsr	ld_ir2_pb

	ldab	#4
	jsr	setc_ir1_ir2_pb

	; NEXT

	jsr	next

LINE_60

	; FOR X=4 TO 16

	ldx	#INTVAR_X
	ldab	#4
	jsr	for_ix_pb

	ldab	#16
	jsr	to_ip_pb

	; SET(X,19,4)

	ldx	#INTVAR_X
	jsr	ld_ir1_ix

	ldab	#19
	jsr	ld_ir2_pb

	ldab	#4
	jsr	setc_ir1_ir2_pb

	; NEXT

	jsr	next

LINE_70

	; FOR X=4 TO 20

	ldx	#INTVAR_X
	ldab	#4
	jsr	for_ix_pb

	ldab	#20
	jsr	to_ip_pb

	; SET(X,20,4)

	ldx	#INTVAR_X
	jsr	ld_ir1_ix

	ldab	#20
	jsr	ld_ir2_pb

	ldab	#4
	jsr	setc_ir1_ir2_pb

	; SET(X,21,4)

	ldx	#INTVAR_X
	jsr	ld_ir1_ix

	ldab	#21
	jsr	ld_ir2_pb

	ldab	#4
	jsr	setc_ir1_ir2_pb

	; NEXT

	jsr	next

LINE_75

	; RESET(20,21)

	ldab	#20
	jsr	ld_ir1_pb

	ldab	#21
	jsr	reset_ir1_pb

LINE_76

	; RESET(20,17)

	ldab	#20
	jsr	ld_ir1_pb

	ldab	#17
	jsr	reset_ir1_pb

LINE_80

	; FOR X=4 TO 16

	ldx	#INTVAR_X
	ldab	#4
	jsr	for_ix_pb

	ldab	#16
	jsr	to_ip_pb

	; SET(X,22,4)

	ldx	#INTVAR_X
	jsr	ld_ir1_ix

	ldab	#22
	jsr	ld_ir2_pb

	ldab	#4
	jsr	setc_ir1_ir2_pb

	; NEXT

	jsr	next

LINE_90

	; FOR X=5 TO 15

	ldx	#INTVAR_X
	ldab	#5
	jsr	for_ix_pb

	ldab	#15
	jsr	to_ip_pb

	; SET(X,23,4)

	ldx	#INTVAR_X
	jsr	ld_ir1_ix

	ldab	#23
	jsr	ld_ir2_pb

	ldab	#4
	jsr	setc_ir1_ir2_pb

	; NEXT

	jsr	next

LINE_100

	; FOR X=4 TO 15

	ldx	#INTVAR_X
	ldab	#4
	jsr	for_ix_pb

	ldab	#15
	jsr	to_ip_pb

	; SET(X,24,4)

	ldx	#INTVAR_X
	jsr	ld_ir1_ix

	ldab	#24
	jsr	ld_ir2_pb

	ldab	#4
	jsr	setc_ir1_ir2_pb

	; NEXT

	jsr	next

LINE_110

	; FOR X=3 TO 15

	ldx	#INTVAR_X
	ldab	#3
	jsr	for_ix_pb

	ldab	#15
	jsr	to_ip_pb

	; SET(X,25,4)

	ldx	#INTVAR_X
	jsr	ld_ir1_ix

	ldab	#25
	jsr	ld_ir2_pb

	ldab	#4
	jsr	setc_ir1_ir2_pb

	; NEXT

	jsr	next

LINE_120

	; FOR X=2 TO 18

	ldx	#INTVAR_X
	ldab	#2
	jsr	for_ix_pb

	ldab	#18
	jsr	to_ip_pb

	; SET(X,26,4)

	ldx	#INTVAR_X
	jsr	ld_ir1_ix

	ldab	#26
	jsr	ld_ir2_pb

	ldab	#4
	jsr	setc_ir1_ir2_pb

	; NEXT

	jsr	next

LINE_130

	; FOR X=1 TO 15

	ldx	#INTVAR_X
	ldab	#1
	jsr	for_ix_pb

	ldab	#15
	jsr	to_ip_pb

	; SET(X,27,4)

	ldx	#INTVAR_X
	jsr	ld_ir1_ix

	ldab	#27
	jsr	ld_ir2_pb

	ldab	#4
	jsr	setc_ir1_ir2_pb

	; NEXT

	jsr	next

LINE_140

	; FOR X=0 TO 15

	ldx	#INTVAR_X
	ldab	#0
	jsr	for_ix_pb

	ldab	#15
	jsr	to_ip_pb

	; SET(X,28,4)

	ldx	#INTVAR_X
	jsr	ld_ir1_ix

	ldab	#28
	jsr	ld_ir2_pb

	ldab	#4
	jsr	setc_ir1_ir2_pb

	; NEXT

	jsr	next

LINE_150

	; FOR X=0 TO 15

	ldx	#INTVAR_X
	ldab	#0
	jsr	for_ix_pb

	ldab	#15
	jsr	to_ip_pb

	; FOR Y=29 TO 31

	ldx	#INTVAR_Y
	ldab	#29
	jsr	for_ix_pb

	ldab	#31
	jsr	to_ip_pb

LINE_160

	; SET(X,Y,4)

	ldx	#INTVAR_X
	jsr	ld_ir1_ix

	ldx	#INTVAR_Y
	jsr	ld_ir2_ix

	ldab	#4
	jsr	setc_ir1_ir2_pb

	; NEXT Y,X

	ldx	#INTVAR_Y
	jsr	nextvar_ix

	jsr	next

	ldx	#INTVAR_X
	jsr	nextvar_ix

	jsr	next

LINE_170

	; SET(19,25,4)

	ldab	#19
	jsr	ld_ir1_pb

	ldab	#25
	jsr	ld_ir2_pb

	ldab	#4
	jsr	setc_ir1_ir2_pb

	; SET(19,27,4)

	ldab	#19
	jsr	ld_ir1_pb

	ldab	#27
	jsr	ld_ir2_pb

	ldab	#4
	jsr	setc_ir1_ir2_pb

LINE_180

	; RESET(14,17)

	ldab	#14
	jsr	ld_ir1_pb

	ldab	#17
	jsr	reset_ir1_pb

LINE_185

	; IF XX=13 THEN

	ldx	#INTVAR_XX
	jsr	ld_ir1_ix

	ldab	#13
	jsr	ldeq_ir1_ir1_pb

	ldx	#LINE_190
	jsr	jmpeq_ir1_ix

	; RETURN

	jsr	return

LINE_190

	; FOR X=0 TO 63

	ldx	#INTVAR_X
	ldab	#0
	jsr	for_ix_pb

	ldab	#63
	jsr	to_ip_pb

	; SET(X,0,4)

	ldx	#INTVAR_X
	jsr	ld_ir1_ix

	ldab	#0
	jsr	ld_ir2_pb

	ldab	#4
	jsr	setc_ir1_ir2_pb

	; SET(X,31,4)

	ldx	#INTVAR_X
	jsr	ld_ir1_ix

	ldab	#31
	jsr	ld_ir2_pb

	ldab	#4
	jsr	setc_ir1_ir2_pb

	; NEXT

	jsr	next

LINE_200

	; FOR Y=0 TO 31

	ldx	#INTVAR_Y
	ldab	#0
	jsr	for_ix_pb

	ldab	#31
	jsr	to_ip_pb

	; SET(0,Y,4)

	ldab	#0
	jsr	ld_ir1_pb

	ldx	#INTVAR_Y
	jsr	ld_ir2_ix

	ldab	#4
	jsr	setc_ir1_ir2_pb

	; SET(63,Y,4)

	ldab	#63
	jsr	ld_ir1_pb

	ldx	#INTVAR_Y
	jsr	ld_ir2_ix

	ldab	#4
	jsr	setc_ir1_ir2_pb

	; NEXT

	jsr	next

LINE_210

	; PRINT @340, "dragon";

	ldd	#340
	jsr	prat_pw

	jsr	pr_ss
	.text	6, "dragon"

LINE_211

	; PRINT @372, "castles";

	ldd	#372
	jsr	prat_pw

	jsr	pr_ss
	.text	7, "castles"

LINE_220

	; FOR X=35 TO 55 STEP 2

	ldx	#INTVAR_X
	ldab	#35
	jsr	for_ix_pb

	ldab	#55
	jsr	to_ip_pb

	ldab	#2
	jsr	ld_ir1_pb

	jsr	step_ip_ir1

LINE_230

	; SET(X,10,3)

	ldx	#INTVAR_X
	jsr	ld_ir1_ix

	ldab	#10
	jsr	ld_ir2_pb

	ldab	#3
	jsr	setc_ir1_ir2_pb

	; NEXT

	jsr	next

LINE_240

	; FOR X=36 TO 54

	ldx	#INTVAR_X
	ldab	#36
	jsr	for_ix_pb

	ldab	#54
	jsr	to_ip_pb

	; FOR Y=11 TO 12

	ldx	#INTVAR_Y
	ldab	#11
	jsr	for_ix_pb

	ldab	#12
	jsr	to_ip_pb

LINE_250

	; SET(X,Y,3)

	ldx	#INTVAR_X
	jsr	ld_ir1_ix

	ldx	#INTVAR_Y
	jsr	ld_ir2_ix

	ldab	#3
	jsr	setc_ir1_ir2_pb

	; NEXT Y,X

	ldx	#INTVAR_Y
	jsr	nextvar_ix

	jsr	next

	ldx	#INTVAR_X
	jsr	nextvar_ix

	jsr	next

LINE_260

	; FOR X=37 TO 53

	ldx	#INTVAR_X
	ldab	#37
	jsr	for_ix_pb

	ldab	#53
	jsr	to_ip_pb

LINE_270

	; FOR Y=13 TO 15

	ldx	#INTVAR_Y
	ldab	#13
	jsr	for_ix_pb

	ldab	#15
	jsr	to_ip_pb

	; SET(X,Y,3)

	ldx	#INTVAR_X
	jsr	ld_ir1_ix

	ldx	#INTVAR_Y
	jsr	ld_ir2_ix

	ldab	#3
	jsr	setc_ir1_ir2_pb

	; NEXT Y,X

	ldx	#INTVAR_Y
	jsr	nextvar_ix

	jsr	next

	ldx	#INTVAR_X
	jsr	nextvar_ix

	jsr	next

LINE_280

	; RESET(44,15)

	ldab	#44
	jsr	ld_ir1_pb

	ldab	#15
	jsr	reset_ir1_pb

	; RESET(45,15)

	ldab	#45
	jsr	ld_ir1_pb

	ldab	#15
	jsr	reset_ir1_pb

LINE_281

	; SOUND 190,4

	ldab	#190
	jsr	ld_ir1_pb

	ldab	#4
	jsr	ld_ir2_pb

	jsr	sound_ir1_ir2

	; FOR X=1 TO 3000

	ldx	#INTVAR_X
	ldab	#1
	jsr	for_ix_pb

	ldd	#3000
	jsr	to_ip_pw

	; NEXT

	jsr	next

LINE_290

	; GOTO 7000

	ldx	#LINE_7000
	jsr	goto_ix

LINE_300

	; CLS 0

	ldab	#0
	jsr	clsn_pb

LINE_310

	; FOR X=28 TO 33

	ldx	#INTVAR_X
	ldab	#28
	jsr	for_ix_pb

	ldab	#33
	jsr	to_ip_pb

	; FOR Y=10 TO 25

	ldx	#INTVAR_Y
	ldab	#10
	jsr	for_ix_pb

	ldab	#25
	jsr	to_ip_pb

LINE_320

	; SET(X,Y,3)

	ldx	#INTVAR_X
	jsr	ld_ir1_ix

	ldx	#INTVAR_Y
	jsr	ld_ir2_ix

	ldab	#3
	jsr	setc_ir1_ir2_pb

	; NEXT Y,X

	ldx	#INTVAR_Y
	jsr	nextvar_ix

	jsr	next

	ldx	#INTVAR_X
	jsr	nextvar_ix

	jsr	next

LINE_330

	; FOR Y=6 TO 8

	ldx	#INTVAR_Y
	ldab	#6
	jsr	for_ix_pb

	ldab	#8
	jsr	to_ip_pb

LINE_335

	; SET(30,Y,2)

	ldab	#30
	jsr	ld_ir1_pb

	ldx	#INTVAR_Y
	jsr	ld_ir2_ix

	ldab	#2
	jsr	setc_ir1_ir2_pb

	; SET(31,Y,2)

	ldab	#31
	jsr	ld_ir1_pb

	ldx	#INTVAR_Y
	jsr	ld_ir2_ix

	ldab	#2
	jsr	setc_ir1_ir2_pb

	; NEXT

	jsr	next

LINE_340

	; RETURN

	jsr	return

LINE_350

	; CLS 0

	ldab	#0
	jsr	clsn_pb

LINE_355

	; FOR X=15 TO 40

	ldx	#INTVAR_X
	ldab	#15
	jsr	for_ix_pb

	ldab	#40
	jsr	to_ip_pb

	; FOR Y=15 TO 17

	ldx	#INTVAR_Y
	ldab	#15
	jsr	for_ix_pb

	ldab	#17
	jsr	to_ip_pb

LINE_360

	; SET(X,Y,2)

	ldx	#INTVAR_X
	jsr	ld_ir1_ix

	ldx	#INTVAR_Y
	jsr	ld_ir2_ix

	ldab	#2
	jsr	setc_ir1_ir2_pb

	; NEXT Y,X

	ldx	#INTVAR_Y
	jsr	nextvar_ix

	jsr	next

	ldx	#INTVAR_X
	jsr	nextvar_ix

	jsr	next

LINE_365

	; FOR Y=13 TO 19

	ldx	#INTVAR_Y
	ldab	#13
	jsr	for_ix_pb

	ldab	#19
	jsr	to_ip_pb

LINE_370

	; SET(14,Y,2)

	ldab	#14
	jsr	ld_ir1_pb

	ldx	#INTVAR_Y
	jsr	ld_ir2_ix

	ldab	#2
	jsr	setc_ir1_ir2_pb

	; NEXT Y

	ldx	#INTVAR_Y
	jsr	nextvar_ix

	jsr	next

LINE_375

	; FOR X=9 TO 13

	ldx	#INTVAR_X
	ldab	#9
	jsr	for_ix_pb

	ldab	#13
	jsr	to_ip_pb

LINE_376

	; FOR Y=15 TO 17

	ldx	#INTVAR_Y
	ldab	#15
	jsr	for_ix_pb

	ldab	#17
	jsr	to_ip_pb

LINE_380

	; SET(X,Y,2)

	ldx	#INTVAR_X
	jsr	ld_ir1_ix

	ldx	#INTVAR_Y
	jsr	ld_ir2_ix

	ldab	#2
	jsr	setc_ir1_ir2_pb

	; NEXT Y,X

	ldx	#INTVAR_Y
	jsr	nextvar_ix

	jsr	next

	ldx	#INTVAR_X
	jsr	nextvar_ix

	jsr	next

LINE_385

	; SET(41,16,2)

	ldab	#41
	jsr	ld_ir1_pb

	ldab	#16
	jsr	ld_ir2_pb

	ldab	#2
	jsr	setc_ir1_ir2_pb

	; SET(42,16,2)

	ldab	#42
	jsr	ld_ir1_pb

	ldab	#16
	jsr	ld_ir2_pb

	ldab	#2
	jsr	setc_ir1_ir2_pb

LINE_390

	; RETURN

	jsr	return

LINE_400

	; CLS 0

	ldab	#0
	jsr	clsn_pb

LINE_410

	; FOR X=10 TO 54

	ldx	#INTVAR_X
	ldab	#10
	jsr	for_ix_pb

	ldab	#54
	jsr	to_ip_pb

	; SET(X,17,4)

	ldx	#INTVAR_X
	jsr	ld_ir1_ix

	ldab	#17
	jsr	ld_ir2_pb

	ldab	#4
	jsr	setc_ir1_ir2_pb

	; NEXT

	jsr	next

LINE_420

	; FOR X=50 TO 51

	ldx	#INTVAR_X
	ldab	#50
	jsr	for_ix_pb

	ldab	#51
	jsr	to_ip_pb

	; FOR Y=15 TO 19

	ldx	#INTVAR_Y
	ldab	#15
	jsr	for_ix_pb

	ldab	#19
	jsr	to_ip_pb

LINE_421

	; SET(X,Y,4)

	ldx	#INTVAR_X
	jsr	ld_ir1_ix

	ldx	#INTVAR_Y
	jsr	ld_ir2_ix

	ldab	#4
	jsr	setc_ir1_ir2_pb

	; NEXT Y,X

	ldx	#INTVAR_Y
	jsr	nextvar_ix

	jsr	next

	ldx	#INTVAR_X
	jsr	nextvar_ix

	jsr	next

LINE_422

	; SET(52,16,4)

	ldab	#52
	jsr	ld_ir1_pb

	ldab	#16
	jsr	ld_ir2_pb

	ldab	#4
	jsr	setc_ir1_ir2_pb

	; SET(52,18,4)

	ldab	#52
	jsr	ld_ir1_pb

	ldab	#18
	jsr	ld_ir2_pb

	ldab	#4
	jsr	setc_ir1_ir2_pb

LINE_430

	; RETURN

	jsr	return

LINE_450

	; CLS 0

	ldab	#0
	jsr	clsn_pb

LINE_460

	; C$=""

	jsr	ld_sr1_ss
	.text	1, "\x9F"

	ldx	#STRVAR_C
	jsr	ld_sx_sr1

	; B$=C$

	ldx	#STRVAR_C
	jsr	ld_sr1_sx

	ldx	#STRVAR_B
	jsr	ld_sx_sr1

LINE_461

	; FOR X=1 TO 15

	ldx	#INTVAR_X
	ldab	#1
	jsr	for_ix_pb

	ldab	#15
	jsr	to_ip_pb

	; B$=B$+C$

	ldx	#STRVAR_B
	jsr	strinit_sr1_sx

	ldx	#STRVAR_C
	jsr	strcat_sr1_sr1_sx

	ldx	#STRVAR_B
	jsr	ld_sx_sr1

	; NEXT X

	ldx	#INTVAR_X
	jsr	nextvar_ix

	jsr	next

LINE_462

	; Y=295

	ldx	#INTVAR_Y
	ldd	#295
	jsr	ld_ix_pw

	; FOR X=1 TO 5

	ldx	#INTVAR_X
	ldab	#1
	jsr	for_ix_pb

	ldab	#5
	jsr	to_ip_pb

	; PRINT @Y, B$;

	ldx	#INTVAR_Y
	jsr	prat_ix

	ldx	#STRVAR_B
	jsr	pr_sx

	; Y+=32

	ldx	#INTVAR_Y
	ldab	#32
	jsr	add_ix_ix_pb

	; NEXT X

	ldx	#INTVAR_X
	jsr	nextvar_ix

	jsr	next

LINE_480

	; PRINT @365, "gold";

	ldd	#365
	jsr	prat_pw

	jsr	pr_ss
	.text	4, "gold"

LINE_490

	; RETURN

	jsr	return

LINE_500

	; CLS

	jsr	cls

LINE_510

	; PRINT

	jsr	pr_ss
	.text	1, "\r"

	; PRINT

	jsr	pr_ss
	.text	1, "\r"

	; PRINT

	jsr	pr_ss
	.text	1, "\r"

	; PRINT

	jsr	pr_ss
	.text	1, "\r"

	; PRINT

	jsr	pr_ss
	.text	1, "\r"

LINE_515

	; PRINT "             "

	jsr	pr_ss
	.text	18, "      \x8C\x8C       \x8C\x8C\r"

LINE_516

	; PRINT "      "

	jsr	pr_ss
	.text	18, "      \x80\x8C\x8C\x8C\x8C\x8C\x8C\x8C\x8C\x8C\x80\r"

LINE_517

	; PRINT "      "

	jsr	pr_ss
	.text	18, "      \x83\x80\x80\x80\x80\x80\x80\x80\x80\x80\x83\r"

LINE_518

	; PRINT "          "

	jsr	pr_ss
	.text	18, "      \x8A\x80\x85  \x80  \x8A\x80\x85\r"

LINE_519

	; PRINT "          "

	jsr	pr_ss
	.text	18, "      \x8A\x80\x85  \x80  \x8A\x80\x85\r"

LINE_520

	; PRINT "            "

	jsr	pr_ss
	.text	17, "       \x80\x85     \x8A\x80\r"

LINE_525

	; PRINT @0, "";

	ldab	#0
	jsr	prat_pb

	jsr	pr_ss
	.text	0, ""

LINE_530

	; RETURN

	jsr	return

LINE_550

	; CLS

	jsr	cls

LINE_560

	; PRINT

	jsr	pr_ss
	.text	1, "\r"

	; PRINT

	jsr	pr_ss
	.text	1, "\r"

	; PRINT

	jsr	pr_ss
	.text	1, "\r"

	; PRINT

	jsr	pr_ss
	.text	1, "\r"

	; PRINT

	jsr	pr_ss
	.text	1, "\r"

	; PRINT

	jsr	pr_ss
	.text	1, "\r"

LINE_570

	; PRINT "           "

	jsr	pr_ss
	.text	16, "    \x8C\x8C       \x8C\x8C\r"

LINE_575

	; PRINT "         "

	jsr	pr_ss
	.text	16, "    \x8A\x80\x8C     \x8C\x80\x85\r"

LINE_580

	; PRINT "     "

	jsr	pr_ss
	.text	15, "     \x80\x80\x80\x80\x80\x80\x80\x80\x80\r"

LINE_581

	; PRINT "      ιΰΰΰ"

	jsr	pr_ss
	.text	14, "      \x80\x80\x80\xE9\xE0\xE0\xE0\r"

LINE_582

	; PRINT "      ΰΰΰιΰΰΰ"

	jsr	pr_ss
	.text	14, "      \xE0\xE0\xE0\xE9\xE0\xE0\xE0\r"

LINE_583

	; PRINT "       "

	jsr	pr_ss
	.text	13, "       \x80\x80\x80\x80\x80\r"

LINE_584

	; PRINT "        "

	jsr	pr_ss
	.text	12, "        \x83\x83\x83\r"

LINE_585

	; PRINT "      (SHIELD)"

	jsr	pr_ss
	.text	15, "      (SHIELD)\r"

LINE_590

	; RETURN

	jsr	return

LINE_600

	; CLS 7

	ldab	#7
	jsr	clsn_pb

LINE_610

	; PRINT @256, "";

	ldd	#256
	jsr	prat_pw

	jsr	pr_ss
	.text	0, ""

LINE_620

	; PRINT "οοοοοοοοοοοοοΰγΰμμμμμοοοοοοοοοοο";

	jsr	pr_ss
	.text	32, "\xEF\xEF\xEF\xEF\xEF\xEF\xEF\xEF\xEF\xEF\xEF\xEF\xEF\xE0\xE3\xE0\xEC\xEC\xEC\xEC\xEC\xEF\xEF\xEF\xEF\xEF\xEF\xEF\xEF\xEF\xEF\xEF"

LINE_621

	; PRINT "οοοοοοοοοοοοοΰμΰοοΰοΰοοοοοοοοοοο";

	jsr	pr_ss
	.text	32, "\xEF\xEF\xEF\xEF\xEF\xEF\xEF\xEF\xEF\xEF\xEF\xEF\xEF\xE0\xEC\xE0\xEF\xEF\xE0\xEF\xE0\xEF\xEF\xEF\xEF\xEF\xEF\xEF\xEF\xEF\xEF\xEF"

LINE_622

	; PRINT @0, "";

	ldab	#0
	jsr	prat_pb

	jsr	pr_ss
	.text	0, ""

LINE_630

	; RETURN

	jsr	return

LINE_650

	; CLS

	jsr	cls

LINE_655

	; PRINT @448, "";

	ldd	#448
	jsr	prat_pw

	jsr	pr_ss
	.text	0, ""

LINE_660

	; PRINT "                   "

	jsr	pr_ss
	.text	22, "            \x8C       \x8C\r"

LINE_661

	; PRINT "            "

	jsr	pr_ss
	.text	22, "            \x8B\x80\x84\x8C\x8C\x8C\x88\x80\x87\r"

LINE_662

	; PRINT "              ³°³°"

	jsr	pr_ss
	.text	21, "              \x80\xB3\xB0\xB3\xB0\x85\r"

LINE_663

	; PRINT "              ²°±°"

	jsr	pr_ss
	.text	21, "              \x80\xB2\xB0\xB1\xB0\x85\r"

LINE_664

	; PRINT "              ΄ΌΈ°"

	jsr	pr_ss
	.text	20, "              \x8A\xB4\xBC\xB8\xB0\r"

LINE_665

	; PRINT "     "

	jsr	pr_ss
	.text	28, "     \x83\x82\x8C\x8C\x8C\x8C\x8C\x8C\x8C\x8C\x80\x80\x80\x84\x8C\x8C\x8C\x8C\x8C\x8C\x88\x83\r"

LINE_666

	; PRINT "       "

	jsr	pr_ss
	.text	27, "       \x83\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x83\r"

LINE_667

	; PRINT "         "

	jsr	pr_ss
	.text	25, "         \x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\r"

LINE_668

	; PRINT "           "

	jsr	pr_ss
	.text	23, "           \x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\r"

LINE_669

	; PRINT "              "

	jsr	pr_ss
	.text	22, "              \x80\x80\x80\x80\x80\x80\x80\r"

LINE_670

	; PRINT "                "

	jsr	pr_ss
	.text	21, "               \x89\x86 \x89\x86\r"

LINE_680

	; FOR X=1 TO 15

	ldx	#INTVAR_X
	ldab	#1
	jsr	for_ix_pb

	ldab	#15
	jsr	to_ip_pb

LINE_681

	; FOR R=1 TO 100

	ldx	#INTVAR_R
	ldab	#1
	jsr	for_ix_pb

	ldab	#100
	jsr	to_ip_pb

	; NEXT R

	ldx	#INTVAR_R
	jsr	nextvar_ix

	jsr	next

LINE_682

	; PRINT

	jsr	pr_ss
	.text	1, "\r"

	; NEXT X

	ldx	#INTVAR_X
	jsr	nextvar_ix

	jsr	next

LINE_683

	; PRINT @0, "";

	ldab	#0
	jsr	prat_pb

	jsr	pr_ss
	.text	0, ""

LINE_690

	; RETURN

	jsr	return

LINE_700

	; CLS 0

	ldab	#0
	jsr	clsn_pb

LINE_710

	; FOR X=20 TO 30

	ldx	#INTVAR_X
	ldab	#20
	jsr	for_ix_pb

	ldab	#30
	jsr	to_ip_pb

	; SET(X,10,1)

	ldx	#INTVAR_X
	jsr	ld_ir1_ix

	ldab	#10
	jsr	ld_ir2_pb

	ldab	#1
	jsr	setc_ir1_ir2_pb

	; NEXT

	jsr	next

LINE_711

	; FOR X=19 TO 31

	ldx	#INTVAR_X
	ldab	#19
	jsr	for_ix_pb

	ldab	#31
	jsr	to_ip_pb

	; FOR Y=11 TO 15

	ldx	#INTVAR_Y
	ldab	#11
	jsr	for_ix_pb

	ldab	#15
	jsr	to_ip_pb

LINE_712

	; SET(X,Y,1)

	ldx	#INTVAR_X
	jsr	ld_ir1_ix

	ldx	#INTVAR_Y
	jsr	ld_ir2_ix

	ldab	#1
	jsr	setc_ir1_ir2_pb

	; NEXT Y,X

	ldx	#INTVAR_Y
	jsr	nextvar_ix

	jsr	next

	ldx	#INTVAR_X
	jsr	nextvar_ix

	jsr	next

LINE_713

	; FOR X=20 TO 30

	ldx	#INTVAR_X
	ldab	#20
	jsr	for_ix_pb

	ldab	#30
	jsr	to_ip_pb

	; SET(X,16,1)

	ldx	#INTVAR_X
	jsr	ld_ir1_ix

	ldab	#16
	jsr	ld_ir2_pb

	ldab	#1
	jsr	setc_ir1_ir2_pb

	; NEXT

	jsr	next

LINE_714

	; FOR X=23 TO 27

	ldx	#INTVAR_X
	ldab	#23
	jsr	for_ix_pb

	ldab	#27
	jsr	to_ip_pb

LINE_715

	; FOR Y=17 TO 25

	ldx	#INTVAR_Y
	ldab	#17
	jsr	for_ix_pb

	ldab	#25
	jsr	to_ip_pb

LINE_716

	; SET(X,Y,1)

	ldx	#INTVAR_X
	jsr	ld_ir1_ix

	ldx	#INTVAR_Y
	jsr	ld_ir2_ix

	ldab	#1
	jsr	setc_ir1_ir2_pb

	; NEXT Y,X

	ldx	#INTVAR_Y
	jsr	nextvar_ix

	jsr	next

	ldx	#INTVAR_X
	jsr	nextvar_ix

	jsr	next

LINE_717

	; FOR X=28 TO 50

	ldx	#INTVAR_X
	ldab	#28
	jsr	for_ix_pb

	ldab	#50
	jsr	to_ip_pb

LINE_718

	; FOR Y=23 TO 25

	ldx	#INTVAR_Y
	ldab	#23
	jsr	for_ix_pb

	ldab	#25
	jsr	to_ip_pb

	; SET(X,Y,1)

	ldx	#INTVAR_X
	jsr	ld_ir1_ix

	ldx	#INTVAR_Y
	jsr	ld_ir2_ix

	ldab	#1
	jsr	setc_ir1_ir2_pb

	; NEXT Y,X

	ldx	#INTVAR_Y
	jsr	nextvar_ix

	jsr	next

	ldx	#INTVAR_X
	jsr	nextvar_ix

	jsr	next

LINE_719

	; FOR X=48 TO 50

	ldx	#INTVAR_X
	ldab	#48
	jsr	for_ix_pb

	ldab	#50
	jsr	to_ip_pb

LINE_720

	; FOR Y=17 TO 22

	ldx	#INTVAR_Y
	ldab	#17
	jsr	for_ix_pb

	ldab	#22
	jsr	to_ip_pb

LINE_721

	; SET(X,Y,1)

	ldx	#INTVAR_X
	jsr	ld_ir1_ix

	ldx	#INTVAR_Y
	jsr	ld_ir2_ix

	ldab	#1
	jsr	setc_ir1_ir2_pb

	; NEXT Y,X

	ldx	#INTVAR_Y
	jsr	nextvar_ix

	jsr	next

	ldx	#INTVAR_X
	jsr	nextvar_ix

	jsr	next

LINE_722

	; SET(51,16,1)

	ldab	#51
	jsr	ld_ir1_pb

	ldab	#16
	jsr	ld_ir2_pb

	ldab	#1
	jsr	setc_ir1_ir2_pb

LINE_723

	; SET(52,15,1)

	ldab	#52
	jsr	ld_ir1_pb

	ldab	#15
	jsr	ld_ir2_pb

	ldab	#1
	jsr	setc_ir1_ir2_pb

LINE_724

	; RESET(48,17)

	ldab	#48
	jsr	ld_ir1_pb

	ldab	#17
	jsr	reset_ir1_pb

	; RESET(23,25)

	ldab	#23
	jsr	ld_ir1_pb

	ldab	#25
	jsr	reset_ir1_pb

LINE_725

	; RESET(50,25)

	ldab	#50
	jsr	ld_ir1_pb

	ldab	#25
	jsr	reset_ir1_pb

LINE_726

	; RESET(21,11)

	ldab	#21
	jsr	ld_ir1_pb

	ldab	#11
	jsr	reset_ir1_pb

LINE_727

	; RESET(29,11)

	ldab	#29
	jsr	ld_ir1_pb

	ldab	#11
	jsr	reset_ir1_pb

LINE_728

	; RESET(21,13)

	ldab	#21
	jsr	ld_ir1_pb

	ldab	#13
	jsr	reset_ir1_pb

	; RESET(29,13)

	ldab	#29
	jsr	ld_ir1_pb

	ldab	#13
	jsr	reset_ir1_pb

LINE_729

	; FOR X=22 TO 28

	ldx	#INTVAR_X
	ldab	#22
	jsr	for_ix_pb

	ldab	#28
	jsr	to_ip_pb

	; RESET(X,14)

	ldx	#INTVAR_X
	jsr	ld_ir1_ix

	ldab	#14
	jsr	reset_ir1_pb

	; NEXT

	jsr	next

LINE_730

	; RETURN

	jsr	return

LINE_850

	; CLS 0

	ldab	#0
	jsr	clsn_pb

LINE_851

	; R=E-1

	ldx	#INTVAR_E
	jsr	ld_ir1_ix

	ldab	#1
	jsr	sub_ir1_ir1_pb

	ldx	#INTVAR_R
	jsr	ld_ix_ir1

LINE_852

	; C=143

	ldx	#INTVAR_C
	ldab	#143
	jsr	ld_ix_pb

	; C$=CHR$((16*R)+C)

	ldab	#16
	jsr	ld_ir1_pb

	ldx	#INTVAR_R
	jsr	mul_ir1_ir1_ix

	ldx	#INTVAR_C
	jsr	add_ir1_ir1_ix

	jsr	chr_sr1_ir1

	ldx	#STRVAR_C
	jsr	ld_sx_sr1

	; B$=C$

	ldx	#STRVAR_C
	jsr	ld_sr1_sx

	ldx	#STRVAR_B
	jsr	ld_sx_sr1

LINE_853

	; FOR Y=98 TO 108 STEP 2

	ldx	#INTVAR_Y
	ldab	#98
	jsr	for_ix_pb

	ldab	#108
	jsr	to_ip_pb

	ldab	#2
	jsr	ld_ir1_pb

	jsr	step_ip_ir1

	; GOSUB 863

	ldx	#LINE_863
	jsr	gosub_ix

	; NEXT

	jsr	next

LINE_854

	; FOR Y=114 TO 124 STEP 2

	ldx	#INTVAR_Y
	ldab	#114
	jsr	for_ix_pb

	ldab	#124
	jsr	to_ip_pb

	ldab	#2
	jsr	ld_ir1_pb

	jsr	step_ip_ir1

	; GOSUB 863

	ldx	#LINE_863
	jsr	gosub_ix

	; NEXT

	jsr	next

LINE_855

	; FOR X=1 TO 10

	ldx	#INTVAR_X
	ldab	#1
	jsr	for_ix_pb

	ldab	#10
	jsr	to_ip_pb

	; B$=B$+C$

	ldx	#STRVAR_B
	jsr	strinit_sr1_sx

	ldx	#STRVAR_C
	jsr	strcat_sr1_sr1_sx

	ldx	#STRVAR_B
	jsr	ld_sx_sr1

	; NEXT X

	ldx	#INTVAR_X
	jsr	nextvar_ix

	jsr	next

LINE_856

	; Y=130

	ldx	#INTVAR_Y
	ldab	#130
	jsr	ld_ix_pb

	; FOR X=1 TO 3

	ldx	#INTVAR_X
	ldab	#1
	jsr	for_ix_pb

	ldab	#3
	jsr	to_ip_pb

	; GOSUB 863

	ldx	#LINE_863
	jsr	gosub_ix

	; Y+=32

	ldx	#INTVAR_Y
	ldab	#32
	jsr	add_ix_ix_pb

	; NEXT X

	ldx	#INTVAR_X
	jsr	nextvar_ix

	jsr	next

LINE_857

	; Y=146

	ldx	#INTVAR_Y
	ldab	#146
	jsr	ld_ix_pb

	; FOR X=1 TO 3

	ldx	#INTVAR_X
	ldab	#1
	jsr	for_ix_pb

	ldab	#3
	jsr	to_ip_pb

	; GOSUB 863

	ldx	#LINE_863
	jsr	gosub_ix

	; Y+=32

	ldx	#INTVAR_Y
	ldab	#32
	jsr	add_ix_ix_pb

	; NEXT X

	ldx	#INTVAR_X
	jsr	nextvar_ix

	jsr	next

LINE_858

	; B$=C$

	ldx	#STRVAR_C
	jsr	ld_sr1_sx

	ldx	#STRVAR_B
	jsr	ld_sx_sr1

	; FOR X=1 TO 22

	ldx	#INTVAR_X
	ldab	#1
	jsr	for_ix_pb

	ldab	#22
	jsr	to_ip_pb

	; B$=B$+C$

	ldx	#STRVAR_B
	jsr	strinit_sr1_sx

	ldx	#STRVAR_C
	jsr	strcat_sr1_sr1_sx

	ldx	#STRVAR_B
	jsr	ld_sx_sr1

	; NEXT X

	ldx	#INTVAR_X
	jsr	nextvar_ix

	jsr	next

LINE_859

	; Y=196

	ldx	#INTVAR_Y
	ldab	#196
	jsr	ld_ix_pb

	; FOR X=1 TO 5

	ldx	#INTVAR_X
	ldab	#1
	jsr	for_ix_pb

	ldab	#5
	jsr	to_ip_pb

	; GOSUB 863

	ldx	#LINE_863
	jsr	gosub_ix

	; Y+=32

	ldx	#INTVAR_Y
	ldab	#32
	jsr	add_ix_ix_pb

	; NEXT X

	ldx	#INTVAR_X
	jsr	nextvar_ix

	jsr	next

LINE_860

	; B$=C$

	ldx	#STRVAR_C
	jsr	ld_sr1_sx

	ldx	#STRVAR_B
	jsr	ld_sx_sr1

	; FOR X=1 TO 7

	ldx	#INTVAR_X
	ldab	#1
	jsr	for_ix_pb

	ldab	#7
	jsr	to_ip_pb

	; B$=B$+C$

	ldx	#STRVAR_B
	jsr	strinit_sr1_sx

	ldx	#STRVAR_C
	jsr	strcat_sr1_sr1_sx

	ldx	#STRVAR_B
	jsr	ld_sx_sr1

	; NEXT X

	ldx	#INTVAR_X
	jsr	nextvar_ix

	jsr	next

	; FOR X=1 TO 7

	ldx	#INTVAR_X
	ldab	#1
	jsr	for_ix_pb

	ldab	#7
	jsr	to_ip_pb

	; B$=B$+CHR$((16*R)+134)

	ldx	#STRVAR_B
	jsr	strinit_sr1_sx

	ldab	#16
	jsr	ld_ir2_pb

	ldx	#INTVAR_R
	jsr	mul_ir2_ir2_ix

	ldab	#134
	jsr	add_ir2_ir2_pb

	jsr	chr_sr2_ir2

	jsr	strcat_sr1_sr1_sr2

	ldx	#STRVAR_B
	jsr	ld_sx_sr1

	; NEXT X

	ldx	#INTVAR_X
	jsr	nextvar_ix

	jsr	next

	; FOR X=1 TO 8

	ldx	#INTVAR_X
	ldab	#1
	jsr	for_ix_pb

	ldab	#8
	jsr	to_ip_pb

	; B$=B$+C$

	ldx	#STRVAR_B
	jsr	strinit_sr1_sx

	ldx	#STRVAR_C
	jsr	strcat_sr1_sr1_sx

	ldx	#STRVAR_B
	jsr	ld_sx_sr1

	; NEXT X

	ldx	#INTVAR_X
	jsr	nextvar_ix

	jsr	next

LINE_861

	; Y=356

	ldx	#INTVAR_Y
	ldd	#356
	jsr	ld_ix_pw

	; FOR X=1 TO 4

	ldx	#INTVAR_X
	ldab	#1
	jsr	for_ix_pb

	ldab	#4
	jsr	to_ip_pb

	; GOSUB 863

	ldx	#LINE_863
	jsr	gosub_ix

	; Y+=32

	ldx	#INTVAR_Y
	ldab	#32
	jsr	add_ix_ix_pb

	; NEXT X

	ldx	#INTVAR_X
	jsr	nextvar_ix

	jsr	next

LINE_862

	; GOTO 865

	ldx	#LINE_865
	jsr	goto_ix

LINE_863

	; PRINT @Y, B$;

	ldx	#INTVAR_Y
	jsr	prat_ix

	ldx	#STRVAR_B
	jsr	pr_sx

LINE_864

	; RETURN

	jsr	return

LINE_865

	; FOR X=1 TO 500

	ldx	#INTVAR_X
	ldab	#1
	jsr	for_ix_pb

	ldd	#500
	jsr	to_ip_pw

	; NEXT

	jsr	next

LINE_866

	; B$=""

	jsr	ld_sr1_ss
	.text	1, "\x80"

	ldx	#STRVAR_B
	jsr	ld_sx_sr1

	; FOR X=1 TO 6

	ldx	#INTVAR_X
	ldab	#1
	jsr	for_ix_pb

	ldab	#6
	jsr	to_ip_pb

	; B$=B$+""

	ldx	#STRVAR_B
	jsr	strinit_sr1_sx

	jsr	strcat_sr1_sr1_ss
	.text	1, "\x80"

	ldx	#STRVAR_B
	jsr	ld_sx_sr1

	; NEXT

	jsr	next

LINE_867

	; Y=460

	ldx	#INTVAR_Y
	ldd	#460
	jsr	ld_ix_pw

	; FOR X=1 TO 4

	ldx	#INTVAR_X
	ldab	#1
	jsr	for_ix_pb

	ldab	#4
	jsr	to_ip_pb

	; GOSUB 863

	ldx	#LINE_863
	jsr	gosub_ix

	; Y-=32

	ldx	#INTVAR_Y
	ldab	#32
	jsr	sub_ix_ix_pb

LINE_868

	; SOUND 255,1

	ldab	#255
	jsr	ld_ir1_pb

	ldab	#1
	jsr	ld_ir2_pb

	jsr	sound_ir1_ir2

	; NEXT X

	ldx	#INTVAR_X
	jsr	nextvar_ix

	jsr	next

LINE_869

	; RETURN

	jsr	return

LINE_900

	; CLS 0

	ldab	#0
	jsr	clsn_pb

	; SOUND 230,2

	ldab	#230
	jsr	ld_ir1_pb

	ldab	#2
	jsr	ld_ir2_pb

	jsr	sound_ir1_ir2

LINE_905

	; GOTO 8000

	ldx	#LINE_8000
	jsr	goto_ix

LINE_922

	; PRINT @262, "1";

	ldd	#262
	jsr	prat_pw

	jsr	pr_ss
	.text	1, "1"

LINE_923

	; PRINT @270, "3";

	ldd	#270
	jsr	prat_pw

	jsr	pr_ss
	.text	1, "3"

LINE_924

	; PRINT @277, "5";

	ldd	#277
	jsr	prat_pw

	jsr	pr_ss
	.text	1, "5"

LINE_925

	; PRINT @285, "7";

	ldd	#285
	jsr	prat_pw

	jsr	pr_ss
	.text	1, "7"

LINE_926

	; PRINT @422, "2";

	ldd	#422
	jsr	prat_pw

	jsr	pr_ss
	.text	1, "2"

LINE_927

	; PRINT @430, "4";

	ldd	#430
	jsr	prat_pw

	jsr	pr_ss
	.text	1, "4"

LINE_928

	; PRINT @437, "6";

	ldd	#437
	jsr	prat_pw

	jsr	pr_ss
	.text	1, "6"

LINE_929

	; PRINT @445, "8";

	ldd	#445
	jsr	prat_pw

	jsr	pr_ss
	.text	1, "8"

LINE_930

	; PRINT @160, "mapofcastles";

	ldab	#160
	jsr	prat_pb

	jsr	pr_ss
	.text	14, "map\x80of\x80castles"

LINE_931

	; PRINT @50, "gamelevel";STR$(L);" ";

	ldab	#50
	jsr	prat_pb

	jsr	pr_ss
	.text	11, "game\x80level\x80"

	ldx	#INTVAR_L
	jsr	str_sr1_ix

	jsr	pr_sr1

	jsr	pr_ss
	.text	1, " "

LINE_932

	; PRINT @64, "score=";STR$(SC);" ";

	ldab	#64
	jsr	prat_pb

	jsr	pr_ss
	.text	6, "score="

	ldx	#INTVAR_SC
	jsr	str_sr1_ix

	jsr	pr_sr1

	jsr	pr_ss
	.text	1, " "

LINE_933

	; IF SC=>P THEN

	ldx	#INTVAR_SC
	jsr	ld_ir1_ix

	ldx	#INTVAR_P
	jsr	ldge_ir1_ir1_ix

	ldx	#LINE_934
	jsr	jmpeq_ir1_ix

	; PRINT @96, "**canwin**";

	ldab	#96
	jsr	prat_pb

	jsr	pr_ss
	.text	11, "**can\x90win**"

LINE_934

	; PRINT @85, "(";STR$(P);" )";

	ldab	#85
	jsr	prat_pb

	jsr	pr_ss
	.text	1, "("

	ldx	#INTVAR_P
	jsr	str_sr1_ix

	jsr	pr_sr1

	jsr	pr_ss
	.text	2, " )"

LINE_935

	; REM HOLDER

LINE_936

	; PRINT @146, "turns=";STR$(T);" ";

	ldab	#146
	jsr	prat_pb

	jsr	pr_ss
	.text	6, "turns="

	ldx	#INTVAR_T
	jsr	str_sr1_ix

	jsr	pr_sr1

	jsr	pr_ss
	.text	1, " "

LINE_937

	; T+=1

	ldx	#INTVAR_T
	ldab	#1
	jsr	add_ix_ix_pb

LINE_938

	; PRINT @0, "";

	ldab	#0
	jsr	prat_pb

	jsr	pr_ss
	.text	0, ""

LINE_939

	; PRINT "castle";

	jsr	pr_ss
	.text	6, "castle"

	; E=RND(8)

	ldab	#8
	jsr	irnd_ir1_pb

	ldx	#INTVAR_E
	jsr	ld_ix_ir1

	; PRINT "";STR$(E);" ";

	jsr	pr_ss
	.text	0, ""

	ldx	#INTVAR_E
	jsr	str_sr1_ix

	jsr	pr_sr1

	jsr	pr_ss
	.text	1, " "

	; FOR X=1 TO 2500

	ldx	#INTVAR_X
	ldab	#1
	jsr	for_ix_pb

	ldd	#2500
	jsr	to_ip_pw

	; NEXT

	jsr	next

LINE_940

	; D=RND(8)

	ldab	#8
	jsr	irnd_ir1_pb

	ldx	#INTVAR_D
	jsr	ld_ix_ir1

LINE_948

	; IF E=<0 THEN

	ldab	#0
	jsr	ld_ir1_pb

	ldx	#INTVAR_E
	jsr	ldge_ir1_ir1_ix

	ldx	#LINE_938
	jsr	jmpne_ir1_ix

LINE_949

	; IF E=>9 THEN

	ldx	#INTVAR_E
	jsr	ld_ir1_ix

	ldab	#9
	jsr	ldge_ir1_ir1_pb

	ldx	#LINE_938
	jsr	jmpne_ir1_ix

LINE_950

	; IF E=1 THEN

	ldx	#INTVAR_E
	jsr	ld_ir1_ix

	ldab	#1
	jsr	ldeq_ir1_ir1_pb

	ldx	#LINE_1500
	jsr	jmpne_ir1_ix

LINE_951

	; IF E=2 THEN

	ldx	#INTVAR_E
	jsr	ld_ir1_ix

	ldab	#2
	jsr	ldeq_ir1_ir1_pb

	ldx	#LINE_2000
	jsr	jmpne_ir1_ix

LINE_952

	; IF E=3 THEN

	ldx	#INTVAR_E
	jsr	ld_ir1_ix

	ldab	#3
	jsr	ldeq_ir1_ir1_pb

	ldx	#LINE_2500
	jsr	jmpne_ir1_ix

LINE_953

	; IF E=4 THEN

	ldx	#INTVAR_E
	jsr	ld_ir1_ix

	ldab	#4
	jsr	ldeq_ir1_ir1_pb

	ldx	#LINE_3000
	jsr	jmpne_ir1_ix

LINE_954

	; IF E=5 THEN

	ldx	#INTVAR_E
	jsr	ld_ir1_ix

	ldab	#5
	jsr	ldeq_ir1_ir1_pb

	ldx	#LINE_3500
	jsr	jmpne_ir1_ix

LINE_955

	; IF E=6 THEN

	ldx	#INTVAR_E
	jsr	ld_ir1_ix

	ldab	#6
	jsr	ldeq_ir1_ir1_pb

	ldx	#LINE_4000
	jsr	jmpne_ir1_ix

LINE_956

	; IF E=7 THEN

	ldx	#INTVAR_E
	jsr	ld_ir1_ix

	ldab	#7
	jsr	ldeq_ir1_ir1_pb

	ldx	#LINE_4500
	jsr	jmpne_ir1_ix

LINE_957

	; IF E=8 THEN

	ldx	#INTVAR_E
	jsr	ld_ir1_ix

	ldab	#8
	jsr	ldeq_ir1_ir1_pb

	ldx	#LINE_5000
	jsr	jmpne_ir1_ix

LINE_958

	; GOTO 935

	ldx	#LINE_935
	jsr	goto_ix

LINE_1500

	; GOSUB 850

	ldx	#LINE_850
	jsr	gosub_ix

LINE_1501

	; FOR X=1 TO 500

	ldx	#INTVAR_X
	ldab	#1
	jsr	for_ix_pb

	ldd	#500
	jsr	to_ip_pw

	; NEXT

	jsr	next

LINE_1504

	; IF (D=1) AND (SC=>P) THEN

	ldx	#INTVAR_D
	jsr	ld_ir1_ix

	ldab	#1
	jsr	ldeq_ir1_ir1_pb

	ldx	#INTVAR_SC
	jsr	ld_ir2_ix

	ldx	#INTVAR_P
	jsr	ldge_ir2_ir2_ix

	jsr	and_ir1_ir1_ir2

	ldx	#LINE_6500
	jsr	jmpne_ir1_ix

LINE_1505

	; IF D=1 THEN

	ldx	#INTVAR_D
	jsr	ld_ir1_ix

	ldab	#1
	jsr	ldeq_ir1_ir1_pb

	ldx	#LINE_6000
	jsr	jmpne_ir1_ix

LINE_1510

	; GOSUB 5500

	ldx	#LINE_5500
	jsr	gosub_ix

LINE_1550

	; IF I=1 THEN

	ldx	#INTVAR_I
	jsr	ld_ir1_ix

	ldab	#1
	jsr	ldeq_ir1_ir1_pb

	ldx	#LINE_1560
	jsr	jmpeq_ir1_ix

	; PRINT @0, "CANDLE IS FOUND HERE (+25).";

	ldab	#0
	jsr	prat_pb

	jsr	pr_ss
	.text	27, "CANDLE IS FOUND HERE (+25)."

	; FOR X=1 TO 2000

	ldx	#INTVAR_X
	ldab	#1
	jsr	for_ix_pb

	ldd	#2000
	jsr	to_ip_pw

	; NEXT X

	ldx	#INTVAR_X
	jsr	nextvar_ix

	jsr	next

	; GOTO 900

	ldx	#LINE_900
	jsr	goto_ix

LINE_1560

	; IF I=2 THEN

	ldx	#INTVAR_I
	jsr	ld_ir1_ix

	ldab	#2
	jsr	ldeq_ir1_ir1_pb

	ldx	#LINE_1570
	jsr	jmpeq_ir1_ix

	; PRINT @0, "A SWORD IS FOUND HERE (+75).";

	ldab	#0
	jsr	prat_pb

	jsr	pr_ss
	.text	28, "A SWORD IS FOUND HERE (+75)."

	; FOR X=1 TO 2000

	ldx	#INTVAR_X
	ldab	#1
	jsr	for_ix_pb

	ldd	#2000
	jsr	to_ip_pw

	; NEXT X

	ldx	#INTVAR_X
	jsr	nextvar_ix

	jsr	next

	; GOTO 900

	ldx	#LINE_900
	jsr	goto_ix

LINE_1570

	; IF I=3 THEN

	ldx	#INTVAR_I
	jsr	ld_ir1_ix

	ldab	#3
	jsr	ldeq_ir1_ir1_pb

	ldx	#LINE_1580
	jsr	jmpeq_ir1_ix

	; PRINT @0, "A SPEAR IS FOUND HERE (+75)."

	ldab	#0
	jsr	prat_pb

	jsr	pr_ss
	.text	29, "A SPEAR IS FOUND HERE (+75).\r"

	; FOR X=1 TO 2000

	ldx	#INTVAR_X
	ldab	#1
	jsr	for_ix_pb

	ldd	#2000
	jsr	to_ip_pw

	; NEXT X

	ldx	#INTVAR_X
	jsr	nextvar_ix

	jsr	next

	; GOTO 900

	ldx	#LINE_900
	jsr	goto_ix

LINE_1580

	; IF I=4 THEN

	ldx	#INTVAR_I
	jsr	ld_ir1_ix

	ldab	#4
	jsr	ldeq_ir1_ir1_pb

	ldx	#LINE_1590
	jsr	jmpeq_ir1_ix

	; PRINT @0, "GOLD IS FOUND HERE (+50).";

	ldab	#0
	jsr	prat_pb

	jsr	pr_ss
	.text	25, "GOLD IS FOUND HERE (+50)."

	; FOR X=1 TO 2000

	ldx	#INTVAR_X
	ldab	#1
	jsr	for_ix_pb

	ldd	#2000
	jsr	to_ip_pw

	; NEXT X

	ldx	#INTVAR_X
	jsr	nextvar_ix

	jsr	next

	; GOTO 900

	ldx	#LINE_900
	jsr	goto_ix

LINE_1590

	; IF I=5 THEN

	ldx	#INTVAR_I
	jsr	ld_ir1_ix

	ldab	#5
	jsr	ldeq_ir1_ir1_pb

	ldx	#LINE_1600
	jsr	jmpeq_ir1_ix

	; PRINT @0, "A HELMET IS FOUND HERE (+50).";

	ldab	#0
	jsr	prat_pb

	jsr	pr_ss
	.text	29, "A HELMET IS FOUND HERE (+50)."

	; FOR X=1 TO 2000

	ldx	#INTVAR_X
	ldab	#1
	jsr	for_ix_pb

	ldd	#2000
	jsr	to_ip_pw

	; NEXT X

	ldx	#INTVAR_X
	jsr	nextvar_ix

	jsr	next

	; GOTO 900

	ldx	#LINE_900
	jsr	goto_ix

LINE_1600

	; IF I=6 THEN

	ldx	#INTVAR_I
	jsr	ld_ir1_ix

	ldab	#6
	jsr	ldeq_ir1_ir1_pb

	ldx	#LINE_1610
	jsr	jmpeq_ir1_ix

	; PRINT @0, "A SHIELD IS FOUND HERE (+100).";

	ldab	#0
	jsr	prat_pb

	jsr	pr_ss
	.text	30, "A SHIELD IS FOUND HERE (+100)."

	; FOR X=1 TO 2000

	ldx	#INTVAR_X
	ldab	#1
	jsr	for_ix_pb

	ldd	#2000
	jsr	to_ip_pw

	; NEXT X

	ldx	#INTVAR_X
	jsr	nextvar_ix

	jsr	next

	; GOTO 900

	ldx	#LINE_900
	jsr	goto_ix

LINE_1610

	; IF I=7 THEN

	ldx	#INTVAR_I
	jsr	ld_ir1_ix

	ldab	#7
	jsr	ldeq_ir1_ir1_pb

	ldx	#LINE_1620
	jsr	jmpeq_ir1_ix

	; PRINT @0, "A KEY IS FOUND HERE (+25).";

	ldab	#0
	jsr	prat_pb

	jsr	pr_ss
	.text	26, "A KEY IS FOUND HERE (+25)."

	; FOR X=1 TO 2000

	ldx	#INTVAR_X
	ldab	#1
	jsr	for_ix_pb

	ldd	#2000
	jsr	to_ip_pw

	; NEXT X

	ldx	#INTVAR_X
	jsr	nextvar_ix

	jsr	next

	; GOTO 900

	ldx	#LINE_900
	jsr	goto_ix

LINE_1620

	; IF I=8 THEN

	ldx	#INTVAR_I
	jsr	ld_ir1_ix

	ldab	#8
	jsr	ldeq_ir1_ir1_pb

	ldx	#LINE_1630
	jsr	jmpeq_ir1_ix

	; PRINT @0, "BAT TAKES AWAY POINTS **(-100)**";

	ldab	#0
	jsr	prat_pb

	jsr	pr_ss
	.text	32, "BAT TAKES AWAY POINTS **(-100)**"

	; SOUND 10,10

	ldab	#10
	jsr	ld_ir1_pb

	ldab	#10
	jsr	ld_ir2_pb

	jsr	sound_ir1_ir2

	; FOR X=1 TO 3000

	ldx	#INTVAR_X
	ldab	#1
	jsr	for_ix_pb

	ldd	#3000
	jsr	to_ip_pw

	; NEXT X

	ldx	#INTVAR_X
	jsr	nextvar_ix

	jsr	next

	; GOTO 900

	ldx	#LINE_900
	jsr	goto_ix

LINE_1630

	; IF I=9 THEN

	ldx	#INTVAR_I
	jsr	ld_ir1_ix

	ldab	#9
	jsr	ldeq_ir1_ir1_pb

	ldx	#LINE_1650
	jsr	jmpeq_ir1_ix

	; PRINT @0, "SNAKE BITE!!!! **(-100)**";

	ldab	#0
	jsr	prat_pb

	jsr	pr_ss
	.text	25, "SNAKE BITE!!!! **(-100)**"

	; SOUND 10,10

	ldab	#10
	jsr	ld_ir1_pb

	ldab	#10
	jsr	ld_ir2_pb

	jsr	sound_ir1_ir2

	; FOR X=1 TO 2000

	ldx	#INTVAR_X
	ldab	#1
	jsr	for_ix_pb

	ldd	#2000
	jsr	to_ip_pw

	; NEXT X

	ldx	#INTVAR_X
	jsr	nextvar_ix

	jsr	next

	; GOTO 900

	ldx	#LINE_900
	jsr	goto_ix

LINE_1650

	; END

	jsr	progend

LINE_2000

	; GOSUB 850

	ldx	#LINE_850
	jsr	gosub_ix

LINE_2010

	; FOR X=1 TO 500

	ldx	#INTVAR_X
	ldab	#1
	jsr	for_ix_pb

	ldd	#500
	jsr	to_ip_pw

	; NEXT

	jsr	next

LINE_2015

	; IF (D=2) AND (SC=>P) THEN

	ldx	#INTVAR_D
	jsr	ld_ir1_ix

	ldab	#2
	jsr	ldeq_ir1_ir1_pb

	ldx	#INTVAR_SC
	jsr	ld_ir2_ix

	ldx	#INTVAR_P
	jsr	ldge_ir2_ir2_ix

	jsr	and_ir1_ir1_ir2

	ldx	#LINE_6500
	jsr	jmpne_ir1_ix

LINE_2016

	; IF D=2 THEN

	ldx	#INTVAR_D
	jsr	ld_ir1_ix

	ldab	#2
	jsr	ldeq_ir1_ir1_pb

	ldx	#LINE_6000
	jsr	jmpne_ir1_ix

LINE_2020

	; GOSUB 5500

	ldx	#LINE_5500
	jsr	gosub_ix

LINE_2500

	; GOSUB 850

	ldx	#LINE_850
	jsr	gosub_ix

LINE_2510

	; FOR X=1 TO 500

	ldx	#INTVAR_X
	ldab	#1
	jsr	for_ix_pb

	ldd	#500
	jsr	to_ip_pw

	; NEXT

	jsr	next

LINE_2520

	; IF (D=3) AND (SC=>P) THEN

	ldx	#INTVAR_D
	jsr	ld_ir1_ix

	ldab	#3
	jsr	ldeq_ir1_ir1_pb

	ldx	#INTVAR_SC
	jsr	ld_ir2_ix

	ldx	#INTVAR_P
	jsr	ldge_ir2_ir2_ix

	jsr	and_ir1_ir1_ir2

	ldx	#LINE_6500
	jsr	jmpne_ir1_ix

LINE_2530

	; IF D=3 THEN

	ldx	#INTVAR_D
	jsr	ld_ir1_ix

	ldab	#3
	jsr	ldeq_ir1_ir1_pb

	ldx	#LINE_6000
	jsr	jmpne_ir1_ix

LINE_2540

	; GOSUB 5500

	ldx	#LINE_5500
	jsr	gosub_ix

LINE_3000

	; GOSUB 850

	ldx	#LINE_850
	jsr	gosub_ix

LINE_3010

	; FOR X=1 TO 500

	ldx	#INTVAR_X
	ldab	#1
	jsr	for_ix_pb

	ldd	#500
	jsr	to_ip_pw

	; NEXT

	jsr	next

LINE_3020

	; IF (D=4) AND (SC=>P) THEN

	ldx	#INTVAR_D
	jsr	ld_ir1_ix

	ldab	#4
	jsr	ldeq_ir1_ir1_pb

	ldx	#INTVAR_SC
	jsr	ld_ir2_ix

	ldx	#INTVAR_P
	jsr	ldge_ir2_ir2_ix

	jsr	and_ir1_ir1_ir2

	ldx	#LINE_6500
	jsr	jmpne_ir1_ix

LINE_3030

	; IF D=4 THEN

	ldx	#INTVAR_D
	jsr	ld_ir1_ix

	ldab	#4
	jsr	ldeq_ir1_ir1_pb

	ldx	#LINE_6000
	jsr	jmpne_ir1_ix

LINE_3040

	; GOSUB 5500

	ldx	#LINE_5500
	jsr	gosub_ix

LINE_3500

	; GOSUB 850

	ldx	#LINE_850
	jsr	gosub_ix

LINE_3510

	; FOR X=1 TO 500

	ldx	#INTVAR_X
	ldab	#1
	jsr	for_ix_pb

	ldd	#500
	jsr	to_ip_pw

	; NEXT

	jsr	next

LINE_3520

	; IF (D=5) AND (SC=>P) THEN

	ldx	#INTVAR_D
	jsr	ld_ir1_ix

	ldab	#5
	jsr	ldeq_ir1_ir1_pb

	ldx	#INTVAR_SC
	jsr	ld_ir2_ix

	ldx	#INTVAR_P
	jsr	ldge_ir2_ir2_ix

	jsr	and_ir1_ir1_ir2

	ldx	#LINE_6500
	jsr	jmpne_ir1_ix

LINE_3530

	; IF D=5 THEN

	ldx	#INTVAR_D
	jsr	ld_ir1_ix

	ldab	#5
	jsr	ldeq_ir1_ir1_pb

	ldx	#LINE_6000
	jsr	jmpne_ir1_ix

LINE_3540

	; GOSUB 5500

	ldx	#LINE_5500
	jsr	gosub_ix

LINE_4000

	; GOSUB 850

	ldx	#LINE_850
	jsr	gosub_ix

LINE_4010

	; FOR X=1 TO 500

	ldx	#INTVAR_X
	ldab	#1
	jsr	for_ix_pb

	ldd	#500
	jsr	to_ip_pw

	; NEXT

	jsr	next

LINE_4020

	; IF (D=6) AND (SC=>P) THEN

	ldx	#INTVAR_D
	jsr	ld_ir1_ix

	ldab	#6
	jsr	ldeq_ir1_ir1_pb

	ldx	#INTVAR_SC
	jsr	ld_ir2_ix

	ldx	#INTVAR_P
	jsr	ldge_ir2_ir2_ix

	jsr	and_ir1_ir1_ir2

	ldx	#LINE_6500
	jsr	jmpne_ir1_ix

LINE_4030

	; IF D=6 THEN

	ldx	#INTVAR_D
	jsr	ld_ir1_ix

	ldab	#6
	jsr	ldeq_ir1_ir1_pb

	ldx	#LINE_6000
	jsr	jmpne_ir1_ix

LINE_4040

	; GOSUB 5500

	ldx	#LINE_5500
	jsr	gosub_ix

LINE_4500

	; GOSUB 850

	ldx	#LINE_850
	jsr	gosub_ix

LINE_4510

	; FOR X=1 TO 500

	ldx	#INTVAR_X
	ldab	#1
	jsr	for_ix_pb

	ldd	#500
	jsr	to_ip_pw

	; NEXT

	jsr	next

LINE_4520

	; IF (D=7) AND (SC=>P) THEN

	ldx	#INTVAR_D
	jsr	ld_ir1_ix

	ldab	#7
	jsr	ldeq_ir1_ir1_pb

	ldx	#INTVAR_SC
	jsr	ld_ir2_ix

	ldx	#INTVAR_P
	jsr	ldge_ir2_ir2_ix

	jsr	and_ir1_ir1_ir2

	ldx	#LINE_6500
	jsr	jmpne_ir1_ix

LINE_4530

	; IF D=7 THEN

	ldx	#INTVAR_D
	jsr	ld_ir1_ix

	ldab	#7
	jsr	ldeq_ir1_ir1_pb

	ldx	#LINE_6000
	jsr	jmpne_ir1_ix

LINE_4540

	; GOSUB 5500

	ldx	#LINE_5500
	jsr	gosub_ix

LINE_5000

	; GOSUB 850

	ldx	#LINE_850
	jsr	gosub_ix

LINE_5010

	; FOR X=1 TO 500

	ldx	#INTVAR_X
	ldab	#1
	jsr	for_ix_pb

	ldd	#500
	jsr	to_ip_pw

	; NEXT

	jsr	next

LINE_5020

	; IF (D=8) AND (SC=>P) THEN

	ldx	#INTVAR_D
	jsr	ld_ir1_ix

	ldab	#8
	jsr	ldeq_ir1_ir1_pb

	ldx	#INTVAR_SC
	jsr	ld_ir2_ix

	ldx	#INTVAR_P
	jsr	ldge_ir2_ir2_ix

	jsr	and_ir1_ir1_ir2

	ldx	#LINE_6500
	jsr	jmpne_ir1_ix

LINE_5030

	; IF D=8 THEN

	ldx	#INTVAR_D
	jsr	ld_ir1_ix

	ldab	#8
	jsr	ldeq_ir1_ir1_pb

	ldx	#LINE_6000
	jsr	jmpne_ir1_ix

LINE_5040

	; GOSUB 5500

	ldx	#LINE_5500
	jsr	gosub_ix

LINE_5500

	; I=RND(9)

	ldab	#9
	jsr	irnd_ir1_pb

	ldx	#INTVAR_I
	jsr	ld_ix_ir1

LINE_5510

	; IF I=1 THEN

	ldx	#INTVAR_I
	jsr	ld_ir1_ix

	ldab	#1
	jsr	ldeq_ir1_ir1_pb

	ldx	#LINE_5520
	jsr	jmpeq_ir1_ix

	; SC+=25

	ldx	#INTVAR_SC
	ldab	#25
	jsr	add_ix_ix_pb

	; GOSUB 300

	ldx	#LINE_300
	jsr	gosub_ix

LINE_5520

	; IF I=2 THEN

	ldx	#INTVAR_I
	jsr	ld_ir1_ix

	ldab	#2
	jsr	ldeq_ir1_ir1_pb

	ldx	#LINE_5530
	jsr	jmpeq_ir1_ix

	; SC+=75

	ldx	#INTVAR_SC
	ldab	#75
	jsr	add_ix_ix_pb

	; GOSUB 350

	ldx	#LINE_350
	jsr	gosub_ix

LINE_5530

	; IF I=3 THEN

	ldx	#INTVAR_I
	jsr	ld_ir1_ix

	ldab	#3
	jsr	ldeq_ir1_ir1_pb

	ldx	#LINE_5540
	jsr	jmpeq_ir1_ix

	; SC+=75

	ldx	#INTVAR_SC
	ldab	#75
	jsr	add_ix_ix_pb

	; GOSUB 400

	ldx	#LINE_400
	jsr	gosub_ix

LINE_5540

	; IF I=4 THEN

	ldx	#INTVAR_I
	jsr	ld_ir1_ix

	ldab	#4
	jsr	ldeq_ir1_ir1_pb

	ldx	#LINE_5550
	jsr	jmpeq_ir1_ix

	; SC+=50

	ldx	#INTVAR_SC
	ldab	#50
	jsr	add_ix_ix_pb

	; GOSUB 450

	ldx	#LINE_450
	jsr	gosub_ix

LINE_5550

	; IF I=5 THEN

	ldx	#INTVAR_I
	jsr	ld_ir1_ix

	ldab	#5
	jsr	ldeq_ir1_ir1_pb

	ldx	#LINE_5560
	jsr	jmpeq_ir1_ix

	; SC+=50

	ldx	#INTVAR_SC
	ldab	#50
	jsr	add_ix_ix_pb

	; GOSUB 500

	ldx	#LINE_500
	jsr	gosub_ix

LINE_5560

	; IF I=6 THEN

	ldx	#INTVAR_I
	jsr	ld_ir1_ix

	ldab	#6
	jsr	ldeq_ir1_ir1_pb

	ldx	#LINE_5570
	jsr	jmpeq_ir1_ix

	; SC+=100

	ldx	#INTVAR_SC
	ldab	#100
	jsr	add_ix_ix_pb

	; GOSUB 550

	ldx	#LINE_550
	jsr	gosub_ix

LINE_5570

	; IF I=7 THEN

	ldx	#INTVAR_I
	jsr	ld_ir1_ix

	ldab	#7
	jsr	ldeq_ir1_ir1_pb

	ldx	#LINE_5580
	jsr	jmpeq_ir1_ix

	; SC+=25

	ldx	#INTVAR_SC
	ldab	#25
	jsr	add_ix_ix_pb

	; GOSUB 600

	ldx	#LINE_600
	jsr	gosub_ix

LINE_5580

	; IF I=8 THEN

	ldx	#INTVAR_I
	jsr	ld_ir1_ix

	ldab	#8
	jsr	ldeq_ir1_ir1_pb

	ldx	#LINE_5590
	jsr	jmpeq_ir1_ix

	; SC-=100

	ldx	#INTVAR_SC
	ldab	#100
	jsr	sub_ix_ix_pb

	; GOSUB 650

	ldx	#LINE_650
	jsr	gosub_ix

LINE_5590

	; IF I=9 THEN

	ldx	#INTVAR_I
	jsr	ld_ir1_ix

	ldab	#9
	jsr	ldeq_ir1_ir1_pb

	ldx	#LINE_5600
	jsr	jmpeq_ir1_ix

	; SC-=100

	ldx	#INTVAR_SC
	ldab	#100
	jsr	sub_ix_ix_pb

	; GOSUB 700

	ldx	#LINE_700
	jsr	gosub_ix

LINE_5600

	; GOTO 1550

	ldx	#LINE_1550
	jsr	goto_ix

LINE_6000

	; XX=13

	ldx	#INTVAR_XX
	ldab	#13
	jsr	ld_ix_pb

	; GOSUB 10

	ldx	#LINE_10
	jsr	gosub_ix

LINE_6010

	; PRINT @64, "youlose";

	ldab	#64
	jsr	prat_pb

	jsr	pr_ss
	.text	14, "\x80\x80\x80\x80\x80\x80you\x80lose"

LINE_6016

	; PRINT @404, "score=";STR$(SC);" ";

	ldd	#404
	jsr	prat_pw

	jsr	pr_ss
	.text	6, "score="

	ldx	#INTVAR_SC
	jsr	str_sr1_ix

	jsr	pr_sr1

	jsr	pr_ss
	.text	1, " "

LINE_6020

	; SOUND RND(10),30

	ldab	#10
	jsr	irnd_ir1_pb

	ldab	#30
	jsr	ld_ir2_pb

	jsr	sound_ir1_ir2

LINE_6030

	; FOR X=1 TO 3000

	ldx	#INTVAR_X
	ldab	#1
	jsr	for_ix_pb

	ldd	#3000
	jsr	to_ip_pw

	; NEXT

	jsr	next

	; CLS 0

	ldab	#0
	jsr	clsn_pb

	; FOR X=1 TO 2000

	ldx	#INTVAR_X
	ldab	#1
	jsr	for_ix_pb

	ldd	#2000
	jsr	to_ip_pw

	; NEXT

	jsr	next

LINE_6040

	; GOTO 5

	ldx	#LINE_5
	jsr	goto_ix

LINE_6500

	; XX=13

	ldx	#INTVAR_XX
	ldab	#13
	jsr	ld_ix_pb

	; GOSUB 10

	ldx	#LINE_10
	jsr	gosub_ix

LINE_6509

	; FOR X=1 TO 255 STEP 10

	ldx	#INTVAR_X
	ldab	#1
	jsr	for_ix_pb

	ldab	#255
	jsr	to_ip_pb

	ldab	#10
	jsr	ld_ir1_pb

	jsr	step_ip_ir1

LINE_6510

	; CLS RND(8)

	ldab	#8
	jsr	irnd_ir1_pb

	jsr	clsn_ir1

LINE_6520

	; SOUND X,1

	ldx	#INTVAR_X
	jsr	ld_ir1_ix

	ldab	#1
	jsr	ld_ir2_pb

	jsr	sound_ir1_ir2

	; NEXT X

	ldx	#INTVAR_X
	jsr	nextvar_ix

	jsr	next

LINE_6530

	; PRINT @64, "   you  win!!!!"

	ldab	#64
	jsr	prat_pb

	jsr	pr_ss
	.text	16, "   you  win!!!!\r"

LINE_6535

	; PRINT

	jsr	pr_ss
	.text	1, "\r"

LINE_6536

	; PRINT "  you killed the dragon!!!"

	jsr	pr_ss
	.text	27, "  you killed the dragon!!!\r"

LINE_6537

	; PRINT

	jsr	pr_ss
	.text	1, "\r"

LINE_6540

	; PRINT "  your score was ";STR$(SC);" "

	jsr	pr_ss
	.text	17, "  your score was "

	ldx	#INTVAR_SC
	jsr	str_sr1_ix

	jsr	pr_sr1

	jsr	pr_ss
	.text	2, " \r"

LINE_6545

	; PRINT @320, "  game level:";STR$(L);" "

	ldd	#320
	jsr	prat_pw

	jsr	pr_ss
	.text	13, "  game level:"

	ldx	#INTVAR_L
	jsr	str_sr1_ix

	jsr	pr_sr1

	jsr	pr_ss
	.text	2, " \r"

LINE_6550

	; PRINT @384, "  number of turns:";STR$(T);" "

	ldd	#384
	jsr	prat_pw

	jsr	pr_ss
	.text	18, "  number of turns:"

	ldx	#INTVAR_T
	jsr	str_sr1_ix

	jsr	pr_sr1

	jsr	pr_ss
	.text	2, " \r"

LINE_6555

	; FOR X=1 TO 3000

	ldx	#INTVAR_X
	ldab	#1
	jsr	for_ix_pb

	ldd	#3000
	jsr	to_ip_pw

	; NEXT

	jsr	next

	; GOTO 6580

	ldx	#LINE_6580
	jsr	goto_ix

LINE_6560

	; PRINT @448, "HIT A KEY TO START OVER";

	ldd	#448
	jsr	prat_pw

	jsr	pr_ss
	.text	23, "HIT A KEY TO START OVER"

LINE_6570

	; Q$=INKEY$

	jsr	inkey_sr1

	ldx	#STRVAR_Q
	jsr	ld_sx_sr1

	; IF Q$="" THEN

	ldx	#STRVAR_Q
	jsr	ld_sr1_sx

	jsr	ldeq_ir1_sr1_ss
	.text	0, ""

	ldx	#LINE_6570
	jsr	jmpne_ir1_ix

LINE_6580

	; GOTO 5

	ldx	#LINE_5
	jsr	goto_ix

LINE_7000

	; CLS

	jsr	cls

	; SOUND 230,2

	ldab	#230
	jsr	ld_ir1_pb

	ldab	#2
	jsr	ld_ir2_pb

	jsr	sound_ir1_ir2

LINE_7001

	; PRINT @128, "1 = *300*"

	ldab	#128
	jsr	prat_pb

	jsr	pr_ss
	.text	10, "1 = *300*\r"

LINE_7002

	; PRINT @160, "2 = *500*"

	ldab	#160
	jsr	prat_pb

	jsr	pr_ss
	.text	10, "2 = *500*\r"

LINE_7003

	; PRINT @192, "3 = *700*"

	ldab	#192
	jsr	prat_pb

	jsr	pr_ss
	.text	10, "3 = *700*\r"

LINE_7004

	; PRINT @224, "4 = *900*"

	ldab	#224
	jsr	prat_pb

	jsr	pr_ss
	.text	10, "4 = *900*\r"

LINE_7005

	; PRINT @256, "5 = **1100**"

	ldd	#256
	jsr	prat_pw

	jsr	pr_ss
	.text	13, "5 = **1100**\r"

LINE_7006

	; PRINT @0, "";

	ldab	#0
	jsr	prat_pb

	jsr	pr_ss
	.text	0, ""

LINE_7010

	; PRINT "GAME LEVEL (1-5) ";

	jsr	pr_ss
	.text	17, "GAME LEVEL (1-5) "

LINE_7015

	; L=RND(2)

	ldab	#2
	jsr	irnd_ir1_pb

	ldx	#INTVAR_L
	jsr	ld_ix_ir1

	; PRINT "";STR$(L);" ";

	jsr	pr_ss
	.text	0, ""

	ldx	#INTVAR_L
	jsr	str_sr1_ix

	jsr	pr_sr1

	jsr	pr_ss
	.text	1, " "

	; FOR X=1 TO 1500

	ldx	#INTVAR_X
	ldab	#1
	jsr	for_ix_pb

	ldd	#1500
	jsr	to_ip_pw

	; NEXT

	jsr	next

LINE_7020

	; IF L=1 THEN

	ldx	#INTVAR_L
	jsr	ld_ir1_ix

	ldab	#1
	jsr	ldeq_ir1_ir1_pb

	ldx	#LINE_7030
	jsr	jmpeq_ir1_ix

	; P=300

	ldx	#INTVAR_P
	ldd	#300
	jsr	ld_ix_pw

LINE_7030

	; IF L=2 THEN

	ldx	#INTVAR_L
	jsr	ld_ir1_ix

	ldab	#2
	jsr	ldeq_ir1_ir1_pb

	ldx	#LINE_7040
	jsr	jmpeq_ir1_ix

	; P=500

	ldx	#INTVAR_P
	ldd	#500
	jsr	ld_ix_pw

LINE_7040

	; IF L=3 THEN

	ldx	#INTVAR_L
	jsr	ld_ir1_ix

	ldab	#3
	jsr	ldeq_ir1_ir1_pb

	ldx	#LINE_7050
	jsr	jmpeq_ir1_ix

	; P=700

	ldx	#INTVAR_P
	ldd	#700
	jsr	ld_ix_pw

LINE_7050

	; IF L=4 THEN

	ldx	#INTVAR_L
	jsr	ld_ir1_ix

	ldab	#4
	jsr	ldeq_ir1_ir1_pb

	ldx	#LINE_7060
	jsr	jmpeq_ir1_ix

	; P=900

	ldx	#INTVAR_P
	ldd	#900
	jsr	ld_ix_pw

LINE_7060

	; IF L=5 THEN

	ldx	#INTVAR_L
	jsr	ld_ir1_ix

	ldab	#5
	jsr	ldeq_ir1_ir1_pb

	ldx	#LINE_7070
	jsr	jmpeq_ir1_ix

	; P=1100

	ldx	#INTVAR_P
	ldd	#1100
	jsr	ld_ix_pw

LINE_7070

	; IF L=>6 THEN

	ldx	#INTVAR_L
	jsr	ld_ir1_ix

	ldab	#6
	jsr	ldge_ir1_ir1_pb

	ldx	#LINE_7006
	jsr	jmpne_ir1_ix

LINE_7075

	; IF L=0 THEN

	ldx	#INTVAR_L
	jsr	ld_ir1_ix

	ldab	#0
	jsr	ldeq_ir1_ir1_pb

	ldx	#LINE_7006
	jsr	jmpne_ir1_ix

LINE_7080

	; GOTO 900

	ldx	#LINE_900
	jsr	goto_ix

LINE_8000

	; C=1

	ldx	#INTVAR_C
	ldab	#1
	jsr	ld_ix_pb

LINE_8010

	; FOR X=4 TO 49 STEP 15

	ldx	#INTVAR_X
	ldab	#4
	jsr	for_ix_pb

	ldab	#49
	jsr	to_ip_pb

	ldab	#15
	jsr	ld_ir1_pb

	jsr	step_ip_ir1

LINE_8020

	; FOR Y=15 TO 25 STEP 10

	ldx	#INTVAR_Y
	ldab	#15
	jsr	for_ix_pb

	ldab	#25
	jsr	to_ip_pb

	ldab	#10
	jsr	ld_ir1_pb

	jsr	step_ip_ir1

LINE_8030

	; SET(X,Y,C)

	ldx	#INTVAR_X
	jsr	ld_ir1_ix

	ldx	#INTVAR_Y
	jsr	ld_ir2_ix

	ldx	#INTVAR_C
	jsr	setc_ir1_ir2_ix

LINE_8031

	; SET(X+2,Y,C)

	ldx	#INTVAR_X
	jsr	ld_ir1_ix

	ldab	#2
	jsr	add_ir1_ir1_pb

	ldx	#INTVAR_Y
	jsr	ld_ir2_ix

	ldx	#INTVAR_C
	jsr	setc_ir1_ir2_ix

LINE_8032

	; SET(X+4,Y,C)

	ldx	#INTVAR_X
	jsr	ld_ir1_ix

	ldab	#4
	jsr	add_ir1_ir1_pb

	ldx	#INTVAR_Y
	jsr	ld_ir2_ix

	ldx	#INTVAR_C
	jsr	setc_ir1_ir2_ix

	; SET(X+6,Y,C)

	ldx	#INTVAR_X
	jsr	ld_ir1_ix

	ldab	#6
	jsr	add_ir1_ir1_pb

	ldx	#INTVAR_Y
	jsr	ld_ir2_ix

	ldx	#INTVAR_C
	jsr	setc_ir1_ir2_ix

LINE_8033

	; FOR M=X+1 TO X+5

	ldx	#INTVAR_X
	jsr	ld_ir1_ix

	ldab	#1
	jsr	add_ir1_ir1_pb

	ldx	#INTVAR_M
	jsr	for_ix_ir1

	ldx	#INTVAR_X
	jsr	ld_ir1_ix

	ldab	#5
	jsr	add_ir1_ir1_pb

	jsr	to_ip_ir1

	; SET(M,Y+1,C)

	ldx	#INTVAR_M
	jsr	ld_ir1_ix

	ldx	#INTVAR_Y
	jsr	ld_ir2_ix

	ldab	#1
	jsr	add_ir2_ir2_pb

	ldx	#INTVAR_C
	jsr	setc_ir1_ir2_ix

	; SET(M,Y+2,C)

	ldx	#INTVAR_M
	jsr	ld_ir1_ix

	ldx	#INTVAR_Y
	jsr	ld_ir2_ix

	ldab	#2
	jsr	add_ir2_ir2_pb

	ldx	#INTVAR_C
	jsr	setc_ir1_ir2_ix

	; NEXT M

	ldx	#INTVAR_M
	jsr	nextvar_ix

	jsr	next

LINE_8034

	; RESET(X+3,Y+2)

	ldx	#INTVAR_X
	jsr	ld_ir1_ix

	ldab	#3
	jsr	add_ir1_ir1_pb

	ldx	#INTVAR_Y
	jsr	ld_ir2_ix

	ldab	#2
	jsr	add_ir2_ir2_pb

	jsr	reset_ir1_ir2

LINE_8035

	; C+=1

	ldx	#INTVAR_C
	ldab	#1
	jsr	add_ix_ix_pb

LINE_8040

	; NEXT Y

	ldx	#INTVAR_Y
	jsr	nextvar_ix

	jsr	next

LINE_8050

	; NEXT X

	ldx	#INTVAR_X
	jsr	nextvar_ix

	jsr	next

LINE_8060

	; GOTO 922

	ldx	#LINE_922
	jsr	goto_ix

LINE_9999

	; REM CHAZBEENHAD@HOTMAIL.COM

LLAST

	; END

	jsr	progend

	.module	mdalloc
; alloc D bytes in array memory.
; then relink strings.
alloc
	std	tmp1
	ldx	strfree
	addd	strfree
	std	strfree
	ldd	strend
	addd	tmp1
	std	strend
	sts	tmp2
	subd	tmp2
	blo	_ok
	ldab	#OM_ERROR
	jmp	error
_ok
	lds	strfree
	des
_again
	dex
	dex
	ldd	,x
	pshb
	psha
	cpx	strbuf
	bhi	_again
	lds	tmp2
	ldx	strbuf
	ldd	strbuf
	addd	tmp1
	std	strbuf
	clra
_nxtz
	staa	,x
	inx
	cpx	strbuf
	blo	_nxtz
	ldx	strbuf
; relink permanent strings
; ENTRY:  X points to offending link word in strbuf
; EXIT:   X points to strend
strlink
	cpx	strend
	bhs	_rts
	stx	tmp1
	ldd	tmp1
	addd	#2
	ldx	,x
	std	1,x
	ldab	0,x
	ldx	1,x
	abx
	bra	strlink
_rts
	rts

	.module	mddivflt
; divide X by Y
;   ENTRY  X contains dividend in (0,x 1,x 2,x 3,x 4,x)
;                     scratch in  (5,x 6,x 7,x 8,x 9,x)
;          Y in 0+argv, 1+argv, 2+argv, 3+argv, 4+argv
;   EXIT   X/Y in (0,x 1,x 2,x 3,x 4,x)
;          uses tmp1,tmp1+1,tmp2,tmp2+1,tmp3,tmp3+1,tmp4
divflt
	clr	tmp4
	tst	0,x
	bpl	_posX
	com	tmp4
	neg	4,x
	ngc	3,x
	ngc	2,x
	ngc	1,x
	ngc	0,x
_posX
	tst	0+argv
	bpl	_posA
	com	tmp4
	neg	4+argv
	ngc	3+argv
	ngc	2+argv
	ngc	1+argv
	ngc	0+argv
divufl
_posA
	ldd	3,x
	std	6,x
	ldd	1,x
	std	4,x
	ldab	0,x
	stab	3,x
	ldd	#0
	std	8,x
	std	1,x
	stab	0,x
	ldaa	#41
	staa	tmp1
_nxtdiv
	ldd	3,x
	subd	3+argv
	std	tmp3
	ldd	1,x
	sbcb	2+argv
	sbca	1+argv
	std	tmp2
	ldab	0,x
	sbcb	0+argv
	stab	tmp1+1
	blo	_shift
	ldd	tmp3
	std	3,x
	ldd	tmp2
	std	1,x
	ldab	tmp1+1
	stab	0,x
_shift
	rol	9,x
	rol	8,x
	rol	7,x
	rol	6,x
	rol	5,x
	rol	4,x
	rol	3,x
	rol	2,x
	rol	1,x
	rol	0,x
	dec	tmp1
	bne	_nxtdiv
	tst	tmp4
	bne	_add1
	ldd	8,x
	coma
	comb
	std	3,x
	ldd	6,x
	coma
	comb
	std	1,x
	ldab	5,x
	comb
	stab	0,x
	rts
_add1
	ldd	8,x
	addd	#1
	std	3,x
	ldd	6,x
	adcb	#0
	adca	#0
	std	1,x
	ldab	5,x
	adcb	#0
	stab	0,x
	rts

	.module	mdgeteq
geteq
	beq	_1
	ldd	#0
	rts
_1
	ldd	#-1
	rts

	.module	mdgetge
getge
	bge	_1
	ldd	#0
	rts
_1
	ldd	#-1
	rts

	.module	mdmulint
mulint
	ldaa	2+argv
	ldab	2,x
	mul
	std	tmp2
	ldaa	1+argv
	ldab	1,x
	mul
	stab	tmp1+1
	ldaa	2+argv
	ldab	1,x
	mul
	addb	tmp2
	adca	tmp1+1
	std	tmp1+1
	ldaa	1+argv
	ldab	2,x
	mul
	addb	tmp2
	adca	tmp1+1
	std	tmp1+1
	ldaa	2+argv
	ldab	0,x
	mul
	addb	tmp1+1
	stab	tmp1+1
	ldaa	0+argv
	ldab	2,x
	mul
	addb	tmp1+1
	stab	tmp1+1
	rts
mulintx
	bsr	mulint
	ldab	tmp1+1
	stab	0,x
	ldd	tmp2
	std	1,x
	rts

	.module	mdprat
prat
	bita	#$FE
	bne	_fcerror
	anda	#$01
	oraa	#$40
	std	M_CRSR
	rts
_fcerror
	ldab	#FC_ERROR
	jmp	error

	.module	mdprint
print
_loop
	ldaa	,x
	jsr	R_PUTC
	inx
	decb
	bne	_loop
	rts

	.module	mdrnd
rnd
	ldab	tmp1+1
	bpl	gornd
	orab	#1
	pshb
	ldaa	tmp2
	mul
	std	rvseed
	ldaa	tmp2+1
	pulb
	mul
	addd	rvseed
	std	rvseed
gornd
	ldaa	rvseed
	ldab	#-2
	mul
	std	tmp3
	ldaa	rvseed+1
	ldab	#-2
	mul
	addb	#-2
	adca	tmp3+1
	sbcb	tmp3
	sbca	#0
	adcb	#0
	adca	#0
	std	rvseed
	rts
irnd
	bsr	rnd
	ldaa	tmp2+1
	ldab	rvseed+1
	mul
	staa	tmp3+1
	ldaa	tmp2+1
	ldab	rvseed
	mul
	addb	tmp3+1
	adca	#0
	std	tmp3
	ldaa	tmp2
	ldab	rvseed+1
	mul
	addd	tmp3
	staa	tmp3+1
	ldaa	#0
	adca	#0
	staa	tmp3
	ldaa	tmp2
	ldab	rvseed
	mul
	addd	tmp3
	std	tmp3
	ldaa	#0
	adca	#0
	staa	tmp1
	ldaa	tmp1+1
	beq	_done
	ldab	rvseed+1
	mul
	addb	tmp3
	stab	tmp3
	adca	tmp1
	staa	tmp1
	ldaa	tmp1+1
	ldab	rvseed
	mul
	addb	tmp1
	stab	tmp1
_done
	ldd	tmp3
	addd	#1
	bcc	_rts
	inc	tmp1
_rts
	rts

	.module	mdset
; set pixel with existing color
; ENTRY: ACCA holds X, ACCB holds Y
set
	bsr	getxym
	ldab	,x
	bmi	doset
	clrb
doset
	andb	#$70
	ldaa	$82
	psha
	stab	$82
	jsr	R_SETPX
	pula
	staa	$82
	rts
getxym
	anda	#$1f
	andb	#$3f
	pshb
	tab
	jmp	R_MSKPX

	.module	mdsetc
; set pixel with color
; ENTRY: X holds byte-to-modify, ACCB holds color
setc
	decb
	bmi	_loadc
	lslb
	lslb
	lslb
	lslb
	bra	_ok
_loadc
	ldab	,x
	bmi	_ok
	clrb
_ok
	bra	doset

	.module	mdstrdel
; remove a permanent string
; then re-link trailing strings
strdel
	ldd	1,x
	subd	strbuf
	blo	_rts
	ldd	1,x
	subd	strend
	bhs	_rts
	ldd	strend
	subd	#2
	subb	0,x
	sbca	#0
	std	strend
	ldab	0,x
	ldx	1,x
	dex
	dex
	stx	tmp1
	abx
	inx
	inx
	sts	tmp2
	txs
	ldx	tmp1
_nxtwrd
	pula
	pulb
	std	,x
	inx
	inx
	cpx	strend
	blo	_nxtwrd
	lds	tmp2
	ldx	tmp1
	jmp	strlink
_rts
	rts

	.module	mdstreqs
; compare string against stack
; ENTRY: top of stack is return to caller (ld<ne/eq>_ir1_sr1_ss)
;        next two bytes address of string length+payload
; EXIT:  we modify those two bytes to point to code beyond payload so caller can just RTS
;        we return correct Z flag for caller
streqs
	sts	tmp3
	tsx
	ldx	2,x
	ldab	,x
	cmpb	tmp1+1
	bne	_ne
	tstb
	beq	_eq
	tsx
	ldx	2,x
	inx
	txs
	ldx	tmp2
_nxtchr
	pula
	cmpa	,x
	bne	_ne
	inx
	decb
	bne	_nxtchr
_eq
	lds	tmp3
	bsr	_fudge
	clra
	rts
_ne
	lds	tmp3
	bsr	_fudge
	rts
_fudge
	tsx
	ldd	4,x
	ldx	4,x
	sec
	adcb	,x
	adca	#0
	tsx
	std	4,x
	rts

	.module	mdstrflt
strflt
	pshx
	tst	tmp1+1
	bmi	_neg
	ldab	' '
	bra	_wdigs
_neg
	neg	tmp3+1
	ngc	tmp3
	ngc	tmp2+1
	ngc	tmp2
	ngc	tmp1+1
	ldab	'-'
_wdigs
	ldx	tmp3
	pshx
	ldx	strfree
	stab	,x
	clr	tmp1
_nxtwdig
	inc	tmp1
	lsr	tmp1+1
	ror	tmp2
	ror	tmp2+1
	ror	tmp3
	ldaa	tmp1+1
	adda	tmp2
	adca	tmp2+1
	adca	#0
	adca	#0
	tab
	lsra
	lsra
	lsra
	lsra
	andb	#$0F
	aba
_dec
	suba	#5
	bhs	_dec
	adda	#5
	staa	tmp3+1
	lsl	tmp3
	rola
	adda	#'0'
	psha
	ldd	tmp2
	subb	tmp3+1
	sbca	#0
	std	tmp2
	ldab	tmp1+1
	sbcb	#0
	stab	tmp1+1
	pshb
	ldd	tmp2
	psha
	ldaa	#$CC
	mul
	std	tmp3
	addd	tmp2
	std	tmp2
	ldab	tmp1+1
	adcb	tmp3+1
	stab	tmp1+1
	ldd	tmp1+1
	addd	tmp3
	std	tmp1+1
	pulb
	ldaa	#$CC
	mul
	stab	tmp3+1
	addd	tmp1+1
	std	tmp1+1
	pulb
	ldaa	#$CC
	mul
	addb	tmp1+1
	addb	tmp3+1
	stab	tmp1+1
	bne	_nxtwdig
	ldd	tmp2
	bne	_nxtwdig
	ldab	tmp1
_nxtc
	pula
	inx
	staa	,x
	decb
	bne	_nxtc
	inx
	inc	tmp1
	pula
	pulb
	subd	#0
	bne	_fdo
	jmp	_fdone
_fdo
	std	tmp2
	ldab	#'.'
	stab	,x
	inc	tmp1
	inx
	ldd	#6
	staa	tmp1+1
	stab	tmp3
_nxtf
	ldd	tmp2
	lsl	tmp2+1
	rol	tmp2
	rol	tmp1+1
	lsl	tmp2+1
	rol	tmp2
	rol	tmp1+1
	addd	tmp2
	std	tmp2
	ldab	tmp1+1
	adcb	#0
	stab	tmp1+1
	lsl	tmp2+1
	rol	tmp2
	rol	tmp1+1
	ldd	tmp1
	addb	#'0'
	stab	,x
	inx
	inc	tmp1
	clrb
	stab	tmp1+1
	dec	tmp3
	bne	_nxtf
	tst	tmp2
	bmi	_nxtrnd
_nxtzero
	dex
	dec	tmp1
	ldaa	,x
	cmpa	#'0'
	beq	_nxtzero
	bra	_zdone
_nxtrnd
	dex
	dec	tmp1
	ldaa	,x
	cmpa	#'.'
	beq	_dot
	inca
	cmpa	#'9'
	bhi	_nxtrnd
	bra	_rdone
_dot
	ldaa	#'0'
	staa	,x
	ldab	tmp1
_ndot
	decb
	beq	_dzero
	dex
	ldaa	,x
	inca
	cmpa	#'9'
	bls	_ddone
	bra	_ndot
_ddone
	staa	,x
	ldx	strfree
	ldab	tmp1
	abx
	bra	_fdone
_dzero
	ldaa	#'1'
	staa	,x
	ldx	strfree
	ldab	tmp1
	abx
	ldaa	#'0'
_rdone
	staa	,x
_zdone
	inx
	inc	tmp1
_fdone
	ldd	strfree
	stx	strfree
	pulx
	rts

	.module	mdstrprm
; make a permanent string
; ENTRY: argv -  input string descriptor
;          X  - output string descriptor
strprm
	stx	tmp1
	ldab	0+argv
	beq	_null
	decb
	beq	_char
	ldx	1+argv
	cpx	#M_LBUF
	blo	_const
	cpx	#M_MSTR
	blo	_trans
	cpx	strbuf
	blo	_const
_trans
	ldx	tmp1
	ldab	0,x
	ldx	1,x
	cpx	strbuf
	blo	_nalloc
	cmpb	0+argv
	beq	_copyip
_nalloc
	cpx	1+argv
	bhs	_notmp
	ldx	1+argv
	cpx	strend
	bhs	_notmp
	ldx	strend
	inx
	inx
	stx	strfree
	bsr	_copy
	ldd	strfree
	std	1+argv
_notmp
	ldx	tmp1
	pshx
	jsr	strdel
	pulx
	stx	tmp1
	ldx	strend
	ldd	tmp1
	std	,x
	inx
	inx
	stx	strfree
	cpx	argv+1
	beq	_nocopy
	bsr	_copy
	bra	_ready
_nocopy
	ldab	0+argv
	abx
_ready
	stx	strend
	ldd	strfree
	inx
	inx
	stx	strfree
	ldx	tmp1
	std	1,x
	ldab	0+argv
	stab	0,x
	rts
_char
	ldaa	#1
	ldx	1+argv
	ldab	,x
_null
	ldaa	#1
	std	1+argv
_const
	ldx	tmp1
	pshx
	jsr	strdel
	pulx
	ldab	0+argv
	stab	0,x
	ldd	1+argv
	std	1,x
	rts
_copyip
	dex
	dex
	ldd	tmp1
	std	,x
	inx
	inx
_copy
	sts	tmp2
	ldab	0+argv
	lds	1+argv
	des
_nxtchr
	pula
	staa	,x
	inx
	decb
	bne	_nxtchr
	lds	tmp2
	rts

	.module	mdstrrel
; release a temporary string
; ENTRY: X holds string start
; EXIT:  X holds new end of string space
strrel
	cpx	strend
	bls	_rts
	cpx	strstop
	bhs	_rts
	stx	strfree
_rts
	rts

	.module	mdstrtmp
; make a temporary clone of a string
; ENTRY: X holds string start
;        B holds string length
; EXIT:  D holds new string pointer
strtmp
	tstb
	beq	_null
	sts	tmp1
	txs
	ldx	strfree
_nxtcp
	pula
	staa	,x
	inx
	decb
	bne	_nxtcp
	lds	tmp1
	ldd	strfree
	stx	strfree
	rts
_null
	ldd	strfree
	rts

	.module	mdtonat
; push for-loop record on stack
; ENTRY:  ACCB  contains size of record
;         r1    contains stopping variable and is always float.
;         r1+3  must contain zero if an integer.
to
	clra
	std	tmp3
	pulx
	stx	tmp1
	tsx
	clrb
_nxtfor
	abx
	ldd	1,x
	subd	letptr
	beq	_oldfor
	ldab	,x
	cmpb	#3
	bhi	_nxtfor
	sts	tmp2
	ldd	tmp2
	subd	tmp3
	std	tmp2
	lds	tmp2
	tsx
	ldab	tmp3+1
	stab	0,x
	ldd	letptr
	std	1,x
_oldfor
	ldd	tmp1
	std	3,x
	ldab	r1
	stab	5,x
	ldd	r1+1
	std	6,x
	ldd	r1+3
	std	8,x
	ldab	tmp3+1
	cmpb	#15
	beq	_flt
	inca
	staa	10,x
	bra	_done
_flt
	ldd	#0
	std	10,x
	std	13,x
	inca
	staa	12,x
_done
	ldx	tmp1
	jmp	,x

add_ir1_ir1_ix			; numCalls = 1
	.module	modadd_ir1_ir1_ix
	ldd	r1+1
	addd	1,x
	std	r1+1
	ldab	r1
	adcb	0,x
	stab	r1
	rts

add_ir1_ir1_pb			; numCalls = 6
	.module	modadd_ir1_ir1_pb
	clra
	addd	r1+1
	std	r1+1
	ldab	#0
	adcb	r1
	stab	r1
	rts

add_ir2_ir2_pb			; numCalls = 4
	.module	modadd_ir2_ir2_pb
	clra
	addd	r2+1
	std	r2+1
	ldab	#0
	adcb	r2
	stab	r2
	rts

add_ix_ix_pb			; numCalls = 14
	.module	modadd_ix_ix_pb
	clra
	addd	1,x
	std	1,x
	ldab	#0
	adcb	0,x
	stab	0,x
	rts

and_ir1_ir1_ir2			; numCalls = 8
	.module	modand_ir1_ir1_ir2
	ldd	r2+1
	andb	r1+2
	anda	r1+1
	std	r1+1
	ldab	r2
	andb	r1
	stab	r1
	rts

chr_sr1_ir1			; numCalls = 1
	.module	modchr_sr1_ir1
	ldd	#$0101
	std	r1
	rts

chr_sr2_ir2			; numCalls = 1
	.module	modchr_sr2_ir2
	ldd	#$0101
	std	r2
	rts

clear			; numCalls = 1
	.module	modclear
	clra
	ldx	#bss
	bra	_start
_again
	staa	,x
	inx
_start
	cpx	#bes
	bne	_again
	stx	strbuf
	stx	strend
	inx
	inx
	stx	strfree
	ldx	#$8FFF
	stx	strstop
	ldx	#startdata
	stx	dataptr
	rts

cls			; numCalls = 4
	.module	modcls
	jmp	R_CLS

clsn_ir1			; numCalls = 1
	.module	modclsn_ir1
	ldd	r1
	bne	_fcerror
	ldab	r1+2
	jmp	R_CLSN
_fcerror
	ldab	#FC_ERROR
	jmp	error

clsn_pb			; numCalls = 10
	.module	modclsn_pb
	jmp	R_CLSN

for_ix_ir1			; numCalls = 1
	.module	modfor_ix_ir1
	stx	letptr
	ldd	r1+1
	std	1,x
	ldab	r1
	stab	0,x
	rts

for_ix_pb			; numCalls = 87
	.module	modfor_ix_pb
	stx	letptr
	clra
	staa	0,x
	std	1,x
	rts

gosub_ix			; numCalls = 34
	.module	modgosub_ix
	ldab	#3
	pshb
	jmp	,x

goto_ix			; numCalls = 19
	.module	modgoto_ix
	ins
	ins
	jmp	,x

inkey_sr1			; numCalls = 1
	.module	modinkey_sr1
	ldd	#$0101
	std	r1
	ldaa	M_IKEY
	bne	_gotkey
	jsr	R_KEYIN
_gotkey
	clr	M_IKEY
	staa	r1+2
	bne	_rts
	staa	r1
_rts
	rts

irnd_ir1_pb			; numCalls = 6
	.module	modirnd_ir1_pb
	clra
	staa	tmp1+1
	std	tmp2
	jsr	irnd
	std	r1+1
	ldab	tmp1
	stab	r1
	rts

jmpeq_ir1_ix			; numCalls = 25
	.module	modjmpeq_ir1_ix
	ldd	r1+1
	bne	_rts
	ldaa	r1
	bne	_rts
	ins
	ins
	jmp	,x
_rts
	rts

jmpne_ir1_ix			; numCalls = 29
	.module	modjmpne_ir1_ix
	ldd	r1+1
	bne	_go
	ldaa	r1
	bne	_go
	rts
_go
	ins
	ins
	jmp	,x

ld_ir1_ix			; numCalls = 95
	.module	modld_ir1_ix
	ldd	1,x
	std	r1+1
	ldab	0,x
	stab	r1
	rts

ld_ir1_pb			; numCalls = 39
	.module	modld_ir1_pb
	stab	r1+2
	ldd	#0
	std	r1
	rts

ld_ir2_ix			; numCalls = 31
	.module	modld_ir2_ix
	ldd	1,x
	std	r2+1
	ldab	0,x
	stab	r2
	rts

ld_ir2_pb			; numCalls = 37
	.module	modld_ir2_pb
	stab	r2+2
	ldd	#0
	std	r2
	rts

ld_ix_ir1			; numCalls = 5
	.module	modld_ix_ir1
	ldd	r1+1
	std	1,x
	ldab	r1
	stab	0,x
	rts

ld_ix_pb			; numCalls = 10
	.module	modld_ix_pb
	stab	2,x
	ldd	#0
	std	0,x
	rts

ld_ix_pw			; numCalls = 8
	.module	modld_ix_pw
	std	1,x
	ldab	#0
	stab	0,x
	rts

ld_sr1_ss			; numCalls = 2
	.module	modld_sr1_ss
	pulx
	ldab	,x
	stab	r1
	inx
	stx	r1+1
	abx
	jmp	,x

ld_sr1_sx			; numCalls = 5
	.module	modld_sr1_sx
	ldd	1,x
	std	r1+1
	ldab	0,x
	stab	r1
	rts

ld_sx_sr1			; numCalls = 15
	.module	modld_sx_sr1
	ldab	r1
	stab	0+argv
	ldd	r1+1
	std	1+argv
	jmp	strprm

ldeq_ir1_ir1_pb			; numCalls = 49
	.module	modldeq_ir1_ir1_pb
	cmpb	r1+2
	bne	_done
	ldd	r1
_done
	jsr	geteq
	std	r1+1
	stab	r1
	rts

ldeq_ir1_sr1_ss			; numCalls = 1
	.module	modldeq_ir1_sr1_ss
	ldab	r1
	stab	tmp1+1
	ldd	r1+1
	std	tmp2
	jsr	streqs
	jsr	geteq
	std	r1+1
	stab	r1
	rts

ldge_ir1_ir1_ix			; numCalls = 2
	.module	modldge_ir1_ir1_ix
	ldd	r1+1
	subd	1,x
	ldab	r1
	sbcb	0,x
	jsr	getge
	std	r1+1
	stab	r1
	rts

ldge_ir1_ir1_pb			; numCalls = 2
	.module	modldge_ir1_ir1_pb
	clra
	std	tmp1
	ldd	r1+1
	subd	tmp1
	ldab	r1
	sbcb	#0
	jsr	getge
	std	r1+1
	stab	r1
	rts

ldge_ir2_ir2_ix			; numCalls = 8
	.module	modldge_ir2_ir2_ix
	ldd	r2+1
	subd	1,x
	ldab	r2
	sbcb	0,x
	jsr	getge
	std	r2+1
	stab	r2
	rts

mul_ir1_ir1_ix			; numCalls = 1
	.module	modmul_ir1_ir1_ix
	ldab	0,x
	stab	0+argv
	ldd	1,x
	std	1+argv
	ldx	#r1
	jmp	mulintx

mul_ir2_ir2_ix			; numCalls = 1
	.module	modmul_ir2_ir2_ix
	ldab	0,x
	stab	0+argv
	ldd	1,x
	std	1+argv
	ldx	#r2
	jmp	mulintx

next			; numCalls = 88
	.module	modnext
	pulx
	stx	tmp1
	tsx
	ldab	,x
	cmpb	#3
	bhi	_ok
	ldab	#NF_ERROR
	jmp	error
_ok
	cmpb	#11
	bne	_flt
	ldd	9,x
	std	r1+1
	ldab	8,x
	stab	r1
	ldx	1,x
	ldd	r1+1
	addd	1,x
	std	r1+1
	std	1,x
	ldab	r1
	adcb	,x
	stab	r1
	stab	,x
	tsx
	tst	8,x
	bpl	_iopp
	ldd	r1+1
	subd	6,x
	ldab	r1
	sbcb	5,x
	blt	_idone
	ldx	3,x
	jmp	,x
_iopp
	ldd	6,x
	subd	r1+1
	ldab	5,x
	sbcb	r1
	blt	_idone
	ldx	3,x
	jmp	,x
_idone
	ldab	#11
	bra	_done
_flt
	ldd	13,x
	std	r1+3
	ldd	11,x
	std	r1+1
	ldab	10,x
	stab	r1
	ldx	1,x
	ldd	r1+3
	addd	3,x
	std	r1+3
	std	3,x
	ldd	1,x
	adcb	r1+2
	adca	r1+1
	std	r1+1
	std	1,x
	ldab	r1
	adcb	,x
	stab	r1
	stab	,x
	tsx
	tst	10,x
	bpl	_fopp
	ldd	r1+3
	subd	8,x
	ldd	r1+1
	sbcb	7,x
	sbca	6,x
	ldab	r1
	sbcb	5,x
	blt	_fdone
	ldx	3,x
	jmp	,x
_fopp
	ldd	8,x
	subd	r1+3
	ldd	6,x
	sbcb	r1+2
	sbca	r1+1
	ldab	5,x
	sbcb	r1
	blt	_fdone
	ldx	3,x
	jmp	,x
_fdone
	ldab	#15
_done
	abx
	txs
	ldx	tmp1
	jmp	,x

nextvar_ix			; numCalls = 50
	.module	modnextvar_ix
	stx	letptr
	pulx
	stx	tmp1
	tsx
	clrb
_nxtvar
	abx
	ldd	1,x
	subd	letptr
	beq	_ok
	ldab	,x
	cmpb	#3
	bhi	_nxtvar
_ok
	txs
	ldx	tmp1
	jmp	,x

pr_sr1			; numCalls = 10
	.module	modpr_sr1
	ldab	r1
	beq	_rts
	ldx	r1+1
	jsr	print
	ldx	r1+1
	jmp	strrel
_rts
	rts

pr_ss			; numCalls = 101
	.module	modpr_ss
	pulx
	ldab	,x
	beq	_null
	inx
	jsr	print
	jmp	,x
_null
	jmp	1,x

pr_sx			; numCalls = 2
	.module	modpr_sx
	ldab	0,x
	beq	_rts
	ldx	1,x
	jsr	print
_rts
	rts

prat_ix			; numCalls = 2
	.module	modprat_ix
	ldaa	0,x
	bne	_fcerror
	ldd	1,x
	jmp	prat
_fcerror
	ldab	#FC_ERROR
	jmp	error

prat_pb			; numCalls = 26
	.module	modprat_pb
	ldaa	#$40
	std	M_CRSR
	rts

prat_pw			; numCalls = 18
	.module	modprat_pw
	jmp	prat

progbegin			; numCalls = 1
	.module	modprogbegin
	ldx	R_MCXID
	cpx	#'h'*256+'C'
	bne	_mcbasic
	pulx
	clrb
	pshb
	pshb
	pshb
	jmp	,x
_reqmsg	.text	"?MICROCOLOR BASIC ROM REQUIRED"
_mcbasic
	ldx	#_reqmsg
	ldab	#30
	jsr	print
	pulx
	rts

progend			; numCalls = 2
	.module	modprogend
	pulx
	pula
	pula
	pula
	jsr	R_RESET
	jmp	R_DMODE
NF_ERROR	.equ	0
RG_ERROR	.equ	4
OD_ERROR	.equ	6
FC_ERROR	.equ	8
OM_ERROR	.equ	12
BS_ERROR	.equ	16
DD_ERROR	.equ	18
error
	jmp	R_ERROR

reset_ir1_ir2			; numCalls = 1
	.module	modreset_ir1_ir2
	ldaa	r2+2
	ldab	r1+2
	jsr	getxym
	jmp	R_CLRPX

reset_ir1_pb			; numCalls = 13
	.module	modreset_ir1_pb
	tba
	ldab	r1+2
	jsr	getxym
	jmp	R_CLRPX

return			; numCalls = 12
	.module	modreturn
	pulx
	tsx
	clrb
_nxt
	abx
	ldab	,x
	bne	_ok
	ldab	#RG_ERROR
	jmp	error
_ok
	cmpb	#3
	bne	_nxt
	inx
	txs
	rts

setc_ir1_ir2_ix			; numCalls = 6
	.module	modsetc_ir1_ir2_ix
	ldab	2,x
	pshb
	ldaa	r2+2
	ldab	r1+2
	jsr	getxym
	pulb
	jmp	setc

setc_ir1_ir2_pb			; numCalls = 44
	.module	modsetc_ir1_ir2_pb
	pshb
	ldaa	r2+2
	ldab	r1+2
	jsr	getxym
	pulb
	jmp	setc

sound_ir1_ir2			; numCalls = 8
	.module	modsound_ir1_ir2
	ldaa	r1+2
	ldab	r2+2
	jmp	R_SOUND

step_ip_ir1			; numCalls = 6
	.module	modstep_ip_ir1
	tsx
	ldab	r1
	stab	10,x
	ldd	r1+1
	std	11,x
	ldd	,x
	std	5,x
	rts

str_sr1_ix			; numCalls = 10
	.module	modstr_sr1_ix
	ldd	1,x
	std	tmp2
	ldab	0,x
	stab	tmp1+1
	ldd	#0
	std	tmp3
	jsr	strflt
	std	r1+1
	ldab	tmp1
	stab	r1
	rts

strcat_sr1_sr1_sr2			; numCalls = 1
	.module	modstrcat_sr1_sr1_sr2
	ldab	r2
	addb	r1
	stab	r1
	ldab	r2
	ldx	r2+1
	jmp	strtmp

strcat_sr1_sr1_ss			; numCalls = 1
	.module	modstrcat_sr1_sr1_ss
	tsx
	ldx	,x
	ldab	,x
	addb	r1
	stab	r1
	ldab	,x
	inx
	jsr	strtmp
	pulx
	ldab	,x
	abx
	jmp	1,x

strcat_sr1_sr1_sx			; numCalls = 5
	.module	modstrcat_sr1_sr1_sx
	ldab	0,x
	addb	r1
	stab	r1
	ldab	0,x
	ldx	1,x
	jmp	strtmp

strinit_sr1_sx			; numCalls = 7
	.module	modstrinit_sr1_sx
	ldab	0,x
	stab	r1
	ldx	1,x
	jsr	strtmp
	std	r1+1
	rts

sub_ir1_ir1_pb			; numCalls = 1
	.module	modsub_ir1_ir1_pb
	stab	tmp1
	ldd	r1+1
	subb	tmp1
	sbca	#0
	std	r1+1
	ldab	r1
	sbcb	#0
	stab	r1
	rts

sub_ix_ix_pb			; numCalls = 3
	.module	modsub_ix_ix_pb
	stab	tmp1
	ldd	1,x
	subb	tmp1
	sbca	#0
	std	1,x
	ldab	0,x
	sbcb	#0
	stab	0,x
	rts

to_ip_ir1			; numCalls = 1
	.module	modto_ip_ir1
	ldd	#0
	std	r1+3
	ldab	#11
	jmp	to

to_ip_pb			; numCalls = 63
	.module	modto_ip_pb
	stab	r1+2
	ldd	#0
	std	r1
	std	r1+3
	ldab	#11
	jmp	to

to_ip_pw			; numCalls = 24
	.module	modto_ip_pw
	std	r1+1
	ldd	#0
	stab	r1
	std	r1+3
	ldab	#11
	jmp	to

; data table
startdata
enddata

symstart

; block started by symbol
bss

; Numeric Variables
INTVAR_C	.block	3
INTVAR_D	.block	3
INTVAR_E	.block	3
INTVAR_I	.block	3
INTVAR_L	.block	3
INTVAR_M	.block	3
INTVAR_P	.block	3
INTVAR_R	.block	3
INTVAR_SC	.block	3
INTVAR_T	.block	3
INTVAR_X	.block	3
INTVAR_XX	.block	3
INTVAR_Y	.block	3
; String Variables
STRVAR_B	.block	3
STRVAR_C	.block	3
STRVAR_Q	.block	3
; Numeric Arrays
; String Arrays

; block ended by symbol
bes
	.end
