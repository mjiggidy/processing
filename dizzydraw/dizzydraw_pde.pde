int wnd_size_x = 400;
int wnd_size_y = 400;

void setup() {
  frameRate(60);
  colorMode(HSB);
  size(400, 400);
  background(0,0,0);
  surface.setTitle("Haaaanny");
}

void draw() {
  noStroke();
  fill(0,0,0,4);
  rect(0,0,wnd_size_x, wnd_size_y);
  
  strokeWeight(10);
  noFill();
  stroke(frameCount%255, 255,255);
  ellipse(wnd_size_x/2, wnd_size_y/2, (mouseX-wnd_size_x/2)*2, (mouseY-wnd_size_y/2)*2);
}
