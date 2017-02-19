// here i'm declaring an array
var list = [];

list[0] = 5; // first item in my array
list[1] = 8; // 2nd item in my array
list[2] = 0; // 3rd

var shoppingList = ["beer", "milk", "cheese",  "soy nuts"];

var values = [];

function setup() { 
  createCanvas(400, 400);
} 

function draw() { 
  var eddie = 3;
  background(220);
  console.log(shoppingList[eddie]);
}

function mouseClicked(){
  var n = 0;
  // while loops loop, until they are not longer true
  while( n < 500){
    
    values[n] = random(0, 100);
    
    n = n + 1; //if you do not have a increment/decrement
    // ie, some way to break out of the loop..... it will lokck
    // FOREVER
  }
  
}
  