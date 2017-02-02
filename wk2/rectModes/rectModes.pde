

void setup(){
  size(800, 600);
  
}



void draw(){
  
  background(255);
  fill(255, 0, 255);
  rectMode(RADIUS);
  
  rect(mouseX, mouseY, 50, 50);
  
  rectMode(CORNER);
  fill(0);
  rect(mouseX, mouseY, 50, 50);
  
  fill(255, 255, 0);
  rectMode(CENTER);
  rect(mouseX, mouseY, 50, 50);
  
  
  
}