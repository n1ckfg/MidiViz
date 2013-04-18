import processing.opengl.*;

int numNotes = 128;
NoteObj[] n = new NoteObj[numNotes];

void setup(){
  size(192*5, 48*5, OPENGL);
  smooth();
  initMidi();
  for(int i=0;i<numNotes;i++){
    n[i] = new NoteObj(i);
  }
}

void draw(){
  background(0);
  for(int i=0;i<numNotes;i++){
    n[i].run();
  }
}


