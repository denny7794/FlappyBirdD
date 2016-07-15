float xpos = 200;
float ypos = 50;
float vy = 0;
float gravity = 0.7;

void setup(){
  size(800, 600);
  smooth();
  noStroke();
}

void draw(){
  background(0);
  fill(255);
  rect(xpos, ypos, 40, 40);
  vy += gravity;
  ypos += vy;
  if(ypos > height - 40){
    ypos =  height - 40;
  }
}