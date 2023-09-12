import controlP5.*;

ControlP5 cp;

Button knop1;



Textfield tekstveld1;

void setup() {
  size(800, 800);
  background(255, 255, 255);
  cp = new ControlP5(this);

  knop1 = cp.addButton("Knop1") .setPosition(100,140);


 

  knop1.setCaptionLabel("GA");

  tekstveld1 = cp
    .addTextfield("TextInput1")
    .setCaptionLabel("Voer hier Uw naam in, ")
    .setPosition(100, 100)
    .setText("")
    .setColorLabel(color(255, 0, 0));
    tekstveld1.setAutoClear(false);
  
}


void draw() {
}

void Knop1() {
  println("Hoi Uw naam is, ");
  println(tekstveld1.getText());
}
