color color_bkg;

int hue = 0;


void setup(){
  size(480, 256);
  frameRate(60);
  colorMode(HSB);
  strokeWeight(3);
  color_bkg = color(180, 0, 128);
  background(color_bkg);
}

void draw(){
 
 
 float offset = sin(hue/8) * 8;
 
 if(mousePressed){
   fill(hue,128,255);
   stroke(0,0,0);
 } else{
   fill(0,0,0);
   stroke(hue,128,255);
 /*  fill(0,0,255);
   stroke(128,255,128); */
 }
 
 ellipse(mouseX, mouseY, 80+offset/2, 80+offset/2);
 hue = (hue + 2) % 360;
}
