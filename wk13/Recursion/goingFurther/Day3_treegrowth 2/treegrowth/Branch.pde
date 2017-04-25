/*

Branch
September, 2005
blprnt@blprnt.com

-Renders branches 

*/

public class Branch{

  float xp1;
  float xp2;
  float yp1;
  float yp2;
  float sangle;
  float eangle;
  int branches;
  
  Branch(float x1, float y1, float x2, float y2) {
    xp1 = x1; xp2 = x2; yp1 = y1; yp2 = y2;
    sangle = atan2( (yp2 - yp1), (xp2 - xp1));
    branches = 0;
    render();
  };
  
  void render() {
    
    float hyp = sqrt(pow((xp2 - xp1),2) + pow((yp2 - yp1),2));
    pushMatrix();
    translate(xp1,yp1);
    
    rotate(sangle);
    
    for (float i=0; i < hyp; i+=3) {
      branches ++;
      rectMode(CENTER);
      noStroke();
    
      color c = branchcolors[branches % branchcolors.length];
      fill(red(c),green(c),blue(c),140);
      rect(i,0,3 + random(2), (startw -   (i * ((startw - pow(startw,0.9))/hyp))) );
   
    };
    startw = (startw -   (hyp * ((startw - pow(startw,0.9))/hyp)));
    
    popMatrix();
  };

};
