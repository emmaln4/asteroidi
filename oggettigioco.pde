class oggettoGioco {

  PVector pos;
  PVector vel;
  int vite;
  float d;
  boolean daGiocotore;

  oggettoGioco(float px, float py, float vx, float vy) {
    pos = new PVector(px, py);
    vel = new PVector(vx, vy);
    vite = 1;
  }

  oggettoGioco(PVector p, PVector v, int t) {
    pos = p;
    vel = v;
    vite = t;
  }

  void azione() {
  }

  void mostra() {
  }

  void continuare() {
    if (pos.x > width) pos.x = 0;
    if (pos.x < 0) pos.x = width;
    if (pos.y > height) pos.y = 0;
    if (pos.y < 0) pos.y = height;
  }  
}
