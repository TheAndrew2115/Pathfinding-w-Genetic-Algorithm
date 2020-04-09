import java.util.HashSet;

class Obstacles {
  
  HashSet<PVector> s;
  
  Obstacles() {
    s = new HashSet<PVector>();
  }
  
  void addPVector(PVector v) {
    s.add(v);
  }
  
  void show() {
    for (PVector temp : s) {
      fill(0);
      ellipse(temp.x,temp.y,4,4);
    }
  }
  
  boolean kill(PVector p) {
    for (int i = -4; i < 5; i++) {
      for (int j = -4; j < 5; j++) {
        PVector scan = new PVector((int)p.x - i, (int) p.y- j);
        if (s.contains(scan)) {
          return true;
        }
      }
    }
    return false;
  }
  
}
