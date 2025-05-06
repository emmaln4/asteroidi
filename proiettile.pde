class Proiettile extends oggettoGioco {

  boolean daGiocatore;
  int tempo = 90;

  Proiettile() {
    super(mioAstronave.pos.copy(), mioAstronave.dir.copy(), 1);
    vel.setMag(10);
    tempo = 60;
    d = 0.5;
    daGiocatore = true;
  }

  Proiettile(PVector posizione, PVector velocita, boolean daGiocotore) {
    super(posizione.x, posizione.y, velocita.x, velocita.y);
    this.daGiocatore = daGiocotore;
    this.d = 0.5;
   
    println("Creato proiettile daGiocatore=" + daGiocatore + " pos=" + posizione + " vel=" + velocita);
  }

  void mostra() {
    //fill(daGiocatore ? coloreProiettile : color(255, 0, 0));
    //noStroke();
   
    fill(coloreProiettile); 
    stroke(coloreProiettile);
  
    ellipse(pos.x, pos.y, d, d);
    println("Mostra proiettile pos=" + pos + " vite=" + vite);
  }





  void azione() {
    pos.add(vel);
    println(pos, vel, mioAstronave.pos);

    if (!daGiocatore) {
      for (oggettoGioco ogg : oggetti) {
        if (ogg instanceof Astronave) {
          Astronave nave = (Astronave) ogg;

          // controllo invincibilità
          if (nave.tempoInvincibilita == 0 && dist(pos.x, pos.y, nave.pos.x, nave.pos.y) < d / 2 + nave.d / 2) {
            nave.vite--;
            nave.tempoInvincibilita = 300; // 5 secondo di invincibilità
            vite = 0;
            flash = 5;

            if (nave.vite <= 0) {
              risultatoFinale = "game over";
              mode = FINE;
            }
            break;
          }
        }
      }
    }

    tempo--;
    if (tempo <= 0 || pos.x < 0 || pos.x > width || pos.y < 0 || pos.y > height) {
      vite = 0;
    }

    //continuare();
  }
}
