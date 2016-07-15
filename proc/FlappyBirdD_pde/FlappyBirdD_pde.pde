float xpos = 200;
float ypos = 50;
float vy = 0;
float gravity = 0.7;
PImage bird;
PImage fon;

void setup(){
  size(800, 600);
  smooth();
  noStroke();
  bird = loadImage("bird1.png");
  fon = loadImage("back.png");
}

void draw(){
  //background(0);
  //fill(255);
  //rect(xpos, ypos, 40, 40);
  drawBackground();
  image(bird, xpos, ypos);
  vy += gravity;
  ypos += vy;
  if(ypos > height - 40){
    ypos =  height - 40;
  }
}

void keyPressed(){
  //vy *= -1;
  vy = -14.0f;
}

void keyReleased(){
  vy = gravity;
}

void drawBackground(){
  image(fon, 0, 0);
}