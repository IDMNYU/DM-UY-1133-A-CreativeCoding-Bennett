// written by R. Luke DuBois

var colors = new Array(16); // new Array

var osc1, osc2, echo1, echo2;
var notes = [60, 63, 65, 67, 70]; // MIDI
var sequence = [60, 63, 58, 65, 70, 67, 62, 72, 63, 60, 62, 67, 65, 70, 58, 67]; // MIDI
var octave = [-24, -12, 0, 12, 24];
var step = 0; // which note am i playing out of 'sequence'

function setup()
{
  createCanvas(800, 600);
  background(0);
  noStroke();
  rectMode(CENTER);
  
  for(var i = 0;i<colors.length;i++)
  {
    colors[i] = [random(255), random(255), random(255), 20];
  }
  
  osc1 = new p5.Oscillator();
  osc1.setType('square');
  osc1.freq(240);
  osc1.amp(0);
  osc1.start();

  echo1 = new p5.Delay();
  // what to echo, time (s), feedback (0-1), damping (freq)
  echo1.process(osc1, 0.25, 0.5, 5000); 
  
  osc2 = new p5.Oscillator();
  osc2.setType('sawtooth');
  osc2.freq(240);
  osc2.amp(0);
  osc2.start();

  echo2 = new p5.Delay();
  // what to echo, time (s), feedback (0-1), damping (freq)
  echo2.process(osc2, 0.25, 0.5, 5000); 
}

function draw()
{
  var w = floor(map(mouseX, 0, width, 0, colors.length));
  var o = floor(map(mouseY, 0, height, 5, 0));

  fill(colors[w]);  
  rect(mouseX, mouseY, 50, 50);

  // add the note to the octave and convert
  var freq = midiToFreq(notes[w] + octave[o]);
  osc1.amp(0.3);
  osc1.freq(freq);

  osc2.amp(0.3);
  osc2.freq(midiToFreq(sequence[step]));
  
  //console.log(frameCount);
  if(frameCount % 15 == 0) step = (step+1) % sequence.length;

}

function keyPressed()
{
    background(0);

}

