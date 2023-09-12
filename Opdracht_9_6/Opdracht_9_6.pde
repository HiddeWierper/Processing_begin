void setup() {
  size(400, 400);
  background(255);
  drawCircles(width / 2, height / 2, 5); 
}

void drawCircles(float x, float y, int numCircles) {
  float spacing = 30; 
  
  for (int i = 0; i < numCircles; i++) {
    float xOffset = i * spacing; 
    ellipse(x + xOffset, y, 30, 30); 
  }
}
