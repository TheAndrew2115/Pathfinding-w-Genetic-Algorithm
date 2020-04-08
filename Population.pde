import java.util.HashSet;
class Population {
  Dot[] dots;
  Obstacles obs;
  float fitnessSum;
  int generation = 1;
  int bestDotIndex = 0;
  
  int minStep = 400;
  
  boolean starting = false;
  
  Population(int size) {
    dots = new Dot[size];
    obs = new Obstacles();
    for (int i = 0; i < size; i++) {
      dots[i] = new Dot();
    }
  }
  
  void show() {
    for (int i = 0; i < dots.length; i++) {
      dots[i].show();
    }
    dots[0].show();
  }
  
  void update() {
    if (starting) {
      for (int i = 0; i < dots.length; i++) {
        //println(obs.kill(dots[i].pos));
        if (dots[i].brain.step > minStep) {
          dots[i].dead = true;
        } else if (obs.kill(dots[i].pos)) {
          dots[i].dead = true;
        }else {
          dots[i].update();
        }
      }
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
  
  void naturalSelection() {
    Dot[] newDots = new Dot[dots.length];
    setBestDot();
    calculateFitnessSum();
    
    newDots[0] = dots[bestDotIndex].getBaby(); //This prevents the generations from mutating in a harmful way
    newDots[0].isBest = true;
    
    for (int i = 1; i < newDots.length; i++) {
       Dot parent = selectParent();
       newDots[i] = parent.getBaby();
    }
    dots = newDots.clone();
    generation++;
  }
  
  void calculateFitnessSum() {
    fitnessSum = 0;
    for (int i = 0; i < dots.length; i++) {
      fitnessSum += dots[i].fitness;
    }
  }
  
  Dot selectParent() {
    float rand = random(fitnessSum);
    float runningSum = 0;
    for (int i = 0; i < dots.length; i++) {
      runningSum += dots[i].fitness;
      if (runningSum > rand) {
         return dots[i];
      }
    }
    
    return null;
  }
  
  void mutate() {
    for (int i = 1; i < dots.length; i++) {
      dots[i].brain.mutateBrain();
    }
  }
  
  void setBestDot() {
    float max = 0;
    int maxIndex = 0;
    for (int i = 0; i < dots.length; i++) {
      if (dots[i].fitness > max) {
        max = dots[i].fitness;
        maxIndex = i;
      }
    }
    bestDotIndex = maxIndex;
    
    if (dots[bestDotIndex].reachedGoal) {
      minStep = dots[bestDotIndex].brain.step;
    }
  }
  
}
