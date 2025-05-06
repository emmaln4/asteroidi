void fine() {
  
  background(0);
  
  //if (vita == 0) {
  //textFont(space);
  //text("game over", width/2, height/2);
  //textFont(digital2);
  //text("highscore: " + highscore, width/2, 500);
  //} else if (numAsteriodi == 0) {
  //  textFont(space);
  //  text("you won!", width/2, height/2);
  //  textFont(digital2);
  //  text("highscore: " + highscore, width/2, 500);
  //}
  
 
 
  fill(255);
  textFont(space);
  text(risultatoFinale, width / 2, height / 2);
  textFont(digital2);
  text("highscore: " + highscore, width/2, 500);
}

void fineClicks(){
  if (mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height) mode = INTRO;
  vita = 3;
  punti = 0;
  nuovoGioco();
}

void nuovoGioco() {
  oggetti.clear(); 

  for (int i = 0; i < 2; i++) {
    PVector pos = new PVector(random(width), random(height));
    PVector vel = PVector.random2D().mult(random(1.5, 2.5));
    oggetti.add(new Asteriode(pos, vel, 3));
  }
  

  mioAstronave = new Astronave();
  oggetti.add(mioAstronave);
}
