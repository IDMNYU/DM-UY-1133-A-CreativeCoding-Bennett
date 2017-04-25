/*

Branch
Flower, 2005
blprnt@blprnt.com

-Renders Flowers 

*/

public class Flower{

  float xpos;
  float ypos;
  float angle;
  float rot;
  float unitsize;
  float s;
  int id;
  color c;
  float scl;

  Flower(float x, float y, float a, float u, color col) {
    s = 0;
    angle = a;
    xpos = x;
    ypos = y;
    rot = 0;
    unitsize = u/4;
    c = col;
    scl = random(2);
    render();
  };

  void render() {
    if (s<1) {

      if (random(1) < 0.1) {
        ypos += random(height);
        if (ypos > height) {
          ypos = height - random(5);
        };
      };
      s += 0.2;
      stroke(0,0,0,5);

      pushMatrix();
      translate(xpos,ypos);

      scale(s * scl);
      for (int i=0; i< 2 + random(10); i++) {
        fill(red(c), green(c), blue(c), 80);

        angle -= 3;
        rotate((angle) * 0.0174532925);


        triangle(0,0,unitsize * 3,-3,random(2) * unitsize * 3,3);
        ellipseMode(CORNER);
        ellipse(0,0, 2 * unitsize, 2 * unitsize);
      };

      popMatrix();
    };
  };
};
