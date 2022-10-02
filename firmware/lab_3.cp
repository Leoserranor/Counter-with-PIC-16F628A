#line 1 "C:/Users/Leonardo/Desktop/TAP/lab_3/firmware/lab_3.c"
#line 12 "C:/Users/Leonardo/Desktop/TAP/lab_3/firmware/lab_3.c"
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



void Disp();
void Incrementa();










unsigned int cnt = 0x00;
int dez = 0x00, un = 0x00;





char *text = ":00";




void main() {



  rb6_bit  = 0x00;
  rb7_bit  = 0x00;

 Lcd_Init();
 Lcd_Out(1, 1, "Iniciando...");
 delay_ms(1000);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1, 1, "Contador");

 Delay_ms(500);

 Lcd_Cmd(_LCD_CLEAR);





 while(1) {

 Disp();
 Incrementa();


 }

}



void Disp() {

 Lcd_Out(1, 1, "Contador");

 text[2] = un%10 + '0';
 text[1] = un/10 + '0';


 Lcd_Out(1, 10, text);




}



void Incrementa() {

 if( rb6_bit  == 1) {
 un = un + 0x01;
 Delay_ms(180);
 if(un > 99) un = 0;
 }

 if( rb7_bit  == 1) {
 un = 0;


 }
}
