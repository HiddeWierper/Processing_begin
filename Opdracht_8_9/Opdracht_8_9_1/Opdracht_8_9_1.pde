size(1500, 900);
background(255, 255, 255);

int sizeC = 60;
int xWaarde = 125;  
int yWaarde = 700;

for (int i = 0; i < 50; i++) {
  
  noFill();
  ellipse(750, 450, sizeC, sizeC);
  sizeC = sizeC - 10;
  println(sizeC);
 
 {
    fill(0,0,0);
    text(sizeC, xWaarde, yWaarde);
    xWaarde = xWaarde + 20;
  
  yWaarde = 700;
xWaarde = xWaarde + 5;
}}
