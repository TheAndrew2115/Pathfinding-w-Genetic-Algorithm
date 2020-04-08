import java.lang.System;

Population test;
Goal goal = new Goal(400,10);

void setup() {
  size(800,800);
  test = new Population(100);
}

void draw() {
  background(255);
  goal.show();
  
  if (test.popDead()) {
    test.getFitness(); // Get fitness of all dots in population
    test.naturalSelection(); // Weed out the 'weaker' dots (The ones farther away)
    test.mutate(); // Mutate some of the next generation's dots
  } else {
    test.update();
    test.show();
  }
  
}
