import processing.video.*;
import gab.opencv.*;
import java.awt.*;

Movie miVideo;
OpenCV opencv;
OpenCV opencv1;

ArrayList <Contour> losCountours;

void setup(){
  size(640,360);
  miVideo =  new Movie(this, "video1.mp4");
  opencv = new OpenCV(this,640,360);
  opencv1 = new OpenCV(this,640,360);
  miVideo.play();
}

void draw(){
 if(miVideo.width!= 0){
    
    opencv.loadImage(miVideo);
    opencv.threshold(30);
    
    opencv1.loadImage(miVideo);
    opencv1.threshold(80);
    
    losCountours = opencv.findContours();
    losCountours = opencv1.findContours();
    
  
    image(opencv1.getOutput(),0,0);
    tint(255,250,0,200);
    image(opencv.getOutput(),0,0);

    
    for(Contour c:losCountours){
      noFill();
      stroke(255,0,255);
      for(PVector p: c.getPolygonApproximation().getPoints()){
        vertex(p.x,p.y);
      }
      stroke(255,255,0);
      c.draw();
    }
  }

}

void movieEvent(Movie m) {
  m.read();
}
