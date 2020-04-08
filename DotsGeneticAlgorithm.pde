import java.lang.System;

Population test;
Goal goal = new Goal(400,10);
HUD hud;

void setup() {
  size(800,800);
  test = new Population(100);
  hud =  new HUD(test);
}

void draw() {
  background(255);
  goal.show();
  hud.show();
  
  if (test.popDead()) {
    test.getFitness(); // Get fitness of all dots in population
    test.naturalSelection(); // Weed out the 'weaker' dots (The ones farther away)
    test.mutate(); // Mutate some of the next generation's dots
  } else {
    test.update();
    test.show();
  }
  
}

void mousePressed() {
    println("Pressed");
    if (hud.overButton((int)hud.rectpos.x,(int)hud.rectpos.y,hud.rectSize,hud.rectSize)) {
      if (test.starting == true) {
        test.starting = false;
      } else {
        test.starting = true;
      }
    }
  }
