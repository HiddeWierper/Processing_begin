import controlP5.*;

ControlP5 cp;
Button knop1;
Button knop2;

void setup(){
  size(800,800);
  
  cp = new ControlP5(this);
  knop1 = cp.addButton("Knop1")
          .setPosition(275,300)
          .setSize(100,100)
          .setCaptionLabel("Klik mij!");
  
  
  cp = new ControlP5(this);
  knop2 = cp.addButton("Knop2")
          .setPosition(450,300)
          .setSize(100,100)
          .setCaptionLabel("Klik mij!");
}

void draw(){

}

void Knop1(){
 println("Goed gedaan!");
}

void Knop2(){
 println("Helaas fout!");
}
