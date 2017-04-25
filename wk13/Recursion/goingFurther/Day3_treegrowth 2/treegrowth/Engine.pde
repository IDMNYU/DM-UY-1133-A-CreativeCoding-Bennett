/*

Tree Engine

*/

public class Engine{ 
  float xpos;
  float ypos;
  float angle;
  float unitsize;
  float anglechange;
  float[] xpos_a;
  float[] ypos_a;
  float[] angle_a;
  float[] startw_a;
  int acount;
  
  Engine(float x, float y, float a, float u) {
    xpos = x;
    ypos = y;
    angle = 0;
    anglechange = a;
    unitsize = u;
    
    
    xpos_a = new float[1000];
    ypos_a = new float[1000];
    angle_a = new float[1000];
    startw_a = new float[1000];
    
    acount = 0;
  };
  
  void init() {
  
  };
  
  void process(char c) {
    if (c == '+') {
      angle += anglechange;
    }
    else if (c == '-') {
      angle -= anglechange;
    }
    else if (c == 'F') {
      
       float us = unitsize * noise(angle/100);;
       float tx = xpos + (sin(angle * 0.0174532925 * noise(angle/100)) * us);
       float ty = ypos + (cos(angle * 0.0174532925 * noise(angle/200)) * us);
       
       
      stroke(0,0,0,70);
      if (branchcount > 40) {
        line(xpos, ypos, tx, ty);
       }
       else {
       Branch b = new Branch(xpos, ypos, tx, ty);
        };
       xpos = tx;
       ypos = ty;
       
       if (random(10) < (2 * branchcount)) {
         int lc = leafcount % leafcolors.length;
         Leaf l = new Leaf(tx,ty,angle + 90,us, leafcolors[lc]);
         Flower f = new Flower(tx,ty,angle + 90,us, flowercolors[lc]);
         leaves[leafcount] = l;
         leafcount ++;
         if (leafcount > 500) { leafcount = 0;};
         
         float dice = random(100);
         if (dice > 90) {
           int lc2 = leafcount % leafcolors.length;
           Leaf l2 = new Leaf(tx,ty,angle + (noise(angle/10) * 360),us, leafcolors[lc2]);
           leaves[leafcount] = l2;
           leafcount ++;
         };

       };
       
    }
    else if (c =='[') {
      branchcount ++;
      xpos_a = append(xpos_a, xpos);
      ypos_a = append(ypos_a, ypos);
      angle_a = append(angle_a, angle);
      startw_a = append(startw_a, startw);
    }
    else if (c ==']') {
      branchcount --;
      xpos = xpos_a[xpos_a.length - 1];
      ypos = ypos_a[ypos_a.length - 1];
      angle = angle_a[angle_a.length - 1];
      startw = startw_a[startw_a.length - 1];
      
      xpos_a = shorten(xpos_a);
      ypos_a = shorten(ypos_a);
      angle_a = shorten(angle_a);
      startw_a = shorten(startw_a);
    };

  };
  
};
