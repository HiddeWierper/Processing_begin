int xWaarde = -1;
int yWaarde = -1;

void setup(){
  size(500,500);
  background(255);
}

void draw(){
  if (xWaarde != -1 && yWaarde != -1){
    color rect1 = color(random(255), random(255), random(255));
    fill(rect1);
    rect(xWaarde,yWaarde,10,10);
           
  }
}



void mousePressed(){
  xWaarde = mouseX;
  yWaarde = mouseY;
  background(255);
}
