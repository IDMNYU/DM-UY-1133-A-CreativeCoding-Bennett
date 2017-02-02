/*

 we are going to draw rects on the screen algorithmically
 like a type writer
 
 */

int x = 0;
int y = 0;

int r = 0;
int g = 0;
int b = 0;

void setup() {
  size(800, 600);
  background(255);
  strokeWeight(5);
}


void draw() {
  //fill(0);
  fill(r, g, 0);
  stroke(0, 0, b);
  
  rectMode(CORNER);
  rect(x, y, 40, 40); // square

  x = x + 50;
  r = r + 50; // make it go redder
  
  
  // checkers in place so that it stays on the screen

  // if x goes beyond our sketch...
  if ( x > width) {
    x = 0;  // reset x
    y = y + 50;  // move down into the next row
    
    r = 0;
    g = g + 50;  // up the green value
  } // x width


  if ( y > height) {
    x = 0; // go to the left
    y = 0; // go to the top
    
    r = 0; // reset red
    g = 0; // reset blue
    
    b = b+ 50;
    
    if(b> 255) {
      b = 0; // if blue hits zero, reset
    }
    //noLoop();
    background(255); // re-draw the backgnd to see it draw again
  } // y height
}