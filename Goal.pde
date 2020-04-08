class Goal {
  PVector pos;
  int radius = 5;
  
  Goal(int x, int y) {
    pos = new PVector(x,y);
  }
  
  void show() {
    fill(255,0,0); //red
    ellipse(pos.x,pos.y,radius*2,radius*2);
  }
}
