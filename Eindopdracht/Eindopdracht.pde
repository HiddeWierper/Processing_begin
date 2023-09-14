//galgje 
//Kamerverhuur
//int f = max(12,3,564,575);

float bird;
float xWaardeBird = 150;
float yWaardeBird = 400;
float valSnelheid;
float zwaartekracht;
boolean sprong = false;
float x1WaardeLijn = 250;
float y1WaardeLijn = 800;
float x2WaardeLijn = 250;
float y2WaardeLijn = 400;

void setup() {
  background(0) ;
  size(500, 800);
  background(0);
  fill(255, 0, 0);
  frameRate(80);
}

void draw() {
  checkTop();
  checkBottom();
  background(0);
  noStroke();
  ellipse(xWaardeBird, yWaardeBird, 20, 20);

  valSnelheid += zwaartekracht;
  yWaardeBird += valSnelheid;

  if (!sprong) {
    if (yWaardeBird > height - 10) {
      yWaardeBird = height - 10;
      valSnelheid = 0;
      drawDeathMessage();
      resetBird();
    }
  }
}

void resetBackground() {
  boolean reset = false;
  if (reset) {
    background(0);
  }else if(!reset){
  }
}

void drawDeathMessage() {
  fill(255, 0, 0);
  textSize(32);
  textAlign(CENTER);
  text("Je bent dood!", width / 2, height / 2);
}

void keyPressed() {
  if (keyCode == 32) {
    yWaardeBird = yWaardeBird - 20;
    sprong = true;
    zwaartekracht = 0.2;
    valSnelheid = -5;
  }
  if (keyCode == ENTER) {
    resetBird();
  }
}

void resetBird() {
  zwaartekracht = 0;
  yWaardeBird = 400;
  sprong = false;
  valSnelheid = 0;
  drawDeathMessage();
  println("je bent dood");
}

void checkBottom() {
  if (yWaardeBird >= height) {
    drawDeathMessage();
  }
}

void checkTop() {
  if (yWaardeBird <= 0) {
  }
}
