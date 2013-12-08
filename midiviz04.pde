//note: current OpenCV library requires Processing 1.5 for export. Need a replacement!

import processing.opengl.*;

int sW = 192*5;
int sH = 48*5;
int fps = 60;

int numNotes = 128;
NoteObj[] n = new NoteObj[numNotes];

void setup(){
  Settings settings = new Settings("settings.txt");
  size(sW, sH, OPENGL);
  frameRate(fps);
  smooth();
  initMidi();
  for(int i=0;i<numNotes;i++){
    n[i] = new NoteObj(i);
  }
  initOsc();
  initOpenCV();
}

void draw(){
  background(0);
  for(int i=0;i<numNotes;i++){
    n[i].run();
  }
  updateOpenCV();
}

void stop(){
  shutdownOpenCV();
}


