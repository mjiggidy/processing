int boxWidth = 100;
int boxHeight = 100;
int num_rand = 200;
int rand_range = width*12;

int[] offsets_x = new int[num_rand];
int[] offsets_y = new int[num_rand];
float[] offsets_rate = new float[num_rand];

void setup(){
  size(800, 800);
  frameRate(60);
  rectMode(CENTER);
  colorMode(HSB, height);
  background(0,0,0,0);
  
  // Generate offsets
  for(int x=0; x<num_rand; ++x){
    offsets_x[x] = round(random(boxWidth + rand_range) - (rand_range/2));
    offsets_y[x] = round(random(boxHeight + rand_range) - (rand_range/2));
    offsets_rate[x] = random(0.5,0.6);
  }
}

void draw(){
 // background(0,0,0,0);
  
  stroke(mouseX, width, height-mouseY); 
  strokeWeight(abs(sin(radians(frameCount)) * 5));
  
  for(int x=0; x<num_rand; ++x){
    fill(mouseX,width,mouseY,offsets_rate[x]*width);
    drawShape(mouseX*offsets_rate[x] + offsets_x[x], mouseY*offsets_rate[x] + offsets_y[x],  boxWidth*offsets_rate[x], boxHeight*offsets_rate[x]);
  }
  fill(mouseX,width,mouseY);
  drawShape(mouseX, mouseY,  boxWidth, boxHeight);  
}

void drawShape(float pos_x, float pos_y, float width_x, float width_y){
  ellipse(pos_x, pos_y,  width_x, width_y);
}
