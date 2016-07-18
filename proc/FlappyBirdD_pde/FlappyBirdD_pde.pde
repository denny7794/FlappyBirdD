float xpos = 200;
float ypos = 50;
float vy = 0;
float gravity = 0.7;
PImage bird;
PImage fon;
int count = 0;
PImage wall;
boolean trigger=false;

void setup(){
  size(800, 600);
  smooth();
  noStroke();
  bird = loadImage("bird1.png");
  fon = loadImage("back.png");
  wall = loadImage("truba.png");
}

void draw(){
  //background(0);
  //fill(255);
  //rect(xpos, ypos, 40, 40);
  count++;
  drawBackgroundAndWalls(count);
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

void drawBackgroundAndWalls(int offset){
  //image(fon, 0, 0);
  image(fon, -count, 0);
  image(fon, width - count, 0);
  if(count == width){
    count = 0; //my modification
    trigger = true;
  }  
  drawWalls(width - offset);
  if(trigger){
     drawWalls(-offset);
  }
}

void drawWalls(int offset){
  for (int i = 0; i < 4; i++) {
      drawPairOfWalls(offset, i);
  }   
}

void drawPairOfWalls(int xPos, int i){
    pushMatrix();
    rotate(PI);
    image(wall, -xPos - 200*i - 50, -200);
    popMatrix();
    image(wall, xPos + 200*i, 350);
}