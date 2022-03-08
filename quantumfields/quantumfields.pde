int cols;
int rows;


// Mesh size
int w = 2400;
int h = 1800;
int scale = 20;

float[][] terrain;

// mode
boolean show_rows = true;

void setup(){
   size(1000, 600, P3D);
   frameRate(60);

   cols = w / scale;
   rows = h / scale;
   terrain = new float[cols][rows];
   
   colorMode(HSB);
   
   fill(0,0,0,128);    
}

void draw(){
  
  
   float yoff = -frameCount * 0.005;
   for (int y=0; y<rows; ++y){
       float xoff = 0.0;
        for (int x=0; x<cols; ++x){    
          terrain[x][y] = map(noise(xoff, yoff), 0, 1, -100, 100);
          xoff += 0.1;
        }
       yoff += 0.1;
   }
   
   boolean cool_row = false;
   boolean cool_col = false;
  
  
    background(0);  
    
    translate(width/2, height/2);
    rotateX(PI/3);
    translate(-w/2, -h/2);

    for (int y=0; y<rows; ++y){
      int default_stroke = 128*y/rows;
      cool_row = (y == int(map(mouseY, 0, height, 0, rows/1.3))) && show_rows;
       
      
      beginShape(TRIANGLE_STRIP);
      
       for (int x=0; x<cols; ++x){

         cool_col = (x == int(map(mouseX, 0, width, cols*.25, cols*.75))) && !show_rows;
         
         
        if(cool_row || cool_col){
          stroke(y%255*3, 255, default_stroke*24);
        }
        else{
          stroke(0,0,default_stroke);
        }
            
        vertex(x*scale, y*scale, terrain[x][y]);
        vertex(x*scale, (y+1)*scale, terrain[x][(y+1) % rows]);
        
        stroke(0,0,default_stroke);
      }
      
      endShape();
    }

}

void mouseClicked(){
  show_rows = !show_rows;
}
