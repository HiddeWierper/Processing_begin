int startTime;
int elapsedTime;
boolean isRunning = false;

void setup() {
  size(600, 600);
  textAlign(CENTER, CENTER);
  textSize(32);
  startTime = millis();
}

void draw() {
  background(220);
  
  if (isRunning) {
    elapsedTime = millis() - startTime;
  }
  
  displayTime(elapsedTime);
}

void keyPressed() {
  if (keyCode == 32) {
    if (isRunning) {
      isRunning = false;
    } else {
      startTime = millis() - elapsedTime;
      isRunning = true;
    }
  }
}

void displayTime(int timeInMillis) {
  int seconds = (int)(timeInMillis / 1000) % 60;
  int minutes = (int)((timeInMillis / (1000 * 60)) % 60);
  int hours = (int)((timeInMillis / (1000 * 60 * 60)) % 24);
  
  String timeStr = nf(hours, 2) + ":" + nf(minutes, 2) + ":" + nf(seconds, 2);
  text(timeStr, width / 2, height / 2);
}
