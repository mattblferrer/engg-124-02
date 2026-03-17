void setup() {
  pinMode(A0, OUTPUT);
  pinMode(A1, OUTPUT);
  pinMode(A2, OUTPUT);
  Serial.begin(9600); 
  
}

void loop() {
  digitalWrite(A0, LOW);
  digitalWrite(A1, HIGH);
  int sensor = analogRead(A2);
  if (sensor > 30) {
    Serial.write(1);
    delay(250);
  }
}