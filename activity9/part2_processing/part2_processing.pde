import http.requests.*;
import processing.serial.*;

Serial port;
String tskey = "SNB5HTDAU7IQ7LT0";
int touch_sensor, potentiometer;

public void setup()
{
  // Open the port that the board is connected to and use the same speed (9600 bps)
  port = new Serial(this, Serial.list()[0], 9600);
  
  size(400, 400);
  smooth();
  pixelDensity(1);
}

void draw() 
{
  String s = "http://api.thingspeak.com/update?api_key="+tskey+"&field1="+touch_sensor+"&field2="+potentiometer;
  GetRequest get = new GetRequest(s);
  get.send();
  println("Reponse Content: " + get.getContent());
  println("Reponse Content-Length Header: " + get.getHeader("Content-Length"));
  //for free, you can only send (fastest) at 15 sec or more, setting 16 sec interval for writing
  for (int i = 1; i <= 16; i++)     delay(1000); //16 second delay

  while (port.available() > 1) {
    touch_sensor = port.read();
    potentiometer = port.read();
  }
  port.clear();
}
