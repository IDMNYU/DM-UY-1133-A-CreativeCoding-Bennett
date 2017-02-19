var x = 0;

var y = 0;

function setup() { 
  createCanvas(400, 400);
  background(88, 170, 232);
  noStroke();
} 

function draw() { 
  bump();
  x = 200;
  bump();
  y = 100;
  bump();
}

function bump(){
  //var x = 0, y = 0;
  noStroke();
  fill(51,255,142);  //green
  ellipse(40 + x, 40 + y, 35, 35);
  fill(193, 154, 255);
  stroke(229, 206, 76);
  strokeWeight(1);
  ellipse(35 + x, 35 + y, 10, 10);
  ellipse(50 + x, 45 + y, 10, 10);
  ellipse(48 + x, 35 + y, 5, 5);
  
}