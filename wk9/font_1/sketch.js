// coded by R. Luke DuBois

var thefont; 
var fsize = 9;


function preload()
{
  thefont = loadFont('thefont.otf');
}


function setup() {
  createCanvas(800, 600);
  background(255);
  fill(0);
  stroke(0);
  textFont(thefont, fsize); // which font and its size
}

function draw() {
  background(255);
  text('my dog has fleas', mouseX, mouseY);
  fsize++;
  textSize(fsize);
  if(fsize>96) fsize=9;
}