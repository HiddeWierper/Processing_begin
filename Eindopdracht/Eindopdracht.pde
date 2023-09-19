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
  checkTop();
  checkBottom();
  makeLine();
  noStroke();
   makeNewLine();
  ellipse(xWaardeBird, yWaardeBird, 20, 20);
  if  (yWaardeBird <= y1WaardeLijn  ) {
  } else if (abs(xWaardeBird - x1WaardeLijn) <= 1 || abs(xWaardeBird - x2WaardeLijn) <= 1) {
    drawDeathMessage();
    resetBackground = false;
    resetBird();
    resetLines();
  }  

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

void checkResetNeeded() {
  if (resetBackground) {
    background(0);
  } else if (!resetBackground) {
  }
}

   

void makeNewLine(){
    for (float i = x1WaardeLijn + 200, j = x2WaardeLijn + 200; i <= 40000 && j <= 40000; i += 200, j += 200) {
    resetBackground = true;

    float y1WaardeLijn2 = random(100, 600);
    float y2WaardeLijn2 = 800;
    float x1WaardeLijn2 = i;
    float x2WaardeLijn2 = j;

  
    stroke(255,0,255);
    line(i, y1WaardeLijn2, j, y2WaardeLijn2);

    if (yWaardeBird >= y1WaardeLijn2 - 1 && yWaardeBird <= y2WaardeLijn2 + 1 && (xWaardeBird >= x1WaardeLijn2 - 1 && xWaardeBird <= x2WaardeLijn2 + 1)) {
      drawDeathMessage();
      resetBackground = false;
      resetBird();
      resetLines();
    }
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