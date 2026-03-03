char val; // data received from the serial port

void setup() {
  for (int i = 4; i <= 7; i++) {
    pinMode(i, OUTPUT); // set pin as OUTPUT
  }
  Serial.begin(9600); // start serial communication at 9600 bps
}

void loop() {
  int redValues[8] = {255, 255, 255, 0, 0, 75, 143, 255};  // R values of colors
  int greenValues[8] = {0, 165, 255, 255, 0, 0, 0, 255};  // G values of colors
  int blueValues[8] = {0, 0, 0, 0, 255, 130, 255, 255};  // B values of colors

  while (Serial.available()) { // if data is available to read,
    val = Serial.read(); // read it and store it in val
  }
  if ((val >= '0') && (val <= '8')) {
    analogWrite(5, redValues[val - '0'] * 4);
    analogWrite(6, greenValues[val - '0'] * 4);
    analogWrite(7, blueValues[val - '0'] * 4);
  }
}
