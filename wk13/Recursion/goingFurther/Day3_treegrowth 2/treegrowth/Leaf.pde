/*

Leaf
September, 2005
blprnt@blprnt.com

-Renders leaves 

*/

public class Leaf{

  float xpos;
  float ypos;
  float angle;
  float rot;
  float unitsize;
  float s;
  int id;
  color c;
  float scl;
  
  Leaf(float x, float y, float a, float u, color col) {
    //angle = a + 90;
    s = 0;
    angle = a;
    xpos = x;
    ypos = y;
    rot = 0;
    unitsize = u/3;
    c = col;
    scl = random(0.2,1.6);
    render();
  };
  
  void render() {
    if (s<1) {
      s += leafinc;
      stroke(0,0,0,5);
    
      pushMatrix();
      translate(xpos,ypos);
   
      fill(red(c), green(c), blue(c), 80);
    
      angle -= 3;
      rotate((angle) * 0.0174532925);
      scale(s * scl);
     
      if (leaftype <80) {
        ellipseMode(CORNER);
        ellipse(0,0, 2 * unitsize, 2 * unitsize);
      }
      else {
         triangle(0,0,unitsize * 3,-3,unitsize * 3,3);
      };
    
      popMatrix();
    };
  };
};
