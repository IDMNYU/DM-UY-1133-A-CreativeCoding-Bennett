// declare your variables which will store the obects

var sid;
var sally

var go = 0;

function setup() {
  createCanvas(windowWidth, windowHeight);
  background(0);
  // instantiate those variables with the object
  // ie, call the constructor function and make a new object

  sid = new Monster(20, 150, color(181, 35, 203));
  sally = new Monster(60, 0, color(0));
}

function draw() {
  background(70, 109, 206);

  //call the methods associated with each object
  sid.follow(mouseX, mouseY);
  sid.display(800, color(59, 275, 64), color(59, 220, 64));
  
  sally.follow(10, 5);
  sally.display(400, color(195, 70, 209), color(225, 84, 250));
  
}

function mousePressed(){
  go++;
  sally.move(go, 0);
  //console.log(go);
}

// create the class here:

function Monster(locX, locY, c) { // pass any parameters we want to pass upon object creation

  // do the hand-off between parameters passed and local variables for the class
  var wort = c;
  var x = locX;
  var y = locY;
  var w;

  var wanderX, wanderY;

  // create the methods for the class. These are functions

  this.display = function(wt, bdclr, bdclr2) {
    w = wt;
    // body
    smooth();

    curve(w / 2 - 100 + x, w / 2 - 100 + y, w / 2 - 50 + x, w / 2 - 200 + y, w / 2 + 10 + x, w / 2 - 100 + y, w / 2 - 20 + x, w / 2 + 20 + y); //left antenna
    curve(w / 2 + 120 + x, w / 2 - 80 + y, w / 2 + 50 + x, w / 2 - 200 + y, w / 2 - 10 + x, w / 2 - 100 + y, w / 2 - 20 + x, w / 2 + 40 + y); //right antenna
    //fill(59, 275, 64); //darker green
    fill(bdclr);
    ellipse(w / 2 + x, w / 2 + y, 120, 160); //body
    fill(wort); // purple
    noStroke();
    ellipse(w / 2 - 20 + x, w / 2 + 30 + y, 20, 10); //wart
    // head
    //fill(59, 220, 64); // lighter green
    fill(bdclr2);
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


  }

  this.follow = function(mX, mY) {
    wanderX = map(mX, 0, width, -5, 4);
    wanderY = map(mY, 0, width, -5, 2);
  }
  
  this.move = function(valX, valY){
    this.x += valX;
    this.y += valY;
  }

} // encloses the entire class