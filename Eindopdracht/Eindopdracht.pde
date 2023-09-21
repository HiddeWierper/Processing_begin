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
int highScore = 0;
PImage bg;
PImage birdImg;
float vogelHoek = 0; 

void setup() {
  bg = loadImage("jemoer.jpg");;
  bg.resize(500,800);
  birdImg = loadImage("flappy.png");
  birdImg.resize(60, 40);
  background(bg);
  size(500, 800);
  background(bg);
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
  setLineSpeed();
  noStroke();
  pushMatrix(); 
  translate(xWaardeBird, yWaardeBird);
  rotate(radians(vogelHoek));
  image(birdImg, -birdImg.width/2, -birdImg.height/2); 
  popMatrix();

  textSize(45);
  text(score + "/" + highScore, width / 2, 50 );

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

void setLineSpeed(){
  if (score >= 50){
    zijwaartseKracht = - 0.4;
    lijnSnelheid = -1;
  }
  if (score >= 100){
    zijwaartseKracht = - 0.6;
    lijnSnelheid = -1;
  }
  if (score >= 150){
    zijwaartseKracht = -0.7;
    lijnSnelheid = -1;
  }
  if (score >= 200){
    zijwaartseKracht = - 0.8;
    lijnSnelheid = -1;
  }
  if (score >= 300){
    zijwaartseKracht = - 1;
    lijnSnelheid = -1;
    
  }else if (score >= 400){
    zijwaartseKracht = zijwaartseKracht - 0.000001;
  }
}

void makeLine() {
  resetBackground = false;
  strokeWeight(15);
  stroke(0, 255, 0);
  line(x1WaardeLijn, y1WaardeLijn, x2WaardeLijn, y2WaardeLijn);
  resetBackground = true;
  stroke(0, 255, 0);
  line(x1WaardeLijn2, y1WaardeLijn2, x1WaardeLijn2, y2WaardeLijn2);
  stroke(0, 255, 0);
  line(x1WaardeLijn3, y1WaardeLijn3, x1WaardeLijn3, y2WaardeLijn3);
  stroke(0, 255, 0);
  line(x1WaardeLijn4, y1WaardeLijn4, x1WaardeLijn4, y2WaardeLijn4);
}

void checkResetNeeded() {
  if (resetBackground) {
    background(bg);
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
  y1WaardeLijn = random(100,600);;
  line(x1WaardeLijn,y1WaardeLijn,x2WaardeLijn, y2WaardeLijn);
}

void line2Needed(){
  stroke(255,0,255);
  x1WaardeLijn2 = 650;
  x2WaardeLijn2 = 650;
  y1WaardeLijn2 = random(100,600);;
  line(x1WaardeLijn2,y1WaardeLijn2,x2WaardeLijn2, y2WaardeLijn2);
}

void line3Needed(){
  stroke(255,0,255);
  x1WaardeLijn3 = 650;
  x2WaardeLijn3 = 650;
  y1WaardeLijn3 = random(100,600);;
  line(x1WaardeLijn3,y1WaardeLijn3,x2WaardeLijn3, y2WaardeLijn3);
}

void line4Needed(){
  stroke(255,0,255);
  x1WaardeLijn4 = 650;
  x2WaardeLijn4 = 650;
  y1WaardeLijn4 = random(100,600);;
  line(x1WaardeLijn4,y1WaardeLijn4,x2WaardeLijn4, y2WaardeLijn4);
}
  
void checkIfDead(){
  if (yWaardeBird >= y1WaardeLijn - 1 && yWaardeBird <= y2WaardeLijn + 1 && (xWaardeBird >= x1WaardeLijn - 1 && xWaardeBird <= x2WaardeLijn + 1)) {
    resetBackground = true;
    drawDeathMessage();
    resetBird();
    resetLines();
  }
  if (yWaardeBird >= y1WaardeLijn2 - 1 && yWaardeBird <= y2WaardeLijn2 + 1 && (xWaardeBird >= x1WaardeLijn2 - 1 && xWaardeBird <= x2WaardeLijn2 + 1)) {
    drawDeathMessage();
    resetBird();
    resetLines();
  }
  if (yWaardeBird >= y1WaardeLijn3 - 1 && yWaardeBird <= y2WaardeLijn3 + 1 && (xWaardeBird >= x1WaardeLijn3 - 1 && xWaardeBird <= x2WaardeLijn3 + 1)) {
    drawDeathMessage();
    resetBackground = false;
    resetBird();
    resetLines();
  }  
  if (yWaardeBird >= y1WaardeLijn4 - 1 && yWaardeBird <= y2WaardeLijn4 + 1 && (xWaardeBird >= x1WaardeLijn4 - 1 && xWaardeBird <= x2WaardeLijn4 + 1)) {
    drawDeathMessage();
    resetBackground = false;
    resetBird();
    resetLines();
  } 
}

void drawDeathMessage() {
  birdActive = false;
  resetBackground = true;
  noLoop();
  fill(255, 0, 0);
  textSize(32);
  textAlign(CENTER);
  text("Je bent dood!", width / 2, height / 2);
  text("Je score was: " + score, width /2, 450);
  text("Klik op ENTER om opnieuw te starten", width / 2, 500);
}

void keyPressed() {
  if (keyCode == 32) {
    vogelHoek = 315;
    yWaardeBird = yWaardeBird - 20;
    sprong = true;
    zwaartekracht = 0.2;
    valSnelheid = -5;
    birdActive = true;
  }
  if (keyCode == ENTER) {
    birdActive = false;
    redraw();
    loop();
    resetLines();
    resetBird();
    resetScore();
  }
}

void keyReleased() {
  vogelHoek = 0;
}

void touchStarted(){
    vogelHoek = 315;
    yWaardeBird = yWaardeBird - 20;
    sprong = true;
    zwaartekracht = 0.2;
    valSnelheid = -5;
    birdActive = true;
}

void touchEnded(){
  vogelHoek = 0;
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

  if (score >= highScore){
    highScore = score;
  }
}

void checkBottom() {
  if (yWaardeBird >= height) {
    drawDeathMessage();
    birdActive = false;
    noLoop();
    resetLines();
    resetBird();
  }
}

void checkTop() {
  if (yWaardeBird <= 0) {
    drawDeathMessage();
    birdActive = false;
    noLoop();
    resetLines();
    resetBird();

  }
}