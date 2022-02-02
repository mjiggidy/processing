void setup(){
  size(600, 600);
  background(255);
  noFill();
  smooth();
  stroke(128);
  frameRate(60);
  colorMode(HSB);
}

void draw(){
  
  noStroke();
  fill(0,0,0,10);
  rect(0, 0, width, height);
 
  for(int w_offset = 0; w_offset < width; w_offset += 60){
    
    for(int h_offset = 0; h_offset < height; h_offset += 60){
  
      pushMatrix();
      translate(10+w_offset, 10+h_offset);
      
      // Base square
      pushMatrix();
      translate(20, 20);
      rotate(radians(mouseX));
      strokeWeight(2);
  //    stroke(255,0,255);
      rect(-20, -20, 40, 40);
      popMatrix();
      
      // Top-left square
      pushMatrix();
      rotate(radians(frameCount));  
      stroke((w_offset + h_offset) % 255, 255, 255);
      strokeWeight(1);
      rect(0, 0, 20, 20); 
      popMatrix();
      
      pushMatrix();
      translate(40, 40);
      rotate(-radians(frameCount));
      strokeWeight(1);
      rect(0,0, -20, -20);
      popMatrix();
    
      popMatrix();
    }
  }
}
  
