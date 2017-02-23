function setup() {
  //createCanvas(displayWidth, displayHeight);
  createCanvas(windowWidth, windowHeight);
  background(70, 123, 206);

}

function draw() {
  
  var wh = 30;
  fill(220, 82, 245, 17); //mauve
  strokeWeight(3);
  stroke(114, 232, 120); // green
  //ellipse(400, 400, 30, 30);
  ellipse(width / 2, height / 2, wh, wh);
  /*
  for(var i = 0; i < 3; i++){
    strokeWeight(1);
    stroke(232, 141, 103);
    fill(209, 191, 91); // mustard
    var rand = random(10); 
    if(i % 2 == 0) rand *= -1; 
    ellipse(width/2 + (.5*rand), height/2 + rand, 3, 3);
    ellipse(width/2 + rand, height/2 + rand, 5, 5);
  }
  */
  /*
  strokeWeight(1);
  beginShape();
  vertex(30, 20);
  bezierVertex(80, 0, 80, 75, 30, 75);
  bezierVertex(50, 80, 60, 25, 30, 20);
  endShape();
*/
}