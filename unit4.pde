//emma adkins
//marzo 31, 2025

import java.util.ArrayList;

int mode;
final int INTRO   = 0;
final int GIOCO   = 1;
final int FINE    = 2;
final int PAUSA   = 3;
final int OPZIONI = 4;

Astronave mioAstronave;



ArrayList<oggettoGioco> oggetti;
ArrayList<testoAnimato> testiAnimati;

//varabili tastiera
boolean leftkey, rightkey, upkey, downkey, spacekey, zkey;

//gif
PImage[] gif;
int f, g, n;

//font
PFont space, digital1, digital2;


//punti
int punti = 0;
int vita = 3;
int highscore = 0;

int flash = 0;

int numAsteriodi = 0;
int maxAsteriodi = 3;

//ufo 
int timerUFO = 0;
int intervalloUFO = 600;
boolean daGiocatore;

int tempoInvincibilita = 0;

//slider 
float sliderX;
float sliderX2;

color coloreProiettile = color(255);

String risultatoFinale = " ";

//telesporto
int cooldownTeleport = 0;
boolean teleportDisponibile = true;


void setup() {
  mode = INTRO;
  size(800, 800);
  background(0);
  colorMode(HSB, 255);

  oggetti = new ArrayList();
  testiAnimati = new ArrayList();
  mioAstronave = new Astronave();
  oggetti.add(mioAstronave);
  PVector pos = new PVector(random(width), random(height));
  PVector pos1 = new PVector(random(width), random(height));
  PVector pos2 = new PVector(random(width), random(height));
  PVector vel = PVector.fromAngle(random(TWO_PI));
  PVector vel1 = PVector.fromAngle(random(TWO_PI));
  PVector vel2 = PVector.fromAngle(random(TWO_PI));
  vel.setMag(random(0.5, 2));
  oggetti.add(new Asteriode(pos, vel, 3));
  oggetti.add(new Asteriode(pos1, vel1, 3));
  oggetti.add(new Asteriode(pos2, vel2, 3));
  oggetti.add(new Proiettile(new PVector(width/2, height/2), new PVector(2, 0), true));


  
  
  //gif
  f = 407;
  g = 0;
  gif = new PImage[f];

  int a = 0;
  while ( a < f ) {
    gif[a] = loadImage("gif" +a+ ".gif");
    a++;
  }

  //font
  textAlign(CENTER, CENTER);
  space = createFont("space.ttf", 100);
  digital1 = createFont("digital.ttf", 50);
  digital2 = createFont("digital.ttf", 25);
  
  //lo slider
  sliderX = 50;
  sliderX2 = 50;

  //setup tastiera
  leftkey = rightkey = upkey = downkey = spacekey = zkey =false;
 
}

void draw() {
  if (mode == INTRO) intro();
  else if (mode == GIOCO) gioco();
  else if (mode == FINE) fine();
  else if (mode == PAUSA) pausa();
  else if (mode == OPZIONI) opzioni();
  
}

void tactile (int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    strokeWeight(3);
  } else {
    strokeWeight(1);
  }
}
