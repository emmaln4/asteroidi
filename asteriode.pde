class Asteriode extends oggettoGioco {

  float angolo;
  float rotVelocita;
  PVector[] forma;

  Asteriode(PVector pos, PVector vel, int vite) {
    super(pos.x, pos.y, 1, 1);
    this.pos = pos.copy();
    this.vel = vel.copy();
    this.vite = vite;
    d = vite * 50;
    rotVelocita = random(-2, 2);
    angolo = 0;
    generaForma();
  }

  void generaForma() {
    int punti = int(random(8, 16));
    forma = new PVector[punti];
    for (int i = 0; i < punti; i++) {
      float angoli = map(i, 0, punti, 0, TWO_PI);
      float r = d / 2 + random(-10, 10);
      forma[i] = PVector.fromAngle(angoli).mult(r);
    }
  }

  void mostra() {
    fill(0);
    stroke(255);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(radians(angolo));
    beginShape();
    for (PVector pos : forma) {
      vertex(pos.x, pos.y);
    }
    endShape(CLOSE);
    popMatrix();
    angolo += rotVelocita;
  }

  void azione() {
    pos.add(vel);
    continuare();
    controllarePerCollisioni();
    numeroDiAsteriodi();
  }

  void controllarePerCollisioni() {
    for (int i = 0; i < oggetti.size(); i++) {
      oggettoGioco ogg = oggetti.get(i);

      // === COLLISIONE CON PROIETTILE ===
      if (ogg instanceof Proiettile) {
        if (dist(pos.x, pos.y, ogg.pos.x, ogg.pos.y) < d/2 + ogg.d/2 && ogg.vite > 0) {
          if (vite > 0) {
            PVector nuovoVel1 = vel.copy().rotate(random(PI/6, PI/3)).setMag(vel.mag() * 1.2);
            PVector nuovoVel2 = vel.copy().rotate(random(-PI/3, -PI/6)).setMag(vel.mag() * 1.2);
            PVector nuovoPos1 = PVector.add(pos, nuovoVel1.copy().setMag(10));
            PVector nuovoPos2 = PVector.add(pos, nuovoVel2.copy().setMag(10));
            oggetti.add(new Asteriode(nuovoPos1, nuovoVel1, vite - 1));
            oggetti.add(new Asteriode(nuovoPos2, nuovoVel2, vite - 1));
          } else if (vite == 1) {
          } else {
            
          }

          // Points
          int puntiPerQuesto =0 ;
          if (vite == 3) puntiPerQuesto = 20;
          else if (vite == 2) puntiPerQuesto = 50;
          else puntiPerQuesto = 100;
          
          punti += puntiPerQuesto;
          testiAnimati.add(new testoAnimato(pos.copy(), "+" + puntiPerQuesto));

          vite = 0;
          ogg.vite = 0;
        }
      }

      // === COLLISIONE CON ASTRONAVE ===
      if (ogg instanceof Astronave) {
        Astronave nave = (Astronave) ogg;
  
        if (dist(pos.x, pos.y, nave.pos.x, nave.pos.y) < d/2 + nave.d/2) {
          println("collison");
          nave.vite--;
          vite = 0;
          vita--;
          
          if (vita >= 1) flash = 5;
          if (mioAstronave.vite == 0) {
          risultatoFinale = "game over";
          mode = FINE;
          }
        }
      }
    }
  }

  void numeroDiAsteriodi() {
    int numAsteriodi = 0;
    for (oggettoGioco o : oggetti) {
      if (o instanceof Asteriode && o.vite > 0) {
        numAsteriodi++;
      }
    }

    if (numAsteriodi == 0 && vita > 0) {
      risultatoFinale = "you won!";
      mode = FINE;
    }
    if (vita <= 0) {
      risultatoFinale = "game over";
      mode = FINE;
    }
  }
}
