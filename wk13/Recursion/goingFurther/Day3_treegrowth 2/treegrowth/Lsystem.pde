/*

L-system Class
Built for FlashBelt 2005
blprnt@blprnt.com

Feel free to use it as you wish. Note that it is a very early version and may not work all that well.

Required Classes: Lsystem, RuleSet, Rule, Engine
Test implementation: Tester

*/



public class Lsystem{
  
  String axiom;
  int rc, rm, renderindex, rint, rendercount;
  char[] sa;
  RuleSet ruleset;
  Engine eng;
  Lsystem(String axiom) {
    this.axiom = axiom;
    this.rc = 0;
    this.rendercount = 0;
    this.renderindex = 0;
  };
  
  void registerRuleSet(RuleSet rs) {
    this.ruleset = rs;
  };
  
  void registerEngine(Engine the_e) {
  // println("register" + e);
    this.eng = the_e;
    //this.eng.init();
  
  };
  
  void recurse(int maxi) {
    //println("AXIOM" + this.axiom);
    this.rm = maxi;
    this.rc ++;
    
    this.sa = this.axiom.toCharArray();
    String[] ta = new String[sa.length];
    
    for (int n=0; n<this.sa.length; n++) {
      String replace = this.ruleset.runRule(this.sa[n]);
      
      ta[n] = replace;
    };
    
    this.axiom = join(ta, "");
    
    if (this.rc < this.rm) {
      this.recurse(this.rm);
    }
    else {
      this.rc = 0;
    }; 
  };
  void render(int step) {
      rendercount = 0;
      doRender();
  };
  
  void doRender() {
      char[] test = axiom.toCharArray();
      if (renderindex < test.length) {
      eng.process(axiom.charAt(renderindex));
      renderindex ++;
      };
  };
};
