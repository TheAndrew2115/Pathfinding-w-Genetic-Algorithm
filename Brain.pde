class Brain {
  PVector[] directions;
  int step = 0;
  float mutationChance = 0.01; //The chance which a specific direction can be overwritten
  
  Brain(int size) {
    directions = new PVector[size];
    randomize();
  }
  
  void randomize() {
     for (int i = 0; i < directions.length; i++) {
       float randomAngle = random(2*PI); //radians
       directions[i] = PVector.fromAngle(randomAngle);
     }
  }
  
  Brain clone() {
    Brain clone = new Brain(directions.length);
    for (int i = 0; i < directions.length; i++) {
      clone.directions[i] = directions[i].copy(); // we will make the clone the same
    }
    return clone;
  }
  
  void mutateBrain() {
     for (int i = 0; i < directions.length; i++) {
       float rand = random(1);
       if (rand < mutationChance) {
         float randomAngle = random(2*PI);
         directions[i] = PVector.fromAngle(randomAngle);
       }
     }
  }
  
}
