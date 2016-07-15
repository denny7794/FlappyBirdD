import processing.core.PApplet;

/**
 * Created by Denis on 14.07.2016.
 */
public class Sketch extends PApplet {

    float xpos = 200f;
    float ypos = 50f;
    float vy = 0f;
    float gravity = 0.7f;

    public void settings() { size(800, 600);}

    public void setup(){
        smooth();
        noStroke();
    }

    public void draw(){
        background(0);
        fill(255);
        rect(xpos, ypos, 40, 40);
        vy +=gravity;
        ypos += vy;
        if(ypos > height - 40){
            ypos = height - 40;
        }
    }

    public void keyPressed(){
        vy *= -1;
    }

    public void keyReleased(){
        vy = gravity;
    }
}
