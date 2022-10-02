//****************************************************************************//
//* Programa contador lab 3                                                  *//
//* Escrito por Leonardo serrano                                             *//
//* Utiliza microcontrolador PIC16F628A                                      *//
//* Utiliza compilador mikroC Vers�o 7.6.0                                   *//
//* Utliliza display LCD 16x2  ou compat�vel                                 *//
//* Escrito em 02/10/2022                                                    *//
//****************************************************************************//

                 //*=== Define conec��es do display ===*//

sbit LCD_RS at RB0_bit;
sbit LCD_EN at RB1_bit;
sbit LCD_D4 at RB2_bit;
sbit LCD_D5 at RB3_bit;
sbit LCD_D6 at RB4_bit;
sbit LCD_D7 at RB5_bit;

sbit LCD_RS_Direction at TRISB0_bit;
sbit LCD_EN_Direction at TRISB1_bit;
sbit LCD_D4_Direction at TRISB2_bit;
sbit LCD_D5_Direction at TRISB3_bit;
sbit LCD_D6_Direction at TRISB4_bit;
sbit LCD_D7_Direction at TRISB5_bit;

                  //*=== Declara fun��es do programa ===*//

void Disp();                                     //Fun��o para mostrar no display
void Incrementa();                               //Fun��o para incrementar e resetar a contagem



                    //*=== Defini��es do hardware ===*//

#define INC rb6_bit
#define ZERA rb7_bit

                     //*=== Vetor de interrup��o ===*//

unsigned int cnt = 0x00;                      //Vari�vel auxiliar de contagem
int dez = 0x00, un = 0x00;                   //Variaves do contador



                    //*=== Defini��es de vari�ves ===*//

char *text = ":00";                           //Vari�ves para dados do display


                     //*=== Programa princimpal ===*//

void main() {



     INC           = 0x00;                    //Define Porta RB6 como entrada
     ZERA           = 0x00;                   //Define porta RB7 como entrada

     Lcd_Init();                              //Inicia display LCD
     Lcd_Out(1, 1, "Iniciando...");           //Escreve texto na linha 1
     delay_ms(1000);                          // insere um delay de 1 segundo
     Lcd_Cmd(_LCD_CLEAR);                     //limpa display LCD
     Lcd_Cmd(_LCD_CURSOR_OFF);                //Apaga cursor do display LCD
     Lcd_Out(1, 1, "Contador");               //Escreve texto na linha 1 e coluna 1

     Delay_ms(500);                           //Aguarda 100 milisegundos

     Lcd_Cmd(_LCD_CLEAR);                     //Limpa o display LCD



                         //*=== Loop infinito ===*//

     while(1) {

              Disp();                         //Chama a fun��o do display
              Incrementa();                   //Chama a fun��o que incrementa


     }

}                                             //Fim do programa

              //*=== Fun��o que mostra os valores no display ===*//

void Disp() {

     Lcd_Out(1, 1, "Contador");              //Mostra Caracter na linha 1

     text[2] = un%10 + '0';                  //Pega resto da divis�o por 10
     text[1] = un/10 + '0';                  //Pega divide por 10


     Lcd_Out(1, 10, text);                   //Mostra contagem no display




}

                  //*=== Fun��o dos bot�es ===*//

void Incrementa()  {

     if(INC == 1) {                         //Se bot�o INC for presionado
             un = un + 0x01;                //Incrementa vari�vel unidade
             Delay_ms(180);                 //Tempo de incremento
             if(un > 99) un = 0;            //Se unidade for maior que 99 manda pra 0
             }
             
     if(ZERA == 1) {                        //Se bot�o zera for precionado  reseta a contagem
            un = 0;                         //manda a variavel unidade para 0


           }
}