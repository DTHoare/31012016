color cBlack = #000000;
color cDarkBlue = #0C0C4C;
color cLightBlue = #556199;
color cRed = #BB2416;
color[] colors = {cRed, cDarkBlue, cLightBlue};
float fps = 30;
float revs = 2 * PI / fps;

void setup(){
  size(500,500);
  noStroke();
  frameRate(fps);
}

void draw() {
  background(cBlack);
  
  //lets make it swing back and forth
  float angle = sin(revs*frameCount/2);
  angle *= angle * PI/2;
  
  pushMatrix();
  translate(width/2, height/2);
  rotate(angle);
  translate(-width/2, -height/2);
  
  //make it boom
  //same rate as angle switch
  //which means twice the frequency fo sin
  float sizeMultiplier = cos(revs*frameCount);
  sizeMultiplier *= sizeMultiplier;
  
  for(int i = 0; i < width; i ++){
    //select a random colour
    fill(colors[(int)random(0,3)]);
    
    //mess with rect size
    float rand = random(-500,900);
    rand *= sizeMultiplier;
    //start point travels diagonally down
    rect(i+rand*1.1, i, rand, rand);
  }
  
  popMatrix();
  
  //make some black horizontal bands
  for(int y = 0; y< height; y++){
    float rand = random(-500,500);
    fill(cBlack);
    //least black in the centre
    rect(width/2, y, rand, abs(y-height/2)/40 );
  }
}