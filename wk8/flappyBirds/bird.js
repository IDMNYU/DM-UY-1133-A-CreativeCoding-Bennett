function Bird(){

	this.y = height/2;
	this.x = 64;

	// add forces for gravity, lift (user input), velocity
	// use scalar values (ie a variable with one value in it)



	this.show = function(){
		fill(255);
		ellipse(this.x, this.y, 32, 32);
	}


	this.up = function (){
		// add the user input lift to increase velocity (fighting against gravity)

		

		// multiply gravity by a value to tweak it, then add it to velocity's current value;

	}


	this.update = function(){
		// add gravity to velocity to push bird down

		// add velocity to y 


		// are we at the bottom?
		if(this.y > height){
			// stay on screen
      		this.y = height;
      		this.velocity = 0;
    	}
    
    	// also for the top
    	if(this.y < 0){
    		// stay on screen
     	 	this.y = 0;
     	 	this.velocity = 0;
    	}
	}

}

