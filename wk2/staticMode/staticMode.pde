// static mode
// runs once

String bob;

//size(x, y);  size(width, height)
size(900, 200);   // this is going to be the size of the sketch
//background(30, 127, 200);
background(127, 255, 200);  // (R, G, B)  0-255

stroke(255, 0, 0);  //outline shape; parmeter we pass, controls color
                    // 1 value: 0-255 --> b->w;   3 values:0-255 r, g, b
strokeWeight(40);  // thickness of outline
fill(172, 49, 232, 127);  // purple
ellipse(width/2, height/2, 100, 100);  // elipse(x, y, w, h);
println(width);  //print out a value to our console.
noStroke();
fill(255, 243, 97);
ellipse(50, 50, 50, 50);

//fill(
stroke(0);
strokeWeight(3);
rect(0, 50, 300, 50);  // rect(x, y, w, h)