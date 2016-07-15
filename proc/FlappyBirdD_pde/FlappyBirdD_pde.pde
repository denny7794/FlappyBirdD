float xpos = 200;
float ypos = 50;
float vy = 0;

void setup(){
  size(800, 600);
  smooth();
  noStroke();
}

void draw(){
  fill(255);
  rect(xpos, ypos, 40, 40);
}