void setup() {
  pinMode(A0, OUTPUT);
  pinMode(A1, OUTPUT);
  pinMode(A2, INPUT);
  pinMode(A3, INPUT);
  Serial.begin(9600); 

}

void loop() {
  digitalWrite(A0, LOW);
  digitalWrite(A1, HIGH);
  int touch_sensor = analogRead(A2);
  int potentiometer = analogRead(A3);
  Serial.write(touch_sensor);
  Serial.write(potentiometer);
  delay(10);
}