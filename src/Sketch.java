import processing.core.PApplet;
import processing.core.PImage;

/**
 * Created by Denis on 14.07.2016.
 */
public class Sketch extends PApplet {

    float xpos = 200f;
    float ypos = 50f;
    float vy = 0f;
    float gravity = 0.7f;
    PImage bird;
    PImage fon;
    int count = 300;
    PImage wall;
    boolean trigger=false;

    public void settings() { size(800, 600);}

    public void setup(){
        smooth();
        noStroke();
        bird = loadImage("bird1.png");
        fon = loadImage("back.png");
        wall = loadImage("truba.png");
    }

    public void draw(){
        //background(0);
        //fill(255);
        //rect(xpos, ypos, 40, 40);
        count++;
        drawBackgroundAndWalls(count%width);//!зачем count%width ?? можно просто count
        //textSize(50);
        //text(count%width, 50, 50);
        image(bird, xpos, ypos);
        vy +=gravity;
        ypos += vy;
        if(ypos > height - 40){
            ypos = height - 40;
        }
    }

    public void keyPressed(){
        //vy *= -1;
        vy = -14.0f;
    }

    public void keyReleased(){
        vy = gravity;
    }

    void drawBackgroundAndWalls(int offset){
        //image(fon, 0, 0);
        image(fon, -count, 0);
        image(fon, width - count, 0);
        if(count == width) {
            count = 0; //my modification
            trigger = true;
        }
        drawWalls(width - offset);
        //if(count > 800) {
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

}
