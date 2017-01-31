/* 
declare global variables
that means that they are universally known
ps: this is a multi line comment
*/

float randie;  // just declaring a variable
float randX, randY;

void setup(){
  size(300, 300);
  background(105, 94, 232);
  
  
}


void draw(){
  //background(105, 94, 232);
  randie = random(0, 255);
  //println(randie);
  
  randX = random(0, width);
  randY = random(0, height-1);
  
  //fill(randie, 255, 200); // Fill(R, g, b)
                          // red value is random
  fill(100, 100, 50);                      
  rect(randX, randY, 30, 50);  // rect(x, y, w, h)
  
}