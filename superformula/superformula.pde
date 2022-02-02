static float radiusMultiplier = 50.0;
float t = 0;

void setup(){
  size(500, 500);
  stroke(255);
  noFill();
}

void draw(){
  background(0);
  translate(width/2, height/2);
  
  beginShape();
  
  // add vertices
  for(float theta = 0; theta < 4*PI; theta += 0.001){
     float rad = r(
       theta,  //theta
       2.0,      // a
       2.0,      // b
       map(mouseX, 0, width, 6, 32),      // m
       map(mouseY, 0, height,0, 3),      // n1
       sin(t) * 0.5 + 0.5,      // n2
       cos(t) * 0.5 + 0.5      // n3
      );
     float x = rad * cos(theta) * radiusMultiplier;
     float y = rad * sin(theta) * radiusMultiplier;
     vertex(x, y);
  }
  
  endShape();
  
  t += 0.1;
}

float r(float theta, float a, float b, float m, float n1, float n2, float n3){
  
  return pow(pow(abs(cos(m * theta / 4.0) / a), n2) + pow(abs(sin(m * theta / 4.0) / b), n3), -1.0/n1);
  
}
