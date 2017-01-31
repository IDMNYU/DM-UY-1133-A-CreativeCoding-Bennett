//active mode


//runs once
// this is also a function definition
void setup() {  // curly brackets always have a mate
  size(600, 800);
  background(200, 127, 12);
}


// loops. this is where the party is
void draw() { 
  //background(200, 127, 12);
  stroke(232, 127, 142);
  strokeWeight(2);

  ellipseMode(CENTER);
  fill(63, 229, 165, 20);
  ellipse(mouseX, mouseY, 75, 80);

  fill(255, 0, 0);
  ellipse(width/2, height/2, 200, 200);

  ellipse(300, 0, 20, 20);

  print("My mouse X is: ");  // noice that without the ln, we print on the same line
  println(mouseX);  // ln means line return

  print("My mouse Y is: ");  // noice that without the ln, we print on the same line
  println(mouseY);  // ln means line return
}


int tellMeMyBalance(boolean card){
  int balance;
  // more lines in here
  balance = 30000;
  return balance;
 
}

void keyPressed(){
  if(key == 'c' ){  // test for truth
      background(200, 127, 12);  // this is a function call
  }
   
}

void mouseClicked(){
  fill(0);
  rect(300, 200, 50, 40);
  
}