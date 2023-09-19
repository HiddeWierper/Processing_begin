float bird;
float xWaardeBird = 150;
float yWaardeBird = 400;
float valSnelheid;
float zwaartekracht;
boolean sprong = false;
float x1WaardeLijn = 400;
float y1WaardeLijn = random(50, 600);;
float x2WaardeLijn = 400;
float y2WaardeLijn = 800;
boolean resetBackground;
boolean birdActive = false;
float lijnSnelheid;
float zijwaartseKracht;
int score = 0;


void setup() {
  background(0);
  size(500, 800);
  background(0);
  fill(255, 0, 0);
  frameRate(80);
}

void draw() {
  resetBackground = true;
    points();
  checkResetNeeded();
  checkTop();
  checkBottom();
  makeLine();
  noStroke();
  ellipse(xWaardeBird, yWaardeBird, 20, 20);
  if  (yWaardeBird <= y1WaardeLijn  ) {
  } else if (abs(xWaardeBird - x1WaardeLijn) <= 1 || abs(xWaardeBird - x2WaardeLijn) <= 1) {
    drawDeathMessage();
    resetBackground = false;
    resetBird();
    resetLines();
  }  


  textSize(50);
  fill(255,0,0);
  text(score, 250, 50);

  valSnelheid += zwaartekracht;
  yWaardeBird += valSnelheid;

  lijnSnelheid += zijwaartseKracht;
  x1WaardeLijn += lijnSnelheid;
  x2WaardeLijn += lijnSnelheid;

  if (!sprong) {
    if (yWaardeBird > height - 10 ) {
      yWaardeBird = height - 10;
      valSnelheid = 0;
      lijnSnelheid = 0;
      zijwaartseKracht = 0;
      resetBackground = false;
      drawDeathMessage();
      resetBackground = true;
      resetBird();
      resetLines();
    }
  }

  if (birdActive) {
    x1WaardeLijn = x1WaardeLijn - 1;
    x2WaardeLijn = x2WaardeLijn - 1;
    zijwaartseKracht = 0.2;
    lijnSnelheid = -1;
  }
}

void points(){
if (abs(xWaardeBird - x2WaardeLijn) <= 1) {
      println(score);
    score = score + 1;


 



 for (float i = x1WaardeLijn - 200; i < 1000; i++) {
  println(i);
if(x2WaardeLijn <= xWaardeBird){
  resetBackground = false;
  stroke(255);
  line(600, 700, 600, 40);
  resetBackground = true;
}
    }
  }
}



void checkResetNeeded() {
  if (resetBackground) {
    background(0);
  } else if (!resetBackground) {
  }
} 


void drawDeathMessage() {
  resetBird();
  resetLines();
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
    birdActive = true;
  }

  if (keyCode == ENTER) {
    resetLines();
    resetBird();
 
  }
}

void resetBird() {
  zwaartekracht = 0;
  yWaardeBird = 400;
  sprong = false;
  valSnelheid = 0;
  score = 0;
}

void makeLine() {
  resetBackground = false;
  stroke(255, 255, 255);
  line(x1WaardeLijn, y1WaardeLijn, x2WaardeLijn, y2WaardeLijn);
  resetBackground = true;
}

void resetLines() {
  x1WaardeLijn = 400;
  y1WaardeLijn = random(50, 600);;
  x2WaardeLijn = 400;
  y2WaardeLijn = 800;
}

void checkBottom() {
  if (yWaardeBird >= height) {
    drawDeathMessage();
  }
}

void checkTop() {
  if (yWaardeBird <= 0) {
    drawDeathMessage();
  }
}