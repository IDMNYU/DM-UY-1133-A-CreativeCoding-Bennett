Agent vehicle;
Enemy villian;
Agent mover;
float attraction = 1.0;
Agent delivery;

void setup() {
  size(600, 600);
  attraction = random(0, 1);
  vehicle = new Agent(width/2, height/2);
  villian = new Enemy(width/2, height/2, attraction);
  mover = new Agent(width/2, 200);
  delivery = new Agent(100, 300);
}



void draw() {
  background(0);

  delivery.checkSides();
  mover.checkSides();
  vehicle.checkSides();
  PVector mouse = new PVector(mouseX, mouseY);

  //mover.walk();  // random walk  //white
  mover.wander(); 
  delivery.walk();
  delivery.flee(mouse); 
  delivery.evade(vehicle);
  //vehicle.seek(mouse);
  //vehicle.arrive(mouse);
  vehicle.walk();
  vehicle.pursue(mover);

  delivery.update();
  vehicle.update();
  villian.update(vehicle); //center
  mover.update();

  delivery.render(0, 255, 0); // the green flee
  villian.render(vehicle.velocity, 1.0, vehicle);
  vehicle.render(197, 127, 230);  //purple
  mover.render(255, 255, 255); // white, captured
}

