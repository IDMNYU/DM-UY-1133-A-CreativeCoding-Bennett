var myList = [];
var w = 10;

var clrs = [];

var collection = [];

function setup() {
  createCanvas(windowWidth, windowHeight);
  for(var i = 0; i < 10; i++){
    myList[i] = int(random(0, 200));
    print(myList[i]);
  }
  
  clrs[0] = color(0);
  clrs[1] = color(255);
  
  collection[0] = "fish";
  collection[1] = 3.14;
  collection[2] = 9;
  collection[3] = 'g';
  
  
}

function draw() {
  noStroke();
  for(var i = 0; i < 10; i++){
    fill(random(0, 255), random(0, 255), random(0, 255));
    ellipse(myList[i], height/2, w, w);
  }
  
  stroke(171, 70, 206);
  strokeWeight(3);
  fill(clrs[0]);
  rect(width/2, height/2 + 60, 30, 30);
  
  clrs[3] = color(232, 141, 103);
  fill(clrs[3]);
  rect(width/2, height/2 - 60, 30, 30);
  
  console.log("collection items");
  for(var i = 0; i < collection.length; i++){
    console.log(collection[i]);
  }
  
  noLoop();
}