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

    public void settings() { size(800, 600);}

    public void setup(){
        smooth();
        noStroke();
        bird = loadImage("bird1.png");
        fon = loadImage("back.png");
    }

    public void draw(){
        background(0);
        drawBackground();
        //fill(255);
        //rect(xpos, ypos, 40, 40);
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

    void drawBackground(){
        image(fon, 0, 0);
    }
}
