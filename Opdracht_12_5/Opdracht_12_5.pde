int beginWaardeX = -1;
int beginWaardeY = -1;
int A;
int B;

void setup(){
  size(500,500);
  background(255);
}

void draw(){
  
}


void mouseClicked(){
    if (beginWaardeX != -1 && beginWaardeY != -1){
    line(beginWaardeX,beginWaardeY,mouseX,mouseY);
  }
   beginWaardeX = mouseX;
   beginWaardeY = mouseY;
}

void keyPressed(){
  if(keyCode == ENTER){
    background(255);
  }
}
