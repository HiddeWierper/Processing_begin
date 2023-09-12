

void setup(){
  size(600,600);
  kubus(10,10,210,210);
}

void kubus(int a, int b, int c, int d){
  line(a, a, c, a);
  line(a, a, b, c);
  line(a, c, c, d);
  line(c, d, c, a);
  
  

  
}
