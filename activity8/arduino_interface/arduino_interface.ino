void setup() {
  Serial.begin(9600); 
}

void loop() {
  int sensor = analogRead(A0);
  if (sensor > 500) {
    Serial.write(1);
    delay(250);
  }
}