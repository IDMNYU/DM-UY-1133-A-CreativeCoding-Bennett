/*
In this sketch, we'll build a flappy bird game.

A bird will be controlled by the mouse to fly.
The scenary will keep moving and the bird has to
avoid it.

The focus here will be OOP and forces.  We will only be 
using a force in one direction, to start with. The next 
step would then re-structure the code to utilize vectors
to have the forces operation in 2 dimensions.

*/


var bird;

var block;


function setup(){
createCanvas(400, 600);

// make a new bird object:


// push a new bar object onto the end of the block array

}


function draw(){


	//cycle through the array of bars:

	// run each object's method's


	// is this particular bar off screen?

	//cut this indice out of the array



	//run the birds method:



	// every so often"
	if(frameCount % 100 == 0){
		//push a new bar object onto the array
	}
}

// external listener function. always listening:

function keyPressed(){
	if( key == ' '){
		console.log("space");
		//run the bird's method to go up:
	}
}