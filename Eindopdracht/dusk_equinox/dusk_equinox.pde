float bird;
float xWaardeBird = 150;
float yWaardeBird = 400;
float birdRadius = 10; // De straal van de cirkelhitbox voor de bird

float valSnelheid;
float zwaartekracht;
boolean sprong = false;

float x1WaardeLijn = 400;
float y1WaardeLijn = random(50, 600);;
float x2WaardeLijn = 400;
float y2WaardeLijn = 800;
float lijnBreedte = 5; // De breedte van de lijnhitbox

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
  ellipse(xWaardeBird, yWaardeBird, birdRadius * 2, birdRadius * 2);

  // Bereken de positie van de bird hitbox
  float birdHitboxX = xWaardeBird;
  float birdHitboxY = yWaardeBird;
  
  // Bereken de posities van de lijn hitboxen
  float lijn1HitboxX1 = x1WaardeLijn - lijnBreedte / 2;
  float lijn1HitboxX2 = x2WaardeLijn + lijnBreedte / 2;
  float lijn1HitboxY1 = min(y1WaardeLijn, y2WaardeLijn);
  float lijn1HitboxY2 = max(y1WaardeLijn, y2WaardeLijn);

  // Controleer of de bird hitbox de lijn hitbox overlapt
  if (birdHitboxX + birdRadius >= lijn1HitboxX1 && birdHitboxX - birdRadius <= lijn1HitboxX2 &&
      birdHitboxY + birdRadius >= lijn1HitboxY1 && birdHitboxY - birdRadius <= lijn1HitboxY2) {
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
    if (yWaardeBird > height - birdRadius) {
      yWaardeBird = height - birdRadius;
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

  if (birdActive){
    x1WaardeLijn = x1WaardeLijn - 1;
    x2WaardeLijn = x2WaardeLijn - 1;
    zijwaartseKracht = 0.2;
    lijnSnelheid = -1;
  }
}

void checkResetNeeded() {
  if (resetBackground){
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
}

void makeLine() {
  resetBackground = false;
  stroke(255, 255, 255);
  line(x1WaardeLijn, y1WaardeLijn, x2WaardeLijn, y2WaardeLijn);
  line(x1WaardeLijn2, y1WaardeLijn2, x2WaardeLijn2, y2WaardeLijn2); // Voeg deze lijn toe voor de nieuwe lijnen
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
