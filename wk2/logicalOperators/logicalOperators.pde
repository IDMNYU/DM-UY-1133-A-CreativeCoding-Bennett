// when we declare variables here, everyone knowns them. Think Beyonce.

void setup(){
  size(200, 200);
  background(0);
  //randie = 1.0;
  
  // declare a variable here, it's like your pet fish
  
}

void draw(){
   background(255);
  // randie is only visible inside draw
  float randie = random(0, 100);
  //println(randie);
  if( randie < 30 && mousePressed){  // both conditions must be true
    fill(100, 200, 5);
    ellipse( width/2, height/2, 50, 50);
  }
  
  if( randie > 50 && !mousePressed){  // randie must be greater than 50 and the mouse must not be pressed
    fill( 200, 30, 100);
    rect(175, 175, 25, 25);
  }
  if (randie > 80 || keyPressed){  // either of these must be true
    println(" my or statement is true");
    fill(0, 200, 125);  // color
    rect(0, 10, 75, 75); // rect on the top right
  }
  else {
    println("Blech");
  }
  
}