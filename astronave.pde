class Astronave extends oggettoGioco {

  //varabili
  PVector dir;
  int smettere;
  int vite;
  int angolo = 0;


  //constructori

  Astronave() {
    super(width/2, height/2, 0, 0);
    dir = new PVector(1, 0);
    smettere = 0;
    vite = 3;

  }

  //funzioni

  void mostra() {
    if (tempoInvincibilita > 0 && frameCount % 10 < 5) {
    
    pushMatrix();
    translate(pos.x, pos.y);
    stroke(255);
    fill(255, 255, 255, 50);
    circle(-3, 0, 50);
    popMatrix();
    
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(dir.heading());
    disegnareNave();
    popMatrix();
    } else 
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(dir.heading());
    disegnareNave();
    popMatrix();
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
  }
}
