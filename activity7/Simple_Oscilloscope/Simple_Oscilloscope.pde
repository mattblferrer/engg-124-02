import processing.serial.*;

Serial port;  // Create object from Serial class
int val, high, low;      // Data received from the serial port
int[] values;
PrintWriter file;  // output file

void setup() 
{
  size(640, 480);
  // Open the port that the board is connected to and use the same speed (9600 bps)
  port = new Serial(this, Serial.list()[0], 9600);
  values = new int[width];
  smooth();
  file = createWriter("data.csv");
}

int getY(int val) {
  return (int)(val / 1023.0f * height) - 1;
}

void draw()
{
  while (port.available() > 1) {
      high = port.read();
      low = port.read();
      val = high * 256 + low;
  }
  for (int i=0; i<width-1; i++)
    values[i] = values[i+1];
  values[width-1] = val;
  background(0);
  stroke(255);
  for (int x=1; x<width; x++) {
    line(width-x,   height-1-getY(values[x-1]), 
         width-1-x, height-1-getY(values[x]));
  }
  file.println(val);
}
