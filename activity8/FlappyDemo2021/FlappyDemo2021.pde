import processing.serial.*;

Serial port;  // Create object from Serial class
int input = 0;  // value received from Serial port
int val;
PImage backImg, birdImg, wallImg, startImg;
int cmo = -12;
int cmox = 1;
int gdelay = 1;
int gamestate = 1, score = 0, highScore = 0, x = -200, y, vy = 0;
int wx[] = new int[2], wy[] = new int[2];

void setup() {
  // Open the port that the board is connected to and use the same speed (9600 bps)
  port = new Serial(this, Serial.list()[0], 9600);
  
  size(600,800);
  fill(0);
  textSize(40);  
  birdImg =loadImage("wingsT.png");
  backImg =loadImage("ECCE1.jpg");
  wallImg =loadImage("wall.png");
  startImg=loadImage("startpage.jpg");
}
void draw() { //runs 60 times a second
  while (port.available() > 0) {
    input = port.read();
  }
  if (input == 1) {
     vy = cmo; //-16
    if(gamestate==1) {
      wx[0] = 600;
      wy[0] = y = height/2;
      wx[1] = 900;
      wy[1] = 600;
      x = gamestate = score = 0;
      cmo = -16; }
    input = 0;
  }
  if(gamestate == 0) {
    delay(gdelay);
    imageMode(CORNER);
    image(backImg, x, 0);
    image(backImg, x+backImg.width, 0);
    x -= cmox; //6
    vy += 1;
    y += vy;
    if(x == -1800) x = 0;
    for(int i = 0 ; i < 2; i++) {
      imageMode(CENTER);
      image(wallImg, wx[i], wy[i] - (wallImg.height/2+100));
      image(wallImg, wx[i], wy[i] + (wallImg.height/2+100));
      if(wx[i] < 0) {
        wy[i] = (int)random(200,height-200);
        wx[i] = width;
      }
      if(wx[i] == width/2) highScore = max(++score, highScore);
      if(y>height||y<0||(abs(width/2-wx[i])<25 && abs(y-wy[i])>100)) gamestate=1;
      wx[i] -= 6;
    }
    image(birdImg, width/2, y);
    text(""+score, width/2+30, 300);
  }
  else {
    imageMode(CENTER);
    image(startImg, width/2,height/2);
    text("High Score:"+highScore, 15, 300);
  }
}

void mousePressed() {
  vy = cmo; //-16
  if(gamestate==1) {
    wx[0] = 600;
    wy[0] = y = height/2;
    wx[1] = 900;
    wy[1] = 600;
    x = gamestate = score = 0;
    cmo = -16; }
}
