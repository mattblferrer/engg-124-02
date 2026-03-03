// Wiring / Arduino Code
// Code for sensing a switch status and writing the value to the serial port.

void setup() {
  pinMode(A3, INPUT_PULLUP); 
  pinMode(A4, INPUT_PULLUP); 
  pinMode(A5, INPUT_PULLUP); 
  Serial.begin(9600);                    // Start serial communication at 9600 bps
}

void loop() {
  if (digitalRead(A3) == LOW) {
    Serial.write(3); 
  } else if (digitalRead(A4) == LOW) { 
    Serial.write(4); 
  } else if (digitalRead(A4) == LOW) {                           
    Serial.write(5); 
  } else {
    Serial.write(1);
  }
  delay(100);                            // Wait 100 milliseconds
}
