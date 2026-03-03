import processing.serial.*;

Serial myPort;  // create object from Serial class
int val;  // data received from the serial port
int circleSize = 100;  
int textColor = 255;
int[] circleX = {100, 300, 500, 700, 100, 300, 500, 700};  // X positions of circles displayed
int[] circleY = {100, 100, 100, 100, 500, 500, 500, 500};  // Y positions of circles displayed
String[] textDisplay = {"Red", "Orange", "Yellow", "Green", "Blue", "Indigo", "Violet", "White"};  // displayed text on circles
int[] red = {255, 255, 255, 0, 0, 75, 143, 255};  // R values of colors
int[] green = {0, 165, 255, 255, 0, 0, 0, 255};  // G values of colors
int[] blue = {0, 0, 0, 0, 255, 130, 255, 255};  // B values of colors

void setup() 
{
  size(800, 800);
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
}

void draw() {
  background(255);

  for (int i = 0; i < 8; i++) {
    // display circles
    if (overCircle(circleX[i], circleY[i], circleSize) == false) {
      fill(0);
      myPort.write('X');
    } 
    else {
      fill(red[i], green[i], blue[i]);
      myPort.write(i + '0');
    }
    
    ellipse(circleX[i], circleY[i], circleSize, circleSize);
    textSize(20);
    fill(textColor);
    textAlign(CENTER);
    text(textDisplay[i], circleX[i], circleY[i] + 5);
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
