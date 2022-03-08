class Star{
 
  float x;
  float y;
  float z;
  
  Star(){
    x = random(0, width);
    y = random(0, height);
    z = random(1, width);
  }
  
  void update(){
    
    float sx = map(x/z, 0, 1, 0, width);
    float sy = map(y/z, 0, 1, 0, height);
    
    x += sx;
    y += sy;
    
  }
  
  void show(){
    fill(255);
    noStroke();
    ellipse(x, y, 8, 8);
    
  }
  
}
