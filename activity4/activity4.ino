#include <Adafruit_LiquidCrystal.h>
Adafruit_LiquidCrystal lcd(0);
char cmd;

void setup() {
  // initialize serial communication at 9600 bits per second:
  Serial.begin(9600);
  lcd.begin(16, 2);
}

void loop() {
  if (Serial.available() > 0) {
    cmd = Serial.read();
  }
  if ((cmd == 'D') || (cmd == 'd')) {
    int potentiometer = analogRead(A0);
    int temp = analogRead(A1);
    Serial.print(potentiometer);
    Serial.print(" , ");
    Serial.println(temp);

    lcd.print(potentiometer);
    lcd.print(" , ");
    lcd.print(temp);
    delay(500);
    lcd.clear();
  }
}