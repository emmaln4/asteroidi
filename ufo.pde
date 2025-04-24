class UFO extends oggettoGioco {
  PVector direzione;
  int intervalloFuoco = 90;
  int contatoreFuoco = 0;
  int dimensioneUFO = 40;

  UFO(PVector posizione, PVector direzione) {
    super(posizione.x, posizione.y, 1, 1);
    this.pos = posizione.copy();
    this.vel = direzione.copy().setMag(2);
    this.direzione = direzione.copy();
    this.vite = 1;
    this.d = dimensioneUFO;
  }

  void mostra() {
    pushMatrix();
    translate(pos.x, pos.y);
    noFill();
    stroke(255);
    strokeWeight(2);
    beginShape();
    vertex(-dimensioneUFO/2, 0);
    bezierVertex(-dimensioneUFO/3, -dimensioneUFO/3, dimensioneUFO/3, -dimensioneUFO/3, dimensioneUFO/2, 0);
    bezierVertex(dimensioneUFO/3, dimensioneUFO/3, -dimensioneUFO/3, dimensioneUFO/3, -dimensioneUFO/2, 0);
    endShape(CLOSE);
    noFill();
    ellipse(0, -dimensioneUFO/6, dimensioneUFO/2, dimensioneUFO/4);
    popMatrix();
  }

  void azione() {
    pos.add(vel);
    contatoreFuoco++;

    if (contatoreFuoco >= intervalloFuoco) {
      sparaAstronave();
      contatoreFuoco = 0;
    }

    if (fuoriSchermo()) {
      vite = 0;
    }

    controllaCollisioni();
  }

  void sparaAstronave() {
  for (oggettoGioco ogg : oggetti) {
    if (ogg instanceof Astronave) {
      PVector versoGiocatore = PVector.sub(ogg.pos, this.pos).normalize();
      versoGiocatore.setMag(1);
      println("UFO spara: da " + pos + " verso " + ogg.pos + " con velocità " + versoGiocatore);
      oggetti.add(new Proiettile(pos.copy(), versoGiocatore, false));
      break;
    }
  }
}


  boolean fuoriSchermo() {
    return (pos.x < -50 || pos.x > width + 50 || pos.y < -50 || pos.y > height + 50);
  }

  void controllaCollisioni() {
    for (int i = oggetti.size() - 1; i >= 0; i--) {
      oggettoGioco ogg = oggetti.get(i);

      if (ogg instanceof Proiettile) {
        Proiettile p = (Proiettile) ogg;

        // Colpito da un proiettile del giocatore
        if (p.daGiocatore && dist(pos.x, pos.y, p.pos.x, p.pos.y) < d / 2 + p.d / 2) {
          this.vite = 0;
          p.vite = 0;
          punti += 150;
        }

        // Se il proiettile è del nemico e colpisce l’astronave
        if (!p.daGiocatore && dist(pos.x, pos.y, p.pos.x, p.pos.y) < d / 2 + p.d / 2) {
          vita--;
          p.vite = 0;
          flash = 5;
          if (vita <= 0) {
            mode = FINE;
          }
        }
      }
    }
  }
}

void generaUFO() {
  int bordo = int(random(4));
  PVector posizione;
  PVector direzione;

  switch (bordo) {
  case 0: // Sinistra → Destra
    posizione = new PVector(40, random(height-40));
    direzione = new PVector(1, random(-0.2, 0.2));
    break;
  case 1: // Destra → Sinistra
    posizione = new PVector(width - 40, random(height-40));
    direzione = new PVector(-1, random(-0.2, 0.2));
    break;
  case 2: // Alto → Basso
    posizione = new PVector(random(width-40), 40);
    direzione = new PVector(random(-0.2, 0.2), 1);
    break;
  case 3: // Basso → Alto
    posizione = new PVector(random(width-40), height - 40);
    direzione = new PVector(random(-0.2, 0.2), -1);
    break;
  default:
    return;
  }

  direzione.setMag(2); // Velocità costante
  oggetti.add(new UFO(posizione, direzione));
}
