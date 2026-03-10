import processing.serial.*;

Serial port;  // Create object from Serial class
int a0, a1, high0, low0, high1, low1;      // Data received from the serial port
int[] values0, values1;
PrintWriter file;  // output file

void setup() 
{
  size(640, 480);
  // Open the port that the board is connected to and use the same speed (9600 bps)
  port = new Serial(this, Serial.list()[0], 9600);
  values0 = new int[width];
  values1 = new int[width];
  smooth();
  file = createWriter("data.csv");
}

int getY(int val) {
  return (int)(val / 1023.0f * height) - 1;
}

void draw()
{
  while (port.available() > 3) {
      high0 = port.read();
      low0 = port.read();
      high1 = port.read();
      low1 = port.read();
      a0 = high0 * 256 + low0;
      a1 = high1 * 256 + low1;
  }
  for (int i=0; i<width-1; i++) {
      values0[i] = values0[i+1];
      values1[i] = values1[i+1];
  } 
  values0[width-1] = a0;
  values1[width-1] = a1;
  background(0);
  stroke(255, 0, 0);
  for (int x=1; x<width; x++) {
    line(width-x,   height-1-getY(values0[x-1]), 
         width-1-x, height-1-getY(values0[x]));
  }
  stroke(0, 255, 0);
  for (int x=1; x<width; x++) {
    line(width-x,   height-1-getY(values1[x-1]), 
         width-1-x, height-1-getY(values1[x]));
  }
  file.println(a0 + "," + a1);
}
