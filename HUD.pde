class HUD {
  int gen;
  PVector pos; 
  Population p;
  
  HUD(Population pop) {
    p = pop;
    pos = new PVector(10, 20);
  }
  
  void show() {
    getGen();
    textSize(16);
    fill(0, 102, 153);
    text("Generation: " + gen, pos.x, pos.y);
  }
  
  void getGen() {
    gen = p.generation;
  }
  
}
