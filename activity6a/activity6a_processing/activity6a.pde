import processing.serial.*;

Serial myPort;  // create object from Serial class
int val;  // data received from the serial port
int circleSize = 100;  
int textColor = 255;
int[] circleX = {100, 400, 700, 100, 400, 700};  // X positions of circles displayed
int[] circleY = {100, 100, 100, 500, 500, 500};  // Y positions of circles displayed
String[] textDisplay = {"B", "L", "R", "A5", "A4", "A3"};  // displayed text on circles

void setup() 
{
  size(800, 800);
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
}

void draw() {
  background(255);

  for (int i = 0; i < 6; i++) {
    // read from Arduino and highlight circles
    if (myPort.available() > 0) {  // if data is available,
      val = myPort.read();         // read it and store it in val
    }
    
    // display circles
    if (overCircle(circleX[i], circleY[i], circleSize) == false) {
      fill(0);
      myPort.write('X');
    } 
    else if (i == 3) {  // A5 button
      fill(200, 0, 0);
      myPort.write('3');
    }
    else if (i == 4) {  // A4 button
      fill(0, 200, 0);
      myPort.write('4');
    }
    else if (i == 5) {  // A3 button
      fill(0, 0, 200);
      myPort.write('5');
    }
    else {
      fill(204);
      myPort.write(i + '0');
    }
    if ((i == 3) && (val == '3')) {  // A5 button
      fill(200, 0, 0);
    }
    else if ((i == 4) && (val == '4')) {  // A4 button
      fill(0, 200, 0);
    }
    else if ((i == 5) && (val == '5')) {  // A3 button
      fill(0, 0, 200);
    }
    
    ellipse(circleX[i], circleY[i], circleSize, circleSize);
    textSize(20);
    fill(textColor);
    text(textDisplay[i], circleX[i], circleY[i]);
  }
}

boolean overCircle(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2) {
    return true;
  } else {
    return false;
  }
}
