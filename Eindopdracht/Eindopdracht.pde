//galgje
//Kamerverhuur
//int f = max(12,3,564,575);

float bird;
float xWaardeBird = 150;
float yWaardeBird = 400;
float valSnelheid;
float zwaartekracht;
boolean sprong = false;
//boolean start = true;


void setup() {
  size(500, 800);
  background(0);
  fill(255, 0, 0);
  frameRate(60);
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
      resetBird();
    }
  }
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
  background(0);
}




void resetBird() {
  zwaartekracht = 0;
  yWaardeBird = 400;
  sprong = false;
  valSnelheid = 0;
}

void checkBottom() {
  if (yWaardeBird >= height) {
    background(0, 0, 255);
    fill(255, 0, 0);
    textSize(40); //<>//
    text("You died", 230, 230); //<>//
  } //<>//
}

void checkTop() {
  if (yWaardeBird <= 0) {
    background(0, 0, 255);
  }
}
