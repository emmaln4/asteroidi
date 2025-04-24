void intro() {

  //gif 
   image(gif[g], 0, -100, width, height + 100);
  g++;
  if (g == f) g = 0;
  
  textFont(space);
  text("asteroids", width/2, 300);
  
  pushMatrix();
  tactile(150, 600, 150, 75);
  noFill();
  stroke(255);
  rect(150, 600, 150, 75);
  popMatrix();
  pushMatrix();
  noFill();
  stroke(255);
  tactile(500, 600, 150, 75);
  rect(500, 600, 150, 75);
  popMatrix();
  
  
  textFont(digital1);
  text("start", 225, 635);
  text("options", 575, 635);
}

void introClicks() {
  if (mouseX > 150 && mouseX < 300 && mouseY > 600 && mouseY < 675){
    mode = GIOCO;
  }
  if (mouseX > 500 && mouseX < 650 && mouseY > 600 && mouseY < 675){
    mode = OPZIONI;
  }
}
