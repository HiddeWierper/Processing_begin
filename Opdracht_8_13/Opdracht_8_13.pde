size(600,600);
background(255,255,255);

int tafel = 5;
int antwoord = 0;
int xWaarde = 20;
int yWaarde = 20;

for(int i = 0; i <=100; i++){
 
  antwoord = tafel * i;
  fill(255,0,0);
  text(tafel + "*" + i + "=", xWaarde, yWaarde);
  text(antwoord, xWaarde + 40,yWaarde);

yWaarde = yWaarde + 20;
}
