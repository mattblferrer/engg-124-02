import http.requests.*;
String tskey = "SNB5HTDAU7IQ7LT0";
int val  = 11;
int val2 = 101;
int val3 = 5;
int val4 = 80;

public void setup()
{
  size(400, 400);
  smooth();
  pixelDensity(1);
}

void draw() 
{
  String s = "http://api.thingspeak.com/update?api_key="+tskey+"&field1="+val+"&field2="+val2+"&field3="+val3+"&field4="+val4;
  GetRequest get = new GetRequest(s);
  get.send();
  println("Reponse Content: " + get.getContent());
  println("Reponse Content-Length Header: " + get.getHeader("Content-Length"));
  //for free, you can only send (fastest) at 15 sec or more, setting 16 sec interval for writing
  for (int i = 1; i <= 16; i++)     delay(1000); //16 second delay

  val= (int) random(25)+10;
  val2= (int) random(101)+10;
  val3= (int) random(5)+5;
  val4= (int) random(57)+75;
  print(val); print(", ");
  println(val2);
}
