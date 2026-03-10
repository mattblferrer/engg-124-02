// The Arduino code.

void setup() {
  Serial.begin(9600); 
}

void loop() {
  int a0 = analogRead(A0);
  int high0 = a0 / 256;
  int low0 = a0 % 256;
  Serial.write(high0);
  Serial.write(low0);
}
