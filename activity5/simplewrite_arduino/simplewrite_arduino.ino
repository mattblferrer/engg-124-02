char val; // Data received from the serial port

void setup() {
  for (int i = 2; i <= 13; i++) {
    pinMode(i, OUTPUT); // Set pin as OUTPUT
  }
  Serial.begin(9600); // Start serial communication at 9600 bps
}

void loop() {
  while (Serial.available()) { // If data is available to read,
    val = Serial.read(); // read it and store it in val
  }
  if (val == '1') { // If H was received
    for (int i = 2; i <= 7; i++) {
      digitalWrite(i, HIGH);  // turn LEDS 2-7 ON
    } 
  } else if (val == '2') {
    for (int i = 8; i <= 13; i++) {
      digitalWrite(i, HIGH);  // turn LEDS 8-13 ON
    }
  } else {
    for (int i = 2; i <= 13; i++) {
      digitalWrite(i, LOW);  // Otherwise turn them OFF
    }
    
  }
  //delay(10); // Wait 10 milliseconds for next reading
}
