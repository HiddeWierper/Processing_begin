int spatieBalkKlikken = 0;
int time = 11000+ millis();
int timer;
int b;

boolean endTime = false;
boolean restart = false;

void setup() {
  background(0);
  size(200,200);
}


void draw() {
  timer = time - millis();

if (keyCode == 32 && endTime ==false){
  background(0);
  text(timer / 1000,65,100);
  text(spatieBalkKlikken ,10,30);
  }
  if (timer <0){
   endTime = true; 
  }
}

void keyPressed(){
  
    if (keyCode == 32) {
      spatieBalkKlikken++;

    
  } 
}

int spatieBalkKlikken(){
 return spatieBalkKlikken++; 
}   
