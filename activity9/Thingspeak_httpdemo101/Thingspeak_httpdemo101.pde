import http.requests.*;
String tskey = "SNB5HTDAU7IQ7LT0";
int val = 23;

public void setup()
{
  size(400, 400);
  smooth();
  pixelDensity(1);
}

void draw() 
{
  String s = "http://api.thingspeak.com/update?api_key="+tskey+"&field1="+val;
  GetRequest get = new GetRequest(s);
  get.send();
  println("Reponse Content: " + get.getContent());
  println("Reponse Content-Length Header: " + get.getHeader("Content-Length"));
  //for free, you can only send (fastest) at 15 sec or more, setting 16 sec interval for writing
  for (int i = 1; i <= 16; i++)     delay(1000); //16 second delay

  val= (int) random(25)+10;
  println(val);
}
