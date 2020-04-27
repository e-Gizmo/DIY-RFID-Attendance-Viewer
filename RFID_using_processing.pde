import processing.serial.*;
Serial myPort;
String sensorReading="";

PFont font;
PImage a, b, l, i, z, y, img;
PImage [] picArray = new PImage[7];

//Set the correct COM port number
String COMPORT = "COM2";

//Counters

//UserID numbers
String[] ID = {
  "0006885116", "0006886398"
};
//UserNames
String[] NUM = {
  "GRAY ROBOT", "RED ROBOT"
};

int trigdelay = 2000;

//setting the coordinates
//Cardnumber position
int cny = 400;
int cnx = 20;
int in_cnx = 250; //card display position
//Name position
int ny = 460;
int nx = 20;
int in_nx = 250; //name display position
//id position
int idx = 320;
int idy = 30;

void setup() {
  size(660, 700); //(width,height)
  background(255);// white

  myPort = new Serial(this, COMPORT, 9600);
  myPort.bufferUntil('\n');
  font = createFont(PFont.list()[0], 32);
  textFont(font);
  fill(0);
  text("Card Number: ", cnx, cny);
  text("Name: ", nx, ny);
  a = loadImage("0.jpg");
  b = loadImage("1.jpg");
  l = loadImage("logo.png");
  i = loadImage("idbg.jpg");
  z = loadImage("bg1.jpg");
  y = loadImage("bg1.jpg");

  picArray[0] = a;
  picArray[1] = b;
  image(l, 20, 10);
  image(i, idx, idy);
  image(z, 220, 360); //bg for card number
  image(y, 220, 420); //bg for card number
}

void draw() {
}

void serialEvent (Serial myPort) {

  sensorReading = myPort.readStringUntil('\n');
  if (sensorReading != null) {
    sensorReading=trim(sensorReading);
  }
  if (ID[0].equals(sensorReading) == true) {
    writeText("" + ID[0]); //display card number
    writeText2("" + NUM[0]); 
    image(picArray[0], idx, idy);
    clear_after();
  }
  if (ID[1].equals(sensorReading) == true) {
    writeText("" + ID[1]); //display card number
    writeText2("" + NUM[1]); 
    image(picArray[1], idx, idy);
    clear_after();
  }
}

void writeText(String textToWrite) {
  fill(0);
  text(textToWrite, in_cnx, cny);
}

void writeText2(String textToWrite2) {
  fill(0);
  text(textToWrite2, in_nx, ny);
}
void clear_after()
{
  delay(trigdelay);
  image(i, idx, idy);
  image(z, 220, 360);
  image(y, 220, 420);
}

