size(1200, 1200);
background(255, 255, 255);

int sizeC = 400;
noFill();
for (int i = 0; i < 50; i++) {
  ellipse(400- sizeC/-3, 500 + sizeC/3, sizeC, sizeC);
  sizeC = sizeC - 5;
}
