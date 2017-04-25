/*

L-system Rule Class
Built for FlashBelt 2005
blprnt@blprnt.com

Feel free to use it as you wish. Note that it is a very early version and may not work all that well.

Required Classes: Lsystem, RuleSet, Rule, Engine
Test implementation: Tester

*/

public class Rule{
  String id;
  String[] rules;
  Rule(String name, String[] theruleset) {
    id = name;
    rules = theruleset;
  };
};
