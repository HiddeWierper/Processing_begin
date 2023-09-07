
print("0, ");
print(0+1);
for (int a = 0, b = 1, i = a + b; i < 9000000; i++) {
  i = a + b;
  print(" ,",i);
  
  a = b;
  b = i;
}
