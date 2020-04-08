class Population {
  Dot[] dots;
  
  Population(int size) {
    dots = new Dot[size];
    for (int i = 0; i < size; i++) {
      dots[i] = new Dot();
    }
  }
  
  void show() {
    for (int i = 0; i < dots.length; i++) {
      dots[i].show();
    }
  }
  
  void update() {
    for (int i = 0; i < dots.length; i++) {
      dots[i].update();
    }
  }
  
  void getFitness() {
    for (int i = 0; i < dots.length; i++) {
      dots[i].getFitness(); 
    }
  }
  
  boolean popDead() {
    for (int i = 0; i < dots.length; i++) {
      if (!dots[i].dead && !dots[i].reachedGoal) {
        return false;
      }
    }
    return true;
  }
  
}
