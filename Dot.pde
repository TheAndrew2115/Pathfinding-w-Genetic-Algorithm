class Dot {
  PVector pos;
  PVector vel;
  PVector acc;
  
  Brain brain;
  
  int radius = 2;
  int maxSpeed = 5;
  boolean dead = false;
  
  Dot() {
    brain = new Brain(400);
    
    pos = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  }

  void show() {
    fill(0);
    ellipse(pos.x,pos.y,2*radius,2*radius);
  }
  
  void move() {
    if(brain.directions.length > brain.step) {
      acc = brain.directions[brain.step];
      brain.step++;
    } else {
      dead = true;
    }
      
    vel.add(acc);
    vel.limit(maxSpeed); // Max magnitude 
    pos.add(vel);
  }
  
  void update() {
    println(pos.x,pos.y);
    if (!dead) {
      move();
      if (pos.x < radius || pos.y < radius || pos.x > width-radius || pos.y > height-radius) {
        dead = true; 
      }
    }
  }
}
