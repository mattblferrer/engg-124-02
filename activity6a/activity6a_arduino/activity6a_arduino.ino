char val; // data received from the serial port

void binaryWrite12bit(int n, int start) {
  int bit = 2048;
  int led = start + 11;  // starting with MSB
  while (bit > 0) {  // calculate from MSB to LSB
    if (n >= bit) {  // 1
      digitalWrite(led, HIGH);
      n -= bit;
    }
    else {  // 0
      digitalWrite(led, LOW);
    }
    bit /= 2;
    led -= 1;
  }
}

void setup() {
  for (int i = 2; i <= 13; i++) {
    pinMode(i, OUTPUT); // set pin as OUTPUT
  }
  pinMode(A3, INPUT_PULLUP);
  pinMode(A4, INPUT_PULLUP);
  pinMode(A5, INPUT_PULLUP);
  Serial.begin(9600); // start serial communication at 9600 bps
}

void loop() {
  int LRvalues[3][7] = {
    {4095, 4095, 4095, 4095, 4095, 4095, 4095},
    {0, 32, 48, 56, 60, 62, 63},
    {0, 64, 192, 448, 960, 1984, 4032}
  };
  while (Serial.available()) { // if data is available to read,
    val = Serial.read(); // read it and store it in val
  }
  if (val == '0') { // B button
    Serial.write('0');
    for (int i = 0; i < 7; i++) {
      binaryWrite12bit(LRvalues[0][i], 2);
      delay(100);
    }
  } 
  else if (val == '1') {  // L button
    Serial.write('1');
    for (int i = 0; i < 7; i++) {
      binaryWrite12bit(LRvalues[1][i], 2);
      delay(500);
    }
  } 
  else if (val == '2') {  // R button
    Serial.write('2');
    for (int i = 0; i < 7; i++) {
      binaryWrite12bit(LRvalues[2][i], 2);
      delay(500);
    }
  } 
  else if ((val == '3') || (digitalRead(A5) == LOW)) {  // A5 button on Arduino
    Serial.write('3');
    for (int i = 0; i < 7; i++) {
      binaryWrite12bit(LRvalues[0][i], 2);
      delay(100);
    }
  }
  else if ((val == '4') || (digitalRead(A4) == LOW)) {  // A4 button on Arduino
    Serial.write('4');
    for (int i = 0; i < 7; i++) {
      binaryWrite12bit(LRvalues[1][i], 2);
      delay(500);
    }
  }
  else if ((val == '5') || (digitalRead(A3) == LOW)) {  // A3 button on Arduino
    Serial.write('5');
    for (int i = 0; i < 7; i++) {
      binaryWrite12bit(LRvalues[2][i], 2);
      delay(500);
    }
  }
  else if (val == 'X') {
    Serial.write('X');
    for (int i = 2; i <= 13; i++) {
      digitalWrite(i, LOW);  // turn LEDS 2-13 OFF
    } 
    delay(10);
  }
}
