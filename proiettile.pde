class Proiettile extends oggettoGioco {


  boolean daGiocatore;
  int tempo;

  Proiettile() {
    super(mioAstronave.pos.copy(), mioAstronave.dir.copy(), 1);
    vel.setMag(10);
    tempo = 60;
    d = 0.5;
    daGiocatore = true;
  }

  Proiettile(PVector posizione, PVector velocita, boolean daGiocotore) {
    super(posizione.x, posizione.y, 1, 1);
    //this.pos = posizione;
    this.vel = velocita;
    this.daGiocatore = daGiocotore;
    this.d = 10;
  }

  void mostra() {
    //fill(daGiocatore ? color(255) : color(0, 255, 255));
    //fill(255);
    //stroke(255);
    //strokeWeight(2);
    //circle(pos.x, pos.y, d);

    //if (vite <= 0) return;
    //fill(daGiocatore ? color(0, 255, 255) : color(255, 0, 0));
    fill(255);
    //noStroke();
    strokeWeight(1);
    stroke(255);
    rect(10,10, 10, 10);
    ellipse(pos.x, pos.y, d, d);
    println(pos.x, pos.y);
   
  }



  void azione() {
    pos.add(vel);
     println(pos, vel, mioAstronave.pos);

    //if (!daGiocatore) {
    //  for (oggettoGioco ogg : oggetti) {
    //    if (ogg instanceof Astronave) {
    //      Astronave nave = (Astronave) ogg;

    //      // controllo invincibilità
    //      if (nave.tempoInvincibilita == 0 && dist(pos.x, pos.y, nave.pos.x, nave.pos.y) < d / 2 + nave.d / 2) {
    //        nave.vite--;
    //        nave.tempoInvincibilita = 300; // 5 secondo di invincibilità
    //        vite = 0;
    //        flash = 5;

    //        if (nave.vite <= 0) {
    //          mode = FINE;
    //        }
    //        break;
    //      }
    //    }
    //  }
    //}

    tempo--;
    if (tempo <= 0 || pos.x < 0 || pos.x > width || pos.y < 0 || pos.y > height) {
      vite = 0;
    }

    //continuare();
  }
}
