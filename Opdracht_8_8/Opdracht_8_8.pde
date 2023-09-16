
println("0");
println(0+1);
for (int a = 0, b = 1, i = a + b; i < 9000000; i++) {
  i = a + b;
  println(i);
  
  a = b;
  b = i;
}
void makeLine() {
  for (float x1 = 400, float y1 = random(50,600), float x2 = 400, float y2 = 800;  ){
  resetBackground = false;
  stroke(255, 255, 255);
  line(x1, y1, x2, y2);
  resetBackground = true;
  }
}