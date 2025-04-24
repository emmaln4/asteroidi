void gioco() {
 
  background(0);
  

  int i = 0;
  while (i < oggetti.size()) {
    oggettoGioco oggettoAttuale = oggetti.get(i);
    oggettoAttuale.azione();
    oggettoAttuale.mostra();
    if (oggettoAttuale.vite == 0)
      oggetti.remove(i);
    else
      i++;
  }
  
  if (flash > 0) {
    fill(255);
    noStroke();
    rect(0, 0, width, height);
    flash--;
  } 
  
  fill(255);
  textSize(20);
  textFont(digital2);
  text("score: " + punti, 75, 40);
  text("lives: " + vita, 75, 70);
  
  timerUFO++;
  if (timerUFO > intervalloUFO) {
    generaUFO();
    timerUFO = 0;
  }
  
  if (punti >= highscore) highscore = punti;
  
//  if (ogg instanceof Proiettile) {
//  println("Proiettile visibile in: " + oggetti.pos);
//}

}

void giocoClicks() {
}
