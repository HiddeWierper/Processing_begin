float bird;
float xWaardeBird = 150;
float yWaardeBird = 400;
float valSnelheid;
float zwaartekracht;
boolean sprong = false;
float x1WaardeLijn = 400;
float y1WaardeLijn = random(50, 600);
float x2WaardeLijn = 400;
float y2WaardeLijn = random(600, 800); // Random line length
boolean resetBackground;
boolean birdActive = false;
float lijnSnelheid;
float zijwaartseKracht;
int aantalLijnen = 5; // Aantal lijnen dat je wilt hebben
float[] x1WaardeLijnen = new float[aantalLijnen];
float[] x2WaardeLijnen = new float[aantalLijnen];
float[] y1WaardeLijnen = new float[aantalLijnen];
float[] y2WaardeLijnen = new float[aantalLijnen];

void setup() {
  background(0);
  size(500, 800);
  background(0);
  fill(255, 0, 0);
  frameRate(80);
  for (int i = 0; i < aantalLijnen; i++) {
    x1WaardeLijnen[i] = 400 + i * 200; // Begin x1-waarden met tussenruimte van 200 pixels
    x2WaardeLijnen[i] = 400 + i * 200; // Begin x2-waarden met tussenruimte van 200 pixels
    y1WaardeLijnen[i] = random(50, 600); // Willekeurige y1-waarden
    y2WaardeLijnen[i] = random(600, 800); // Willekeurige line lengths
  }
}

void draw() {
  resetBackground = true;
  checkResetNeeded();
  checkTop();
  checkBottom();
  makeLine();
  noStroke();
  ellipse(xWaardeBird, yWaardeBird, 20, 20);
  for (int i = 0; i < aantalLijnen; i++) {
    if (
      xWaardeBird + 10 >= x1WaardeLijnen[i] && // Controleer rechterkant vogel
      xWaardeBird - 10 <= x2WaardeLijnen[i] && // Controleer linkerkant vogel
      yWaardeBird + 10 >= y1WaardeLijnen[i] && // Controleer onderkant vogel
      yWaardeBird - 10 <= y2WaardeLijnen[i]    // Controleer bovenkant vogel
    ) {
      // Vogel botst tegen de lijn
      drawDeathMessage();
      resetBackground = false;
      resetBird();
      resetLines();
    }
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
  }
}

void makeLine() {
  resetBackground = false;
  for (int i = 0; i < aantalLijnen; i++) {
    stroke(255, 255, 255);
    line(x1WaardeLijnen[i], y1WaardeLijnen[i], x2WaardeLijnen[i], y2WaardeLijnen[i]);
  }
  resetBackground = true;
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

void resetLines() {
  for (int i = 0; i < aantalLijnen; i++) {
    x1WaardeLijnen[i] = 400 + i * 200;
    x2WaardeLijnen[i] = 400 + i * 200;
    y1WaardeLijnen[i] = random(50, 600);
    y2WaardeLijnen[i] = random(600, 800);
  }
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
