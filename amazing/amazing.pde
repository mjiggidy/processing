int num_waves = 80;
int max_warp = 10;
int speed = 5;
int last_click = 0;

void setup(){
 size(800, 800, P3D);
 background(0);
 stroke(255);
 strokeWeight(1);
 colorMode(HSB);
}


void draw(){
  background(0);
  
  translate(width/2, height/2);
  
  int delta = 0;
  
  if(last_click!=0){
    delta = (frameCount - last_click);
  }
  
  for(int wave=0; wave<num_waves; ++wave){ 
    
    rotate(TWO_PI/num_waves);
    rotateY(radians(map(mouseY, 0, height, -45, 0)));
    
    for(int x=0; x<width; x++){
      float brightness = (x == delta && last_click != 0) ? 255 : map(x, 0, width, 0, 255*10);
      float saturation = (x == delta && last_click != 0) ? 0 : 255;
      int weight = (x == delta && last_click != 0) ? 2 : 1;
      strokeWeight(weight);
      stroke(map(wave, 0, num_waves, 0, 255), saturation, brightness); 
      drawWave(x);
    }
  }
}

void drawWave(int x){
  int phase_offset = mouseX ;//+ (frameCount*speed);
  point(x, sin(radians(x*map(phase_offset, 0, width, -max_warp, max_warp)+frameCount)) * 50);
//  point(x, cos(radians(x*map(phase_offset, 0, width, -max_warp, max_warp)+frameCount)) * 50);
}

void mouseClicked(){
  last_click = frameCount;
}
