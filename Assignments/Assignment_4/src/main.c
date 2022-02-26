// Decade counter
//through an assembly routine
#include <avr/io.h>

//Function declared in initasm.S
extern void init(void);
//Function declared in disp_sevensegasm.S
extern void disp_sevenseg(uint8_t);
//Function declared in delayasm.S
extern void delay(uint8_t);

 int main (void)
{
  while (1) {
      init();
    for(uint8_t i=0;i<10;i++){
        disp_sevenseg(i);
        delay(511);
    }  
  }
  return 0;

}
