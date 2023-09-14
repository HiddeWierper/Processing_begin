int xWaarde = 10;
int yWaarde = 10;
int widthX = 10;
int heightY = 10;

void setup() {
  size(600, 600);
  background (0);
}

void draw() {
  rect(xWaarde, yWaarde, widthX, heightY);
}

void keyPressed() {
  if (keyCode == RIGHT) {
    xWaarde = xWaarde + 10;
  }
  if (keyCode == DOWN) {
    yWaarde = yWaarde + 10;
  }
  if (keyCode == LEFT) {
    xWaarde = xWaarde - 10;
  }
  if (keyCode == UP) {
    yWaarde = yWaarde - 10;
  }
  background(0);
}
