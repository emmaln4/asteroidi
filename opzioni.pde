void opzioni() {
  background(0);

  stroke(225);
  fill(0);
  tactile(325, 650, 150, 75);
  rect(325, 650, 150, 75);
  fill(255);
  text("ready", 400, 685);
  
  text("bullet color", 400, 300);
  //text("spaceship color", 400, 500);

  strokeWeight(3);


  for (int i = 0; i <= 700; i++) {
    float hue = map(i, 0, 700, 0, 255);
    color c = color(hue, 255, 255);
    stroke(c);
    line(50 + i, 400, 750 + i, 400);
  }

  //for (int n = 0; n <= 700; n++) {
  //  float hue = map(n, 0, 700, 0, 255);
  //  color c = color(hue, 255, 255);
  //  stroke(c);
  //  line(50 + n, 550, 750 + n, 550);
  //}

  noStroke();
  fill(0);
  rect(750, 0, 50, 800);

  noStroke();
  fill(coloreProiettile);
  circle(sliderX, 400, 25);
  //  fill(coloreProiettile);
  //circle(sliderX2, 550, 25);

  float hue = map(sliderX, 50, 750, 0, 255);
  coloreProiettile = color(hue, 255, 255);
}

void opzioniClicks() {
  if (mouseX > 325 && mouseX < 475 && mouseY > 650 && mouseY < 725) {
    mode = GIOCO;
  }
}

void mouseDragged() {
  controllaSlider();
}

void controllaSlider() {
  if (mouseX > 50 && mouseX < 750 && mouseY > 400 && mouseY < 450) sliderX = mouseX;
  if (mouseX > 50 && mouseX < 750 && mouseY > 525 && mouseY < 575) sliderX2 = mouseX;
}
