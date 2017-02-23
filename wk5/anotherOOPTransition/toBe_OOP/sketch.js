var w = 800;
var wort, x, y;
var wanderX, wanderY;

var haircolor = [];
var colorList = [];

function setup() {
  
 // createCanvas(800, 800);
  //createCanvas(displayWidth, displayHeight);
  print(displayHeight);
  //createCanvas(windowWidth, windowHeight);
  createCanvas(displayWidth, displayHeight);
  background(0);
  wort = color(181, 35, 203);
  wanderX = 0;
  wanderY = 0;
  x = 20;
  y = 150;
  haircolor = [
      color(255, 0, 0),
      color(0, 255, 0),
      color(127, 5, 200),
      color(0, 0, 255),
      color(200, 50, 180)
    ]
    //var  c = color(181, 35, 203);
  colorList[0] = color(181, 35, 203); //c;
  colorList[1] = wort;

}

function draw() {
  //fullscreen();
  creature();
}

function creature() {


  // body
  smooth();

  curve(w / 2 - 100 + x, w / 2 - 100 + y, w / 2 - 50 + x, w / 2 - 200 + y, w / 2 + 10 + x, w / 2 - 100 + y, w / 2 - 20 + x, w / 2 + 20 + y); //left antenna
  curve(w / 2 + 120 + x, w / 2 - 80 + y, w / 2 + 50 + x, w / 2 - 200 + y, w / 2 - 10 + x, w / 2 - 100 + y, w / 2 - 20 + x, w / 2 + 40 + y); //right antenna
  fill(59, 275, 64); //darker green
  ellipse(w / 2 + x, w / 2 + y, 120, 160); //body
  fill(wort); // purple
  noStroke();
  ellipse(w / 2 - 20 + x, w / 2 + 30 + y, 20, 10); //wart
  // head
  fill(59, 220, 64); // lighter green
  stroke(0);
  ellipse(w / 2 + x, w / 2 - 120 + y, 100, 80); //head
  fill(0);
  rect(w / 2 - 25 + x, w / 2 - 105 + y, 60, 1); //mouth
  fill(255);
  triangle(w / 2 + 15 + x, w / 2 - 90 + y, w / 2 + x, w / 2 - 105 + y, w / 2 + 30 + x, w / 2 - 105 + y); //tooth
  // eyes
  fill(193, 255, 64); //greenish yellow
  ellipse(w / 2 - 15 + x, w / 2 - 120 + y, 15, 15); //left eye
  ellipse(w / 2 + 25 + x, w / 2 - 120 + y, 15, 15); //right eye
  fill(0);
  ellipse(w / 2 - 15 + 0 + x + wanderX, w / 2 - 120 + 0 + y + wanderY, 5, 5); //left pupil
  ellipse(w / 2 + 25 + 0 + x + wanderX, w / 2 - 120 + 0 + y + wanderY, 5, 5); //right pupil
  noFill();
  // end eyes
  // rest of head
  fill(60, 189, 64); //lighter green
  ellipse(w / 2 - 50 + x, w / 2 - 200 + y, 20, 20); // left antenna point
  ellipse(w / 2 + 50 + x, w / 2 - 200 + y, 20, 20); // right antenna point
  noFill();

  wanderX = map(mouseX, 0, width, -5, 4);
  wanderY = map(mouseY, 0, width, -5, 2);
}