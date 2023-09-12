import controlP5.*;

ControlP5 cp;

Button knop1;

Textfield tekstveld1;

void setup() {
  size(800, 800);
  background(255, 255, 255);
  cp = new ControlP5(this);

  knop1 = cp.addButton("Knop1") .setPosition(100, 140) .setCaptionLabel("GA");

  
  tekstveld1 = cp
    .addTextfield("TextInput1")
    .setCaptionLabel("Voer hier Uw prijs Ex. BTW in. ")
    .setText("4.0")
    .setPosition(100, 100)
    .setColorLabel(color(255, 0, 0))
    .setAutoClear(false);
}

void draw() {
}

void Knop1() {
  String invoer = tekstveld1.getText();
  float exclbtw;
  exclbtw = Float.parseFloat(invoer);
  float inclbtw = exclbtw * 1.21;
  
  println("Uw Prijs Incl. BTW is:", inclbtw);
}
