class Astronave extends oggettoGioco {

  //varabili
  PVector dir;
  int smettere;
  int vite;
  int angolo = 0;
  boolean teleportDisponibile = true;
  int tempoUltimoTeleport = -10000;
  int cooldownTeleport = 0;

  //constructori

  Astronave() {
    super(width/2, height/2, 0, 0);
    dir = new PVector(1, 0);
    smettere = 0;
    vite = 3;
    d = 15;

    teleportDisponibile = true;
    cooldownTeleport = 0;
  }

  //funzioni

  void mostra() {
    if (tempoInvincibilita > 0 && frameCount % 10 < 5) {

      pushMatrix();
      translate(pos.x, pos.y);
      stroke(255);
      fill(coloreProiettile, 100);
      circle(-3, 0, 50);
      popMatrix();

      pushMatrix();
      translate(pos.x, pos.y);
      rotate(dir.heading());
      disegnareNave();
      popMatrix();
    } else {
      pushMatrix();
      translate(pos.x, pos.y);
      rotate(dir.heading());
      disegnareNave();
      popMatrix();
    }
  }

  void disegnareNave() {
    stroke(255);
    line(1, 0, -10, 10);
    line(1, 0, -10, -10);
    line(-10, -10, 9, 0);
    line(-10, 10, 9, 0);
  }

  int tempoInvincibilita = 0;
  void azione() {
    if (tempoInvincibilita > 0) tempoInvincibilita--;
    muovere();
    sparare();
    controllarePerCollisioni();
    continuare();

    if (cooldownTeleport > 0) {
      cooldownTeleport--;
      if (cooldownTeleport == 0) teleportDisponibile = true;
    }

    if (zkey && teleportDisponibile) {
      PVector nuovaPos = posizioneSicura();
      if (nuovaPos != null) {
        pos = nuovaPos;
        vel = new PVector(); // ferma la nave dopo il teleport
        cooldownTeleport = 900; // 30 secondi (60 fps)
        teleportDisponibile = false;
      }
    }
  }

  void muovere() {

    if (upkey) {
      PVector forza = dir.copy().mult(0.2);
      vel.add(forza);
    }
    if (downkey) {
      PVector inverso = dir.copy().mult(-0.1);
      vel.add(inverso);
    }
    if (leftkey) dir.rotate(-radians(4));
    if (rightkey) dir.rotate(radians(4));

    pos.add(vel);
    vel.mult(0.99);
  }

  void sparare() {
    smettere--;
    if (spacekey && smettere <= 0) {
      oggetti.add(new Proiettile());
      smettere = 30;
    }
  }

  void controllarePerCollisioni() {
    for (int i = oggetti.size() - 1; i >= 0; i--) {
      oggettoGioco ogg = oggetti.get(i);

      if (ogg instanceof Proiettile) {
        Proiettile p = (Proiettile) ogg;

        if (!p.daGiocatore && dist(pos.x, pos.y, p.pos.x, p.pos.y) < d / 2 + p.d / 2) {
          if (tempoInvincibilita == 0) {
            vite--;
            vita--;
            tempoInvincibilita = 300;  // Attiva l'invincibilità dopo il danno
            flash = 5;

            println("COLPITO DALL'UFO");

            if (vite <= 0) {
              risultatoFinale = "game over";
              mode = FINE;
            }
          }

          p.vite = 0;  // Il proiettile sparisce comunque
        }
      }
    }
  }

  PVector posizioneSicura() {
    for (int tentativi = 0; tentativi < 100; tentativi++) {
      float x = random(width);
      float y = random(height);
      boolean sicuro = true;

      for (oggettoGioco ogg : oggetti) {
        if (ogg instanceof Asteriode || ogg instanceof UFO) {
          if (dist(x, y, ogg.pos.x, ogg.pos.y) < 200) {
            sicuro = false;
            break;
          }
        }
      }

      if (sicuro) return new PVector(x, y);
    }

    return null; // non trovato
  }
}
