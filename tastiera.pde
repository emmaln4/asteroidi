void mouseReleased() {
  if (mode == INTRO) introClicks();
  else if (mode == GIOCO) giocoClicks();
  else if (mode == FINE) fineClicks();
  else if (mode == PAUSA) pausaClicks();
  else if (mode == OPZIONI) opzioniClicks();
}


void keyPressed() {
  if (keyCode == LEFT || key == LEFT) leftkey = true;
  if (keyCode == RIGHT || key == RIGHT) rightkey = true;
  if (keyCode == UP) upkey = true;
  if (keyCode == DOWN) downkey = true;
  if (key == ' ') spacekey = true;
  if (key == 'z') zkey = true;
}

void keyReleased() {
  if (keyCode == LEFT || key == LEFT) leftkey = false;
  if (keyCode == RIGHT || key == RIGHT) rightkey = false;
  if (keyCode == UP) upkey = false;
  if (keyCode == DOWN) downkey = false;
  if (key == ' ') spacekey = false;
  if (key == 'z') zkey = false;
}
