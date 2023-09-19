float bird;
float xWaardeBird = 150;
float yWaardeBird = 400;
float valSnelheid;
float zwaartekracht;
boolean sprong = false;
float x1WaardeLijn = 400;
float y1WaardeLijn = random(100, 600);;
float x2WaardeLijn = 400;
float y2WaardeLijn = 800;
float x1WaardeLijn2 = 575;
float y1WaardeLijn2 = random(100, 600);
float x2WaardeLijn2 = 575;
float y2WaardeLijn2 = 800;
float x1WaardeLijn3 = 725;
float y1WaardeLijn3 = random(100, 600);
float x2WaardeLijn3 = 725;
float y2WaardeLijn3 = 800;
float x1WaardeLijn4 = 875;
float y1WaardeLijn4 = random(100, 600);
float x2WaardeLijn4 = 875;
float y2WaardeLijn4 = 800;
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
  checkResetNeeded();
  checkIfDead();
  checkTop();
  checkBottom();
  makeLine();
  checkIfLineNeeded();
  score();
  noStroke();
  ellipse(xWaardeBird, yWaardeBird, 20, 20);

  valSnelheid += zwaartekracht;
  yWaardeBird += valSnelheid;

  lijnSnelheid += zijwaartseKracht;
  x1WaardeLijn += lijnSnelheid;
  x2WaardeLijn += lijnSnelheid;
  x1WaardeLijn2 += lijnSnelheid;
  x2WaardeLijn2 += lijnSnelheid;
  x1WaardeLijn3 += lijnSnelheid;
  x2WaardeLijn3 += lijnSnelheid;
  x1WaardeLijn4 += lijnSnelheid;
  x2WaardeLijn4 += lijnSnelheid;

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
    x1WaardeLijn2 = x1WaardeLijn2 - 1;
    x2WaardeLijn2 = x2WaardeLijn2 - 1;
    x1WaardeLijn3 = x1WaardeLijn3 - 1;
    x2WaardeLijn3 = x2WaardeLijn3 - 1;
    x1WaardeLijn4 = x1WaardeLijn4 - 1;
    x2WaardeLijn4 = x2WaardeLijn4 - 1;
    zijwaartseKracht = 0.2;
    lijnSnelheid = -1;
  }else if(!birdActive){
    x1WaardeLijn = x1WaardeLijn;
    x2WaardeLijn = x2WaardeLijn;
    x1WaardeLijn2 = x1WaardeLijn2;
    x2WaardeLijn2 = x2WaardeLijn2;
    x1WaardeLijn3 = x1WaardeLijn3;
    x2WaardeLijn3 = x2WaardeLijn3;
    x1WaardeLijn4 = x1WaardeLijn4;
    x2WaardeLijn4 = x2WaardeLijn4;
    zijwaartseKracht = 0;
    lijnSnelheid = 0;
  }
}

void makeLine() {
  resetBackground = false;
  stroke(255, 0, 255);
  line(x1WaardeLijn, y1WaardeLijn, x2WaardeLijn, y2WaardeLijn);
  resetBackground = true;
  stroke(255,0,255);
  line(x1WaardeLijn2, y1WaardeLijn2, x1WaardeLijn2, y2WaardeLijn2);
  stroke(255,0,255);
  line(x1WaardeLijn3, y1WaardeLijn3, x1WaardeLijn3, y2WaardeLijn3);
  stroke(255,0,255);
  line(x1WaardeLijn4, y1WaardeLijn4, x1WaardeLijn4, y2WaardeLijn4);
}

void checkResetNeeded() {
  if (resetBackground) {
    background(0);
  } else if (!resetBackground) {
  }
}

void checkIfLineNeeded(){
  if (x1WaardeLijn <= 0 ){
    lineNeeded();
  }if (x2WaardeLijn2 <= 0){
    line2Needed();
  }if (x2WaardeLijn3 <= 0){
    line3Needed();
  }if (x2WaardeLijn4 <= 0){
    line4Needed();
  }
}
void lineNeeded(){
  stroke(255,0,255);
  x1WaardeLijn = 650;
  x2WaardeLijn = 650;
  y1WaardeLijn = random(50,600);;
  line(x1WaardeLijn,y1WaardeLijn,x2WaardeLijn, y2WaardeLijn);
}

void line2Needed(){
  stroke(255,0,255);
  x1WaardeLijn2 = 650;
  x2WaardeLijn2 = 650;
  y1WaardeLijn2 = random(50,600);;
  line(x1WaardeLijn2,y1WaardeLijn2,x2WaardeLijn2, y2WaardeLijn2);
}

void line3Needed(){
  stroke(255,0,255);
  x1WaardeLijn3 = 650;
  x2WaardeLijn3 = 650;
  y1WaardeLijn3 = random(50,600);;
  line(x1WaardeLijn3,y1WaardeLijn3,x2WaardeLijn3, y2WaardeLijn3);
}
void line4Needed(){
  stroke(255,0,255);
  x1WaardeLijn4 = 650;
  x2WaardeLijn4 = 650;
  y1WaardeLijn4 = random(50,600);;
  line(x1WaardeLijn4,y1WaardeLijn4,x2WaardeLijn4, y2WaardeLijn4);
}
  
void checkIfDead(){
     if (yWaardeBird >= y1WaardeLijn - 1 && yWaardeBird <= y2WaardeLijn + 1 && (xWaardeBird >= x1WaardeLijn - 1 && xWaardeBird <= x2WaardeLijn + 1)) {
    drawDeathMessage();
    resetScore();
    resetBackground = false;
    resetBird();
    resetLines();
  }
  if (yWaardeBird >= y1WaardeLijn2 - 1 && yWaardeBird <= y2WaardeLijn2 + 1 && (xWaardeBird >= x1WaardeLijn2 - 1 && xWaardeBird <= x2WaardeLijn2 + 1)) {
    drawDeathMessage();
    resetScore();
    resetBird();
    resetLines();
  }
  if (yWaardeBird >= y1WaardeLijn3 - 1 && yWaardeBird <= y2WaardeLijn3 + 1 && (xWaardeBird >= x1WaardeLijn3 - 1 && xWaardeBird <= x2WaardeLijn3 + 1)) {
    drawDeathMessage();
    resetScore();
    resetBackground = false;
    resetBird();
    resetLines();
  }  
  if (yWaardeBird >= y1WaardeLijn4 - 1 && yWaardeBird <= y2WaardeLijn4 + 1 && (xWaardeBird >= x1WaardeLijn4 - 1 && xWaardeBird <= x2WaardeLijn4 + 1)) {
    drawDeathMessage();
    resetScore();
    resetBackground = false;
    resetBird();
    resetLines();
  } 
}

void drawDeathMessage() {
  birdActive = false;
  resetBackground = true;
  fill(255, 0, 0);
  textSize(32);
  textAlign(CENTER);
  text("Je bent dood!", width / 2, height / 2);
  text("Klik ENTER om opnieuw te starten", width / 2, 410);
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
    birdActive = false;
    resetLines();
    resetBird();
    resetScore();
  }
}

void resetBird() {
  zwaartekracht = 0;
  yWaardeBird = 400;
  sprong = false;
  valSnelheid = 0;
}

void resetScore(){
  score = 0;
}

void resetLines() {
  x1WaardeLijn = 400;
  y1WaardeLijn = random(50, 600);;
  x2WaardeLijn = 400;
  y2WaardeLijn = 800;
  x1WaardeLijn2 = 575;
  y1WaardeLijn2 = random(100, 600);
  x2WaardeLijn2 = 575;
  y2WaardeLijn2 = 800;
  x1WaardeLijn3 = 725;
  y1WaardeLijn3 = random(100, 600);
  x2WaardeLijn3 = 725;
  y2WaardeLijn3 = 800;
  x1WaardeLijn4 = 875;
  y1WaardeLijn4 = random(100, 600);
  x2WaardeLijn4 = 875;
  y2WaardeLijn4 = 800;
}

void score() {
  if (abs(xWaardeBird - x1WaardeLijn) <= 1) {
    score++;
  }
  if (abs(xWaardeBird - x1WaardeLijn2) <= 1) {
    score++;
  }
  if (abs(xWaardeBird - x1WaardeLijn3) <= 1) {
    score++;
  }
  if (abs(xWaardeBird - x1WaardeLijn4) <= 1) {
    score++;
  }
  
  textSize(45);
  text(score, width / 2, 50);
}

void checkBottom() {
  if (yWaardeBird >= height) {
    drawDeathMessage();
    resetBird();
    birdActive = false;
  }
}

void checkTop() {
  if (yWaardeBird <= 0) {
    drawDeathMessage();
    resetBird();
    birdActive = false;
  }
}