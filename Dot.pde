class Dot {
  PVector pos;
  PVector vel;
  PVector acc;
  
  Brain brain;
  
  int radius = 2;
  int maxSpeed = 5;
  boolean dead = false;
  boolean reachedGoal = false;
  float fitness = 0;
  
  Dot() {
    brain = new Brain(400);
    
    pos = new PVector(width/2, height-10);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  }

  void show() {
    if (!dead && !reachedGoal) {
      fill(0);
    } else if (dead) {
      fill(255,0,0);
    } else if (reachedGoal) {
      fill(0, 255, 0);
    } else { //this shouldn't happen
      println("ERROR");
      fill(255,255,0);
    }
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
    //println(pos.x,pos.y);
    if (!dead && !reachedGoal) {
      move();
      if (pos.x < radius || pos.y < radius || pos.x > width-radius || pos.y > height-radius) {
        dead = true; 
      } else if (dist(pos.x,pos.y,goal.pos.x,goal.pos.y) < 5) {
        reachedGoal = true;
      }
    }
  }
  
  void getFitness() {
    float distance = dist(pos.x,pos.y,goal.pos.x,goal.pos.y);
    fitness = 1.0/(distance * distance);
  }
  
  Dot getBaby() {
    Dot baby = new Dot();
    baby.brain = brain.clone();
    return baby;
  }
}
