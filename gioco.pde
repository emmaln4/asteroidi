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

  for (int n = testiAnimati.size() - 1; n >= 0; n--) {
    testoAnimato t = testiAnimati.get(n);
    t.mostra();
    if (t.finito()) {
      testiAnimati.remove(n);
    }
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
  text("lives: " + mioAstronave.vite, 75, 70);

  timerUFO++;
  if (timerUFO > intervalloUFO) {
    generaUFO();
    timerUFO = 0;
  }

  if (punti >= highscore) {
    highscore = punti;


      fill(255);
    textFont(digital2);
    text("teleport in " + (mioAstronave.cooldownTeleport / 60) + "s", width/2, height - 20);
  } else {
    fill(0, 255, 0);
    textFont(digital2);
    text("teleport avaliable [Z]", width/2, height - 20);
  }
}



void giocoClicks() {
}
