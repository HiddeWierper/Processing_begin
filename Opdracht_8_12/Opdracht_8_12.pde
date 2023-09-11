/* mijn zelf gemaakte code
size(400, 400);
background(255, 255, 255);

for (int xWaarde = 20, yWaarde = 20, i = 0; i <10; i++) {
  for (int j = 0; j <10; j++) {
    rect(xWaarde, yWaarde, 20, 20);
    yWaarde = yWaarde + 20;
    
if ((i+j) % 2 == 0){
      fill(255, 0, 0);
    }else {
      fill(0,255,0);
}}
  yWaarde = 20;
  xWaarde = xWaarde +20;
  } 
*/
  
  //mijn code in chatgpt gezet en gevraagd waarom het niet werkt zoals verwacht
  
  
  size(400, 400);
background(255, 255, 255);

for (int xWaarde = 20, yWaarde = 20, i = 0; i < 10; i++) {
  for (int j = 0; j < 10; j++) {
    if ((i + j) % 2 == 0) {
      fill(255, 0, 0); // Set fill color to red for even rows and columns.
    } else {
      fill(0, 255, 0); // Set fill color to green for odd rows and columns.
    }
    rect(xWaarde, yWaarde, 20, 20);
    yWaarde = yWaarde + 20;
  }
  yWaarde = 20;
  xWaarde = xWaarde + 20;
}
