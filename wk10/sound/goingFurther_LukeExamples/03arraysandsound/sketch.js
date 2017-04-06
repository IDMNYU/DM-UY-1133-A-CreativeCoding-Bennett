
var colors = []; // new Array
colors[0] = [255, 192, 0, 20];
colors[1] = [192, 64, 200, 20];
colors[2] = [0, 255, 192, 20];
colors[3] = [192, 64, 64, 20];
colors[4] = [0, 0, 255, 20];

var osc, echo;
var notes = [60, 63, 65, 67, 70]; // MIDI
var octave = [-24, -12, 0, 12, 24];

function setup()
{
  createCanvas(800, 600);
  background(0);
  noStroke();
  rectMode(CENTER);
  
  osc = new p5.Oscillator();
  osc.setType('sine');
  osc.freq(240);
  osc.amp(0);
  osc.start();

  echo = new p5.Delay();
  // what to echo, time (s), feedback (0-1), damping (freq)
  echo.process(osc, 0.25, 0.5, 15000); 
  
}

function draw()
{
  var w = floor(map(mouseX, 0, width, 0, 5));
  var o = floor(map(mouseY, 0, height, 5, 0));
  console.log(w);
  fill(colors[w]);  
  rect(mouseX, mouseY, 50, 50);

  // add the note to the octave and convert
  var freq = midiToFreq(notes[w] + octave[o]);
  osc.amp(0.8);
  osc.freq(freq);

}

function keyPressed()
{
    background(0);

}

