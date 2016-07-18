float xpos = 200;
float ypos = 50;
float vy = 0;
float gravity = 0.7;
PImage bird;
PImage fon;
int count = 0;
PImage wall;
boolean trigger=false;
int count2 = 0;
float[] wallOffset = new float[4];
WallPair[] walls = new WallPair[4];

void setup(){
  size(800, 600);
  smooth();
  noStroke();
  bird = loadImage("bird1.png");
  fon = loadImage("back.png");
  wall = loadImage("truba.png");
  for (int i = 0; i < wallOffset.length; i++) {
      wallOffset[i] = random(-100, 100);
  }
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
  checkTouch();
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
      drawPairOfWalls(offset, i, wallOffset[i]);
  }   
}

void drawPairOfWalls(int xPos, int i, float offset){
    pushMatrix();
    rotate(PI);
    image(wall, -xPos - 200*i - 50, -200 - offset);
    popMatrix();
    image(wall, xPos + 200*i, height/2 + 150 + offset);
    if (xPos > 0 && xPos <width) {
          walls[i] = new WallPair(xPos, 200 + offset, height/2 + 150 + offset);
    }
}

void checkTouch(){
        for(WallPair pair : walls){
            if(pair != null){
                if((ypos < pair.y1 && xpos > pair.x && xpos < pair.x + wall.width) ||
                   (ypos > pair.y2 && xpos > pair.x && xpos < pair.x + wall.width)){
                    println("touch" + count2++);
                }
            }
        }
    }

class WallPair{
  float x, y1, y2;
  WallPair(float x, float y1, float y2){
      this.x = x;
      this.y1 = y1;
      this.y2 = y2;
  }
}