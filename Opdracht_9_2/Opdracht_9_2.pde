float mijnGetal = 6;

void setup(){
  eersteMethode(mijnGetal, 4);
  eersteMethode(mijnGetal, 8);
}

void draw(){
}

void eersteMethode(float getal1, float getal2){
  float gemiddelde = (getal1 + getal2) / 2;
  println(gemiddelde);
  
}
