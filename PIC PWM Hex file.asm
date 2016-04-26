; original File = Z:\home\ajay\Desktop\hex\PIC PWM Hex file.hex

    processor 16F887
    #include <P16F887.INC>
    __config _CONFIG1, 0x2F4A
;   _DEBUG_OFF & _LVP_OFF & _FCMEN_ON & __IESO_ON & _BOR_ON & _CPD_ON & _CP_OFF & _MCLRE_OFF 
;   & _PWRTE_ON & _WDT_ON & _HS_OSC 

; RAM-Variable
LRAM_0x20 equ 0x20
LRAM_0x21 equ 0x21
LRAM_0x22 equ 0x22
LRAM_0x23 equ 0x23
LRAM_0x24 equ 0x24
LRAM_0x70 equ 0x70
LRAM_0x71 equ 0x71
LRAM_0x72 equ 0x72
LRAM_0x73 equ 0x73
LRAM_0x74 equ 0x74
LRAM_0x75 equ 0x75
LRAM_0x78 equ 0x78
LRAM_0x79 equ 0x79
LRAM_0x7A equ 0x7A
LRAM_0x7B equ 0x7B
LRAM_0x7C equ 0x7C
LRAM_0x7D equ 0x7D

; Program

    Org 0x0000

;   Reset-Vector
LADR_0x0000
    GOTO LADR_0x008D
    NOP
    NOP
    NOP
;   Interrupt-Vector
    GOTO LADR_0x0000
LADR_0x0005
    BCF STATUS,RP0       ; !!Bank Register-Bank(0/1)-Select
    BCF STATUS,RP1       ; !!Bank Register-Bank(2/3)-Select
    MOVF LRAM_0x21,W
    MOVWF PCLATH         ; !!Bank Program-Page-Select
    MOVF LRAM_0x20,W
    MOVWF PCL            ; !!Program-Counter-Modification
    RETURN
LADR_0x000C
    BCF STATUS,RP0       ; !!Bank Register-Bank(0/1)-Select
    BCF STATUS,RP1       ; !!Bank Register-Bank(2/3)-Select
    CLRF LRAM_0x7B
    CLRF LRAM_0x7A
    CLRF LRAM_0x79
    MOVLW 0x80           ;   b'10000000'  d'128'
    MOVWF LRAM_0x78
LADR_0x0013
    RRF LRAM_0x71,F
    RRF LRAM_0x70,F
    BTFSS STATUS,C
    GOTO LADR_0x0020
    MOVF LRAM_0x74,W
    ADDWF LRAM_0x79,F
    MOVF LRAM_0x75,W
    BTFSC STATUS,C
    INCFSZ LRAM_0x75,W
    ADDWF LRAM_0x7A,F
    BTFSC STATUS,C
    INCF LRAM_0x7B,F
    BCF STATUS,C
LADR_0x0020
    BTFSS LRAM_0x70,7
    GOTO LADR_0x0028
    MOVF LRAM_0x74,W
    ADDWF LRAM_0x7A,F
    MOVF LRAM_0x75,W
    BTFSC STATUS,C
    INCFSZ LRAM_0x75,W
    ADDWF LRAM_0x7B,F
LADR_0x0028
    RRF LRAM_0x7B,F
    RRF LRAM_0x7A,F
    RRF LRAM_0x79,F
    RRF LRAM_0x78,F
    BTFSS STATUS,C
    GOTO LADR_0x0013
    MOVF LRAM_0x7B,W
    MOVWF LRAM_0x73
    MOVF LRAM_0x7A,W
    MOVWF LRAM_0x72
    MOVF LRAM_0x79,W
    MOVWF LRAM_0x71
    MOVF LRAM_0x78,W
    MOVWF LRAM_0x70
    RETURN
LADR_0x0037
    BSF STATUS,RP0       ; !!Bank Register-Bank(0/1)-Select
    BCF STATUS,RP1       ; !!Bank Register-Bank(2/3)-Select
    BCF PORTC,2          ; !!Bank!! PORTC - TRISC - CM1CON0 - BAUDCTL
    BCF STATUS,RP0       ; !!Bank Register-Bank(0/1)-Select
    BSF T2CON,2          ; !!Bank!! T2CON - PR2 - RAM - RAM
    MOVLW 0x0C           ;   b'00001100'  d'012'
    IORWF CCP1CON,F      ; !!Bank!! CCP1CON - VRCON - RAM - RAM
    RETURN
LADR_0x003F
    BSF STATUS,RP0       ; !!Bank Register-Bank(0/1)-Select
    BCF STATUS,RP1       ; !!Bank Register-Bank(2/3)-Select
    MOVF T2CON,W         ; !!Bank!! T2CON - PR2 - RAM - RAM
    ADDLW 0x01           ;   b'00000001'  d'001'
    MOVWF LRAM_0x70
    CLRF LRAM_0x71
    BTFSC STATUS,C
    INCF LRAM_0x71,F
    BCF STATUS,RP0       ; !!Bank Register-Bank(0/1)-Select
    MOVF LRAM_0x24,W
    MOVWF LRAM_0x74
    CLRF LRAM_0x75
    CALL LADR_0x000C
    MOVLW 0x06           ;   b'00000110'  d'006'
    MOVWF LRAM_0x72
    MOVF LRAM_0x70,W
    MOVWF LRAM_0x74
    MOVF LRAM_0x71,W
    MOVWF LRAM_0x75
    MOVF LRAM_0x72,W
LADR_0x0053
    BTFSC STATUS,Z
    GOTO LADR_0x005A
    RRF LRAM_0x75,F
    RRF LRAM_0x74,F
    BCF LRAM_0x75,7
    ADDLW 0xFF           ;   b'11111111'  d'255'
    GOTO LADR_0x0053
LADR_0x005A
    MOVLW 0x04           ;   b'00000100'  d'004'
    MOVWF LRAM_0x71
    MOVF LRAM_0x74,W
    MOVWF LRAM_0x70
    MOVF LRAM_0x71,W
LADR_0x005F
    BTFSC STATUS,Z
    GOTO LADR_0x0065
    RLF LRAM_0x70,F
    BCF LRAM_0x70,0
    ADDLW 0xFF           ;   b'11111111'  d'255'
    GOTO LADR_0x005F
LADR_0x0065
    BCF STATUS,RP0       ; !!Bank Register-Bank(0/1)-Select
    BCF STATUS,RP1       ; !!Bank Register-Bank(2/3)-Select
    MOVLW 0x30           ;   b'00110000'  d'048'  "0"
    ANDWF LRAM_0x70,W
    MOVWF LRAM_0x73
    MOVF LRAM_0x74,W
    MOVWF LRAM_0x70
    MOVF LRAM_0x75,W
    MOVWF LRAM_0x71
    RRF LRAM_0x71,F
    RRF LRAM_0x70,F
    BCF LRAM_0x71,7
    RRF LRAM_0x71,F
    RRF LRAM_0x70,F
    BCF LRAM_0x71,7
    MOVF LRAM_0x70,W
    MOVWF CCPR1L         ; !!Bank!! CCPR1L - WPUB - RAM - RAM
    MOVLW 0x0F           ;   b'00001111'  d'015'
    ANDWF CCP1CON,F      ; !!Bank!! CCP1CON - VRCON - RAM - RAM
    MOVF LRAM_0x73,W
    IORWF CCP1CON,F      ; !!Bank!! CCP1CON - VRCON - RAM - RAM
    RETURN
LADR_0x007B
    CALL LADR_0x0005
    BCF PCLATH,3         ; !!Bank Program-Page-Select
    BCF PCLATH,4         ; !!Bank Program-Page-Select
    MOVWF INDF
    INCF FSR,F
    INCF LRAM_0x20,F
    BTFSC STATUS,Z
    INCF LRAM_0x21,F
    DECF LRAM_0x70,F
    BTFSS STATUS,Z
    GOTO LADR_0x007B
    RETURN
LADR_0x0087
    BCF STATUS,RP0       ; !!Bank Register-Bank(0/1)-Select
    BCF STATUS,RP1       ; !!Bank Register-Bank(2/3)-Select
    CLRF CCPR1L          ; !!Bank!! CCPR1L - WPUB - RAM - RAM
    BCF CCP1CON,4        ; !!Bank!! CCP1CON - VRCON - RAM - RAM
    BCF CCP1CON,5        ; !!Bank!! CCP1CON - VRCON - RAM - RAM
    RETURN
LADR_0x008D
    MOVLW 0x10           ;   b'00010000'  d'016'
    BCF STATUS,RP0       ; !!Bank Register-Bank(0/1)-Select
    BCF STATUS,RP1       ; !!Bank Register-Bank(2/3)-Select
    MOVWF LRAM_0x22
    MOVLW 0x10           ;   b'00010000'  d'016'
    MOVWF LRAM_0x23
    MOVLW 0xFF           ;   b'11111111'  d'255'
    BSF STATUS,RP0       ; !!Bank Register-Bank(0/1)-Select
    MOVWF PORTD          ; !!Bank!! PORTD - TRISD - CM2CON0 - ANSEL
    CLRF PORTC           ; !!Bank!! PORTC - TRISC - CM1CON0 - BAUDCTL
    BCF STATUS,RP0       ; !!Bank Register-Bank(0/1)-Select
    BSF T2CON,0          ; !!Bank!! T2CON - PR2 - RAM - RAM
    BCF T2CON,1          ; !!Bank!! T2CON - PR2 - RAM - RAM
    MOVLW 0x7C           ;   b'01111100'  d'124'  "|"
    BSF STATUS,RP0       ; !!Bank Register-Bank(0/1)-Select
    MOVWF T2CON          ; !!Bank!! T2CON - PR2 - RAM - RAM
    CALL LADR_0x0087
    CALL LADR_0x0037
    MOVF LRAM_0x23,W
    MOVWF LRAM_0x24
    CALL LADR_0x003F
LADR_0x00A2
    BTFSC PORTD,0        ; !!Bank!! PORTD - TRISD - CM2CON0 - ANSEL
    GOTO LADR_0x00B2
    MOVLW 0x04           ;   b'00000100'  d'004'
    MOVWF LRAM_0x7C
    MOVLW 0x3D           ;   b'00111101'  d'061'  "="
    MOVWF LRAM_0x7D
LADR_0x00A8
    DECFSZ LRAM_0x7D,F
    GOTO LADR_0x00A8
    DECFSZ LRAM_0x7C,F
    GOTO LADR_0x00A8
    NOP
    NOP
    INCF LRAM_0x23,F
    MOVF LRAM_0x23,W
    MOVWF LRAM_0x24
    CALL LADR_0x003F
LADR_0x00B2
    BTFSC PORTD,1        ; !!Bank!! PORTD - TRISD - CM2CON0 - ANSEL
    GOTO LADR_0x00C2
    MOVLW 0x04           ;   b'00000100'  d'004'
    MOVWF LRAM_0x7C
    MOVLW 0x3D           ;   b'00111101'  d'061'  "="
    MOVWF LRAM_0x7D
LADR_0x00B8
    DECFSZ LRAM_0x7D,F
    GOTO LADR_0x00B8
    DECFSZ LRAM_0x7C,F
    GOTO LADR_0x00B8
    NOP
    NOP
    DECF LRAM_0x23,F
    MOVF LRAM_0x23,W
    MOVWF LRAM_0x24
    CALL LADR_0x003F
LADR_0x00C2
    MOVLW 0x21           ;   b'00100001'  d'033'  "!"
    MOVWF LRAM_0x7C
    MOVLW 0x76           ;   b'01110110'  d'118'  "v"
    MOVWF LRAM_0x7D
LADR_0x00C6
    DECFSZ LRAM_0x7D,F
    GOTO LADR_0x00C6
    DECFSZ LRAM_0x7C,F
    GOTO LADR_0x00C6
    NOP
    GOTO LADR_0x00A2
LADR_0x00CC
    GOTO LADR_0x00CC

    End
