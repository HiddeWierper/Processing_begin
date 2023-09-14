/*

 1.1.1
 true
 false
 false
 false
 
 1.1.2
 
 true
 true
 true
 false
 
 1.2.1
 
 true
 true
 false
 true
 true
 
 1.3.1
 
 false
 true
 true
 true
 true
 
 1.4.1
 
 true
 true
 false
 true
 */

//1.5.1

int tempratuurCelsius = 28;

if (tempratuurCelsius >25) {
  println("warm");
} else if (tempratuurCelsius >= 30) {
  println("heet");
}

//1.6.1

int speler1Score = 30;
int speler2Score = 30;

if (speler1Score > speler2Score) {
  println("Speler 1 heeft gewonnen");
} else if (speler2Score > speler1Score) {
  println("Speler 2 heeft Gewonnen");
} else if (speler1Score == speler2Score) {
  println("Het is gelijkspel");
}

//1.7.1
int x = 5;
int y = 11;

if (x > 10) {
  x = x - 5;
  if (x > 10 || y <= 10) {
    x++;
    y++;
  }
} else {
  println("hier wil ik zijn ");
}

//1.8.0
int lessenGeweest = 17;
int totaalLessen = 20;
float cijfer = 7;

if (100 / totaalLessen * lessenGeweest  >= 80 && cijfer > 5.5) {
  println("geslaagd");
} else {
  println("helaas u bent gezakt"  );
}

//1.8.1
int lessenKGeweest = 16;
int totaalKLessen = 20;
float cijferK = 5.5;

if (100 / totaalKLessen * lessenKGeweest  >= 80 && cijferK > 5.5) {
  println("geslaagd");
} else {
  println("helaas u bent gezakt");
}

//1.9.0
/*
boolean spelerRaaktVijand();
boolean spelerPaktAppel();
boolean spelerIsOnoverwinnelijk();
int voegPuntToeAanScore();

if(spelerPaktAppel()) {
  voegPuntToeAanScore();
}

if(spelerRaaktVijand() && spelerIsOnoverwinnelijk()) {
  voegPuntToeAanScore();
} else if(spelerRaaktVijand() && spelerIsOnoverwinnelijk() == false) {
  println("af");
}
*/
//1.10.0
//2 en 4
