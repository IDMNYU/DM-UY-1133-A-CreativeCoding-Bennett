



void setup(){
  size(800, 600);
  background(0);
}


void draw(){
  
  fill(mouseX, mouseY, 0);
  ellipse(mouseX, mouseY, mouseX, mouseY);
  println(mouseX);
  
  
}