import hypermedia.video.*;
import java.awt.*;

OpenCV opencv;
int blobMin = 100; // orig 100 ... note this is area
int blobMax = 100000; // orig w*h/3 ~= 100,000
int thresholdDepth = 10;  //orig 80
int contrastImg    = 0;
int brightnessImg  = 10;
Blob[] blobs; //array for depth tracking
Rectangle[] faces; //array for face tracking
boolean findFaces = true;
boolean flip = false;
ArrayList blobTargets;

PVector[] trackBlobs;

void initOpenCV(){
  opencv = new OpenCV( this ); //init object
  opencv.allocate(sW,sH); //creates a buffer for non-live capture; remove for live
  //opencv.cascade( OpenCV.CASCADE_FRONTALFACE_ALT ); //load face detect profile

}

void updateOpenCV(){
  trackBlobs();
  drawBlobs();
}

void shutdownOpenCV(){
  opencv.stop();
}

void trackBlobs() {
  /*
  if(flip) {
    opencv.flip( OpenCV.FLIP_HORIZONTAL );
  }
  */
  opencv.copy(get(0,0,width,height));
  opencv.absDiff();
  opencv.convert(GRAY);
  //thresholdDepth=mouseY;
  opencv.threshold(thresholdDepth);
  // get blobs
  blobs = opencv.blobs( blobMin, blobMax, 20, true );
  trackBlobs = new PVector[blobs.length];
    for(int i=0;i<blobs.length;i++){
        //trackBlobs[i] = new PVector(blobs[i].length,blobs[i].area,blobs[i].centroid.x);
        trackBlobs[i] = new PVector(blobs[i].area,blobs[i].centroid.x,blobs[i].length);
        if(sendOsc) updateOsc2(i, trackBlobs[i]);
    }
}

/*
PVector getBlobDepth(Blob b){
  float x = b.centroid.x;
  float y = b.centroid.y;
  //~~~~~

  int sampleRange = 10;
  strokeWeight(1);
  rect(x-sampleRange, y-sampleRange,2*sampleRange,2*sampleRange);
  PImage grab = get(int(x-sampleRange), int(y-sampleRange),int(2*sampleRange),int(2*sampleRange));
  float z = 0;
  for(int i=0;i<grab.pixels.length;i++){
    float r = red(grab.pixels[i]);
    if(r > 0) z += r;
  }
  z /= grab.pixels.length;

  //~~~~~
  PVector returns = new PVector(x,y,z);
  println(returns);
  return returns;
}
*/

void drawBlobs() {
    noFill();
    pushMatrix();
    //translate(20+w,20+h);

    for( int i=0; i<blobs.length; i++ ) {
      //~~
        Rectangle bounding_rect = blobs[i].rectangle;
        float area = blobs[i].area;
        float circumference = blobs[i].length;
        Point centroid = blobs[i].centroid;
        Point[] pointsArray = blobs[i].points;
  
        //Smiley
        /*
        bob.xPos = centroid.x;
        bob.yPos = centroid.y;
        bob.update();
        */
        // rectangle
        noFill();
        strokeWeight(1);
        stroke( blobs[i].isHole ? 128 : 64 );
        rect( bounding_rect.x, bounding_rect.y, bounding_rect.width, bounding_rect.height );
  
  
        // centroid
        stroke(0,0,255);
        line( centroid.x-5, centroid.y, centroid.x+5, centroid.y );
        line( centroid.x, centroid.y-5, centroid.x, centroid.y+5 );
        noStroke();
        fill(0,0,255);
        text( area,centroid.x+5, centroid.y+5 );
  
  
        fill(255,0,255,64);
        stroke(255,0,255);
        if ( pointsArray.length>0 ) {
          beginShape();
          for( int j=0; j<pointsArray.length; j++ ) {
            vertex( pointsArray[j].x, pointsArray[j].y );
          }
          endShape(CLOSE);
        }
  
        noStroke();
        fill(255,0,255);
        text( circumference, centroid.x+5, centroid.y+15 );
      }
    popMatrix();
    
    //~~~~
   
}
