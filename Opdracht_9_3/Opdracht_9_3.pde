float mijnGetal;

void setup(){
  mijnGetal = eersteMethode(4,9);
  println(mijnGetal);
}

void draw(){
}

float eersteMethode(float getal1, float getal2){
  float gemiddelde = (getal1 + getal2) / 2;
  return gemiddelde;
  
}
