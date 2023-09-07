size(600, 600);
background(255, 255, 255);

int sizeC = 60;
int xWaarde = 233;  
int yWaarde = 400;

for (int i = 0; i < 5; i++) {
  
  noFill();
  ellipse(300, 300, sizeC, sizeC);
  sizeC = sizeC - 10;
  println(sizeC);
 
 {
    fill(0,0,0);
    text(sizeC, xWaarde, yWaarde);
    xWaarde = xWaarde + 20;
  
  yWaarde = 400;
xWaarde = xWaarde + 10;
}}


//maten
