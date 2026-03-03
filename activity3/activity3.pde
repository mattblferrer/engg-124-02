int rectX1, rectY1, rectX2, rectY2;      // Position of square button
int rectSize = 120;     // Diameter of rect
color rectColor1, rectColor2, baseColor;
color rectHighlight1, rectHighlight2;
color currentColor,textColor;
boolean rectOver1 = false;
boolean rectOver2 = false;
boolean start = false;  // if start button is pressed
PrintWriter file;  // output file

void setup() {
  size(1000, 700);
  textSize(40);
  textColor = color(255);
  rectColor1 = color(0,255,0);
  rectHighlight1 = color(0,200,0);
  rectColor2 = color(255,0,0);
  rectHighlight2 = color(200,0,0);
  
  baseColor = color(0);
  currentColor = baseColor;
  rectX1 = width/2-rectSize-10;
  rectY1 = height/2-rectSize/2;
  rectX2 = width/2-rectSize+240;
  rectY2 = height/2-rectSize/2;
  background(currentColor);
  
  file = createWriter("data.csv");
}

void draw() {
  update(mouseX, mouseY);
  
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
  fill(textColor);
  text("Start", rectX1+20, rectY1+70);
  text("Stop", rectX2+20, rectY2+70);
}

void update(int x, int y) {
  if ( overRect(rectX1, rectY1, rectSize, rectSize) ) {
    rectOver1 = true;
    rectOver2 = false;
  } 
  else if ( overRect(rectX2, rectY2, rectSize, rectSize) ) {
    rectOver1 = false;
    rectOver2 = true;
  } else {
    rectOver1 = rectOver2 = false;
  }
}

void mousePressed() {
  if (rectOver1) {
    background(rectHighlight1);
    start = true;
    println("Start pressed.");
  }
  else if (rectOver2) {
    background(baseColor);
    start = false;
    println("Stop pressed.");
    file.flush();
    file.close();
  }
  else if (start) {
    ellipse(mouseX, mouseY, 5, 5);
    println("Pressed: " + mouseX + ", " + mouseY);
    file.println(mouseX + "," + mouseY);
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
