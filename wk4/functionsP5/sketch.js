//var x = 0;
//var y = 0;
// variables like a value when they are first made
var grn = 0;
var slate = 0;
var ltgrn = 0;

var step = 0;
var stepY = 0;


function setup() {
  createCanvas(400, 400);
  background(88, 170, 232);
  grn = color(51, 255, 142);
  slate = color(120, 216, 232);
  ltgrn = color(174, 255, 120);
}

function draw() {
   background(88, 170, 232);
  /*
  var grn = color(51, 255, 142);
var slate = color(120, 216, 232);
var ltgrn = color(174, 255, 120);
*/
  /*
  var x = 0;
  var y = 0;

  noStroke();
  fill(51, 255, 142);
  ellipse(40 + x, 40 + y, 35, 35);
  fill(193, 154, 255);
  stroke(229, 206, 76);
  strokeWeight(1);
  ellipse(35 + x, 35 + y, 10, 10);
  ellipse(50 + x, 45 + y, 10, 10);
  ellipse(48 + x, 35 + y, 5, 5);
  */
  
  // we only check the mouse here ... like, when we get
  // here. not when it was clicked
  if(mouseIsPressed){
    step += 5;
    
    if(step > width){
      step = -100;
    }
    
  }
  
  if((keyIsPressed) &&( key === 'w')){


   // if(key === 'w'){
      
     stepY += 10;
    if(stepY > height){

      stepY = 0;
    }
   // }

  }
    

  bump(step, stepY, grn, 1);
  //x = 100;
  //y = 100;
  bump(100, 200, slate, 0); // 100 is known as x; 200 is known as y

  bump(200, 100, ltgrn, 1);
  
  //moby dick
  //more moby dick
  //websters dictionary
}

function bump(x, y, clr, which) { // need to pass parameters because i've defined it as such here
  //var x = 0;
  //var y = 0;

  noStroke();
  //fill(51, 255, 142);
  fill(clr);
  ellipse(40 + x, 40 + y, 35, 35);
  //if (which == 0) {
    fill(193, 154, 255);
 // } else {
   // fill(0);
 // }
  stroke(229, 206, 76);
  strokeWeight(1);
  ellipse(35 + x, 35 + y, 10, 10);
  //if (which == 0) {
  ellipse(50 + x, 45 + y, 10, 10);
  // }
  // else{
  // }
  ellipse(48 + x, 35 + y, 5, 5);
}

    /*

// listener function. it's always listening.  hotline
function keyTyped(){
  if(key === 'w'){
    stepY += 10;
  }
  
}
*/