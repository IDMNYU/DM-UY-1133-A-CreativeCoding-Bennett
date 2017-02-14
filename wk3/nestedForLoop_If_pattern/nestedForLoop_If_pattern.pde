/*
From the Processing Handbook by Ben Fry and Casey Reas, 2007
https://processing.org/handbook/
*/

size(200, 200);

for( int y = 40; y <= 160; y+=10){
  for(int x = 40; x <= 160; x += 10){
    
    if ((x % 20) == 0){
      line(x, y, x+6, y-6);
    }else{
      line(x, y, x+6, y+6);
    }
  }
}