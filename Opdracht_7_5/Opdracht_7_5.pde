
size(600,600);
int cijfer = 4;

switch(cijfer) {
case 1:
case 2:
case 3:
  println(cijfer," Is Slecht");
  break;
case 4: 
  println(cijfer, "Is Onvoldoende");
  break;
case 5:
  println(cijfer, "Is Matig");
  break;
case 6:
case 7:
  println(cijfer,"Is Voldoende");
  break;
case 8:
case 9:
case 10:
  println(cijfer,"Is Goed");
  break;
default:
  println("Er is een verkeerd cijfer ingevoerd.");
}
