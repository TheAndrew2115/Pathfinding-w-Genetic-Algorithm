class HUD {
  int gen;
  PVector textpos; 
  PVector rectpos;
  Population p;
  int rectSize = 25;
  
  HUD(Population pop) {
    p = pop;
    textpos = new PVector(10, 20);
    rectpos = new PVector(10, 30);
  }
  
  void show() {
    getGen();
    textSize(16);
    fill(0, 102, 153);
    text("Generation: " + gen, textpos.x, textpos.y);
    
    if (!overButton((int)rectpos.x,(int)rectpos.y,rectSize,rectSize)) {
      fill(0);
      rect(rectpos.x, rectpos.y, rectSize, rectSize);
      fill(255);
      triangle(rectpos.x+5, rectpos.y+5, rectpos.x+5, rectpos.y+rectSize-5,rectpos.x+rectSize-5,rectpos.y+rectSize/2);
    } else {
      fill(60);
      rect(rectpos.x, rectpos.y, rectSize, rectSize);
      fill(245);
      triangle(rectpos.x+5, rectpos.y+5, rectpos.x+5, rectpos.y+rectSize-5,rectpos.x+rectSize-5,rectpos.y+rectSize/2);
    }
  }
  
  void getGen() {
    gen = p.generation;
  }
  
  boolean overButton(int x, int y, int w, int h) {
    if (mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h) {
      return true;
    } else {
      return false;
    }
  }
  
}
