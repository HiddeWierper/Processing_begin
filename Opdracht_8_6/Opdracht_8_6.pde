size(600,600);
background(255,255,255);

int sizeC = 200;

for(int i = 0; i < 5; i++){
  ellipse(300 - sizeC/2, 300 - sizeC/8, sizeC,sizeC);
  sizeC = sizeC - 20;
}
