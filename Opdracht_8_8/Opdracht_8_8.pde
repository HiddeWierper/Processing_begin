
println("0");
println(0+1);
for (int a = 0, b = 1, i = a + b; i < 9000000; i++) {
  i = a + b;
  println(i);
  
  a = b;
  b = i;
}
