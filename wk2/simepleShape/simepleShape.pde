void setup(){
  size(800, 600);
  background(255); // white
  
  fill(0);  // black
  stroke(255, 0, 0);  // color of the line  RED
  strokeWeight(30); // thickness of the line
  
  
  
}


void draw(){
  //4 parameters: (x, y, width, height)
  //
  ellipse(50, 50, 100, 50); // circle
  rect(150, 150, 100, 100); // square
  line(400, 0, 400, 300);
  point(450, 450); //dot
  
  
}