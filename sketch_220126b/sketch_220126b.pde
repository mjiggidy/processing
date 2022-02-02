
int row_offset = 5;

int width_column = 100;
int height_column = 50;

float depth_trough = 1;
float depth_peak = 1;

void setup(){
   size(800, 600);
   frameRate(60);
   noFill();
   colorMode(HSB, height);
}

void draw(){
  background(0,0,0);
    
  for(int row = 0; row-row_offset < height; row += row_offset){
    for(int col = 0; col-width_column < width; col += width_column){

      stroke(row, 0, height, height/2);
      strokeWeight(map(sin(radians(row*map(mouseX,0,width,3,4) + frameCount)*20), -1, 1, 5, 20));
      
      arc(col, row, width_column/2, height_column*depth_trough, 0, PI);
      arc(col+width_column/2, row, width_column/2, height_column*depth_peak, PI, 2*PI);
      
    }
    
  }
  
}
