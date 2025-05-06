class testoAnimato {
  
  PVector pos;
  String testo;
  int durata;
  int opacita;
  
  testoAnimato(PVector pos, String testo) {
    this.pos = pos.copy();
    this.testo = testo;
    durata = 60;
    opacita = 255;
  }
  
  void mostra() {
    fill(255, opacita);
    textAlign(CENTER);
    text(testo, pos.x, pos.y);
    pos.y -= 0.5;
    opacita -= 4.5;
    durata--;
  }
  
  boolean finito() {
   return durata <= 0;
  }
}
