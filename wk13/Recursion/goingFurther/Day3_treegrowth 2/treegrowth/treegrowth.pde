/*

tree.growth
September, 2005
blprnt@blprnt.com

This sketch generates an infinite set of generative trees. 

The L-System classes in this example could be used for any number of purposes. In this case, the Engine that I have written
to process the L-System string draws a tree, but it could be used to play music, to generate architecture - anything.

The general flow of the system is as such:

1) An member of the Lsystem Class is created with a starting axiom (ie 'FF')
2) A set of rules is created (a RuleSet) made up from individual string substitution rules (a Rule).
3) An Engine is created which will take the final axiom and do something with it (in this case, make a tree).
4) The RuleSet and the Engine are registered to the Lsystem
5) We tell the Lsystem to recurse a certain number of times, then set the Engine going

Controls:
---------

Mouse click - generate new tree set
't' - toggle background from black to white


*/

//FIRST, DECLARE SOME VARIABLES --------------------------
int renderCount = 0;                          //How many steps have we rendered?
boolean playing = true;

int count = 0;                                //Basic frame counter used to refresh

int leafcount;                                //How many leaves are there?
int branchcount;                              //How many branches are there?
Leaf[] leaves = new Leaf[50000];              //Array to store leaves (this could be an ArrayList)
int [] flowercolors = new int[1000000];       //Array to store sampled flower colours (this could be an ArrayList)
int [] leafcolors = new int[1000000];         //Array to store sampled leaf colours (this could be an ArrayList)
int [] branchcolors = new int[1000000];       //Array to store sampled branch colours (this could be an ArrayList)

float startw;                                 //Starting width of the trunk
float leaftype;                               //Leaves are round (<80) or triangular (>80)
float leafinc;                                //Smaller leafinc = more vector shapes per leaf
int fr;                                       //framerate
int drawcount;                                //used for refresh
int bg;                                       //background colour

Lsystem[] currentTrees;

//SET THE FILE UP TO OPEN FULL SCREEN ON EXPORT  --------------------------
static public void main(String args[]) {
  //PApplet.main(new String[] { "--display=1", "--present", "treegrowth" });
}

//SET SOME STUFF UP --------------------------
void setup() {
  
  size(1000,800); 
  smooth();
  frameRate(30);
  
  bg = 255;
  background(bg);
  
  fr = 60;
  restart();
  
};

//GRAB SOME ARRAYS OF COLOURS FROM SAMPLE IMAGES  --------------------------
void setColors() {

  String leaves[] = {
    "leaves.gif", "leaves2.gif","cherry.gif","flower.gif","leaves3.gif"          };
  int s = ceil(floor(random(leaves.length)));
  String toload = leaves[s];
  PImage b;
  b = loadImage(toload);
  image(b,0,0);
  loadPixels();
  for(int i=0; i<250000; i++) {
    leafcolors[i] = pixels[i];
  };

  String bark[] = {
    "bark1.gif", "bark2.gif","bark3.gif"          };
  int s2 = ceil(floor(random(bark.length)));
  String toload2 = bark[s2];
  PImage b2;
  b2 = loadImage(toload2);
  image(b2,0,0);
  loadPixels();
  for(int i=0; i<250000; i++) {
    branchcolors[i] = pixels[i];
  };

  String flowers[] = {
    "flower.gif","flower2.gif"          };
  int s3 = ceil(floor(random(flowers.length)));
  String toload3 = flowers[s3];
  PImage b3;
  b3 = loadImage(toload3);
  image(b3,0,0);
  loadPixels();
  for(int i=0; i<250000; i++) {
    flowercolors[i] = pixels[i];
  };

  background(bg);
};

//MAKE SOME TREES! --------------------------
void restart() {
  
  //Set some random values to make the trees look different
  drawcount = 0;
  leafinc = random(0.3);

  setColors();
  leaftype = random(100);

  branchcount = 0;
  startw = 15 + random(50);
  leafcount = 0;
  
  //Set a random number of trees
  int totalTrees = int( random(2,7));
  currentTrees = new Lsystem[totalTrees];
  
  //Make the trees
  for (int i = 0; i < totalTrees; i++) {
    Lsystem nls = new Lsystem("FF");
    nls.axiom = "FF";
    nls.renderindex = 0;
    nls.rendercount = 0;
    nls.rc = 0;
    
    RuleSet rs = new RuleSet();
    Engine e = new Engine(random(width - 200) + 100, height, -0 - random(60), random(-80,20));
    
    rs.init();
    
    String[] rax = {"FF-[-F+F+F-]+[+F-F-F+]:90", "++:5", "--:5"};
    Rule r1 = new Rule("F", rax);
    
    rs.addRule(r1);
    nls.registerRuleSet(rs);
    nls.registerEngine(e);
    nls.recurse(int(random(4,7)));
    
    currentTrees[i] = nls;
    
  };

};

//UPDATE THE TREES --------------------------

void draw() {
  if (playing) {
    count ++;
    drawcount ++;
    if (drawcount > 3500) {
      saveImage();
      renderCount ++;
      if (renderCount < 100) {
        restart();
      }
      else {
        exit();
      };
    };
    if (drawcount > 3600) {
      
    }
    else {
      for (int j = 0; j < currentTrees.length; j++) {
        currentTrees[j].render(0);
      };

      for (int i=0; i<leafcount; i++) {
        leaves[i].render();
      };
    };

  };
};

void keyPressed() {
  if (key == 't') {
    bg = (bg == 0) ? (255):(0);
    restart();
  };
  if (key == 32) {
    playing = (!playing);
  };
};

void mousePressed() {
  restart();
};

void saveImage() {
  save("tree" + month() + "_" + day() + "_" + hour() + "_" + minute() + ".png");
};
