/**
 * Button. 
 * 
 * Click on one of the colored shapes in the 
 * center of the image to change the color of 
 * the background. 
 */
 
int rectX1, rectY1, rectX2, rectY2;      // Position of square button
int circleX1, circleY1, circleX2, circleY2;  // Position of circle button
int rectSize = 120;     // Diameter of rect
int circleSize = 93;   // Diameter of circle
color rectColor1, circleColor1, rectColor2, circleColor2, baseColor;
color rectHighlight1, circleHighlight1, rectHighlight2, circleHighlight2;
color currentColor;
boolean circleOver1 = false;
boolean rectOver1 = false;
boolean circleOver2 = false;
boolean rectOver2 = false;

void setup() {
  size(1000, 700);
  rectColor1 = color(0);
  rectHighlight1 = color(51);
  rectColor2 = color(205);
  rectHighlight2 = color(140);
  circleColor1 = color(255);
  circleHighlight1 = color(204);
  circleColor2 = color(140);
  circleHighlight2 = color(255);
  
  baseColor = color(102);
  currentColor = baseColor;
  circleX1 = width/2+circleSize/2+10;
  circleY1 = height/2;
  circleX2 = width/2+circleSize/2+260;
  circleY2 = height/2;
  rectX1 = width/2-rectSize-10;
  rectY1 = height/2-rectSize/2;
  rectX2 = width/2-rectSize+240;
  rectY2 = height/2-rectSize/2;
  ellipseMode(CENTER);
}

void draw() {
  update(mouseX, mouseY);
  background(currentColor);
  
  if (rectOver1) {
    fill(rectHighlight1);
  } else {
    fill(rectColor1);
  }
  stroke(255);
  rect(rectX1, rectY1, rectSize, rectSize);
  
  if (rectOver2) {
    fill(rectHighlight2);
  } else {
    fill(rectColor2);
  }
  stroke(255);
  rect(rectX2, rectY2, rectSize, rectSize);
  
  if (circleOver1) {
    fill(circleHighlight1);
  } else {
    fill(circleColor1);
  }
  stroke(0);
  ellipse(circleX1, circleY1, circleSize, circleSize);
  
  if (circleOver2) {
    fill(circleHighlight2);
  } else {
    fill(circleColor2);
  }
  stroke(0);
  ellipse(circleX2, circleY2, circleSize, circleSize);
}

void update(int x, int y) {
  if ( overCircle(circleX1, circleY1, circleSize) ) {
    circleOver1 = true;
    rectOver1 = false;
    circleOver2 = false;
    rectOver2 = false;
  } else if ( overRect(rectX1, rectY1, rectSize, rectSize) ) {
    circleOver1 = false;
    rectOver1 = true;
    circleOver2 = false;
    rectOver2 = false;
  } 
  else if ( overCircle(circleX2, circleY2, circleSize) ) {
    circleOver1 = false;
    rectOver1 = false;
    circleOver2 = true;
    rectOver2 = false;
  } 
  else if ( overRect(rectX2, rectY2, rectSize, rectSize) ) {
    circleOver1 = false;
    rectOver1 = false;
    circleOver2 = false;
    rectOver2 = true;
  } else {
    circleOver1 = rectOver1 = circleOver2 = rectOver2 = false;
  }
}

void mousePressed() {
  if (circleOver1) {
    currentColor = circleColor1;
    println("circular button 1 is pressed");
  }
  if (rectOver1) {
    currentColor = rectColor1;
    println("rectangular button 1 is pressed");
  }
  if (circleOver2) {
    currentColor = circleColor2;
    println("circular button 2 is pressed");
  }
  if (rectOver2) {
    currentColor = rectColor2;
    println("rectangular button 2 is pressed");
  }
}

boolean overRect(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

boolean overCircle(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}
