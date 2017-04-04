class Agent {

  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector v;

  int bigC, littleC;
  float max, radSec;
  float maxSpeed = 5.0;
  float maxForce = 3.0;
  float maxPursue = 20.0;
  float maxEvade = 10.0;
  float wandertheta;
  PVector noiseoff;
  color skin;

  Agent(int x, int y) {

    acceleration = new PVector(0, 0);
    location = new PVector(0, 0);
    velocity = new PVector(0, 0);
    bigC = 40;
    littleC = 30;
    max = 3;
    noiseoff = new PVector(random(1000), random(1000));
    wandertheta = 0;
  }

  void update() {
    /*
    PVector mouse = new PVector(mouseX, mouseY);
     PVector dir = PVector.sub(mouse, location);
     dir.normalize();
     dir.mult(4);
     acceleration = dir;
     */
    velocity.add(acceleration);
    velocity.limit(max);
    location.add(velocity);
    acceleration.mult(0);
  }
  void applyForce(PVector force) {
    //mass here
    acceleration.add(force);
  }

  void walk() {
    velocity.x = map(noise(noiseoff.x), 0, 1, -1, 1);
    velocity.y = map(noise(noiseoff.y), 0, 1, -1, 1);
    velocity.mult(5);
    noiseoff.add(0.01, 0.01, 0);
    //constrain
  }

  void seek(PVector target) {
    PVector desired = PVector.sub(target, location);
    desired.normalize();
    desired.mult(maxSpeed);
    PVector steering = PVector.sub(desired, velocity);
    steering.limit(maxForce);
    applyForce(steering);
  }

  void arrive(PVector target) {
    PVector desired = PVector.sub(target, location);
    float d = desired.mag();
    if (d < 100) {
      float m = map(d, 0, 100, 0, maxSpeed);
      desired.setMag(m);
    } else {
      desired.setMag(maxSpeed);
    }
    PVector steering = PVector.sub(desired, velocity);
    steering.limit(maxForce);
    applyForce(steering);
  }

  void flee(PVector target) {

    PVector t = target.get();

    PVector steering;
    //PVector desired = PVector.sub(t, location);
    PVector desired = PVector.sub(location, t);
   float distance = desired.mag();
    //distance = constrain(distance, 5, 50);
    /*
    desired.normalize();
    desired.mult(maxSpeed);
    steering = PVector.sub(desired, velocity); */

    if (distance > 0 && distance < 150) {
      desired.setMag(maxSpeed);  //<- this max force might be greater to flee more quickly
      // steering = PVector.sub(velocity, desired);
     
      steering = PVector.sub(desired, velocity);
    } else {
      steering = new PVector(0, 0);
    }
    // don't really need this line of code bc already checking this distance
    //steering.limit(maxForce);  //<- this max force might be greater to flee more quickly
    applyForce(steering);
  }

  void wander() {
   
    float wanderR = 25;  //smooth undulating to ballroom dancing  
     float wanderD = 80;    // distance from the wander circle
     float change = 0.3;
     wandertheta += random(-change, change);    // randomly changes wander theta
     
     // now calculare the new location to steering towards on circle
     PVector circleloc = velocity.get(); // starting velocity
     circleloc.normalize();
     circleloc.mult(wanderD);
     circleloc.add(location);
     
    // float h = velocity.heading2D(); // We need to know the heading to offset wandertheta
     PVector circleOffSet = new PVector(wanderR*cos(wandertheta), wanderR*sin(wandertheta));
     PVector target = PVector.add(circleloc, circleOffSet);
     seek(target);
     
  }

  void pursue(Agent a) {
/*
    PVector steer = new PVector();
    Agent boid = a;
    steer = PVector.sub(a.location, location); // get the velocity
    steer.normalize(); // normalize it
    steer.mult(maxPursue); // how far ahead are we looking?
    PVector predictLoc = PVector.add(a.location, steer);
    arrive(predictLoc); 
    */
     PVector avel = a.velocity;
     avel.normalize();
     avel.mult(10);
     PVector predictedLoc = PVector.add(a.location, avel);
     arrive(predictedLoc); 
     
  }

  void evade(Agent a) {
    PVector steer = new PVector();
    //Agent predator = a;

    //PVector d = PVector.sub(location, predator.location);
   
    PVector d = PVector.sub(a.location, location);
    float distance = d.mag();
    
    d.setMag(maxEvade);
    PVector predictLoc = PVector.add(a.location, d);
    flee(predictLoc);
    
    /* 
    // the look ahead time is proportional to the distance btwn the 2
    //the look ahead time is inversly proportional to the sum of the speed of the 2

    PVector vels = PVector.add(a.velocity, velocity);
    
    PVector lookAheadTime = PVector.div(vels, distance);
    PVector avel = a.velocity.get();
    // flee away from future position of the two
    PVector target = location + avel * lookAheadTime;
    
    flee(target);
    */
    
    
    /*

    if ( distance < 150) {
      //increase speed
      PVector avel = a.velocity.get();
      avel.setMag(maxEvade);
      PVector predictLoc = PVector.add(a.location, avel);
      flee(predictLoc);
      /*
      steer = flee(predator.location); // <-- address where it drops out
       steer.mult(maxEvade);  // <-- address where it drops out
     
    } else {
      steer = new PVector(0, 0);
      applyForce(steer);
    }
    
    */
  }

  void render(int r, int g, int b) {
    skin = color(r, g, b);
    // Draw a triangle rotated in the direction of velocity
    float theta = velocity.heading2D() + PI/2;
    stroke(95, 164, 255);
    strokeWeight(2);
    noFill();
    pushMatrix();
    translate(location.x, location.y);
    ellipse(0, 0, bigC, bigC); //variable ellipse(location.x, location.y, bigC, bigC); //variable 
    fill(skin);
    //fill(95, 164, 255);
    ellipse(0, 0, littleC, littleC); //variable ellipse(location.x, location.y, bigC, bigC); //variable 
    noFill();
    //fill(skin);

    fill(197, 127, 230);
    noStroke(); 

    radSec = 0;
    rotate(theta);
    //rotate(radians(radSec));  // use this to rotate for time
    triangle( -9, 0, 0, -40, 9, 0);
    stroke(144, 232, 146);
    line(0, -20, 0, -50);
    popMatrix();
  }

  void checkSides() {

    if (location.x > width) {
      location.x = 0;
    }

    if (location.x < 0) {
      location.x = width;
    }

    if (location.y > height) {
      location.y = 0;
    }
    if (location.y < 0) {
      location.y = height;
    }
  }
}

