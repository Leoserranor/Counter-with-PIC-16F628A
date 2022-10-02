
_main:

;lab_3.c,52 :: 		void main() {
;lab_3.c,56 :: 		INC           = 0x00;                    //Define Porta RB6 como entrada
	BCF        RB6_bit+0, BitPos(RB6_bit+0)
;lab_3.c,57 :: 		ZERA           = 0x00;                   //Define porta RB7 como entrada
	BCF        RB7_bit+0, BitPos(RB7_bit+0)
;lab_3.c,59 :: 		Lcd_Init();                              //Inicia display LCD
	CALL       _Lcd_Init+0
;lab_3.c,60 :: 		Lcd_Out(1, 1, "Iniciando...");           //Escreve texto na linha 1
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_lab_3+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;lab_3.c,61 :: 		delay_ms(1000);                          // insere um delay de 1 segundo
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
	NOP
	NOP
;lab_3.c,62 :: 		Lcd_Cmd(_LCD_CLEAR);                     //limpa display LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;lab_3.c,63 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);                //Apaga cursor do display LCD
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;lab_3.c,64 :: 		Lcd_Out(1, 1, "Contador");               //Escreve texto na linha 1 e coluna 1
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_lab_3+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;lab_3.c,66 :: 		Delay_ms(500);                           //Aguarda 100 milisegundos
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main1:
	DECFSZ     R13+0, 1
	GOTO       L_main1
	DECFSZ     R12+0, 1
	GOTO       L_main1
	DECFSZ     R11+0, 1
	GOTO       L_main1
	NOP
	NOP
;lab_3.c,68 :: 		Lcd_Cmd(_LCD_CLEAR);                     //Limpa o display LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;lab_3.c,74 :: 		while(1) {
L_main2:
;lab_3.c,76 :: 		Disp();                         //Chama a função do display
	CALL       _Disp+0
;lab_3.c,77 :: 		Incrementa();                   //Chama a função que incrementa
	CALL       _Incrementa+0
;lab_3.c,80 :: 		}
	GOTO       L_main2
;lab_3.c,82 :: 		}                                             //Fim do programa
L_end_main:
	GOTO       $+0
; end of _main

_Disp:

;lab_3.c,86 :: 		void Disp() {
;lab_3.c,88 :: 		Lcd_Out(1, 1, "Contador");              //Mostra Caracter na linha 1
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_lab_3+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;lab_3.c,90 :: 		text[2] = un%10 + '0';                  //Pega resto da divisão por 10
	MOVLW      2
	ADDWF      _text+0, 0
	MOVWF      FLOC__Disp+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _un+0, 0
	MOVWF      R0+0
	MOVF       _un+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 1
	MOVF       FLOC__Disp+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;lab_3.c,91 :: 		text[1] = un/10 + '0';                  //Pega divide por 10
	INCF       _text+0, 0
	MOVWF      FLOC__Disp+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _un+0, 0
	MOVWF      R0+0
	MOVF       _un+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      48
	ADDWF      R0+0, 1
	MOVF       FLOC__Disp+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;lab_3.c,94 :: 		Lcd_Out(1, 10, text);                   //Mostra contagem no display
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _text+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;lab_3.c,99 :: 		}
L_end_Disp:
	RETURN
; end of _Disp

_Incrementa:

;lab_3.c,103 :: 		void Incrementa()  {
;lab_3.c,105 :: 		if(INC == 1) {                         //Se botão INC for presionado
	BTFSS      RB6_bit+0, BitPos(RB6_bit+0)
	GOTO       L_Incrementa4
;lab_3.c,106 :: 		un = un + 0x01;                //Incrementa variável unidade
	INCF       _un+0, 1
	BTFSC      STATUS+0, 2
	INCF       _un+1, 1
;lab_3.c,107 :: 		Delay_ms(180);                 //Tempo de incremento
	MOVLW      234
	MOVWF      R12+0
	MOVLW      195
	MOVWF      R13+0
L_Incrementa5:
	DECFSZ     R13+0, 1
	GOTO       L_Incrementa5
	DECFSZ     R12+0, 1
	GOTO       L_Incrementa5
;lab_3.c,108 :: 		if(un > 99) un = 0;            //Se unidade for maior que 99 manda pra 0
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _un+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Incrementa11
	MOVF       _un+0, 0
	SUBLW      99
L__Incrementa11:
	BTFSC      STATUS+0, 0
	GOTO       L_Incrementa6
	CLRF       _un+0
	CLRF       _un+1
L_Incrementa6:
;lab_3.c,109 :: 		}
L_Incrementa4:
;lab_3.c,111 :: 		if(ZERA == 1) {                        //Se botão zera for precionado  reseta a contagem
	BTFSS      RB7_bit+0, BitPos(RB7_bit+0)
	GOTO       L_Incrementa7
;lab_3.c,112 :: 		un = 0;                         //manda a variavel unidade para 0
	CLRF       _un+0
	CLRF       _un+1
;lab_3.c,115 :: 		}
L_Incrementa7:
;lab_3.c,116 :: 		}
L_end_Incrementa:
	RETURN
; end of _Incrementa
