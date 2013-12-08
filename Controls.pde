boolean keyControl = true;

int keyVel = 80;
int octave = 0;

void keyPressed(){
  if(keyControl){
    if(key=='a'||key=='A') n[60].init(keyVel+octave);
    if(key=='d'||key=='D') n[64].init(keyVel+octave);
    if(key=='e'||key=='E') n[63].init(keyVel+octave);
    if(key=='f'||key=='F') n[65].init(keyVel+octave);
    if(key=='g'||key=='G') n[67].init(keyVel+octave);
    if(key=='h'||key=='H') n[69].init(keyVel+octave);
    if(key=='j'||key=='J') n[71].init(keyVel+octave);
    if(key=='k'||key=='K') n[72].init(keyVel+octave);
    if(key=='s'||key=='S') n[62].init(keyVel+octave);
    if(key=='t'||key=='T') n[66].init(keyVel+octave);
    if(key=='u'||key=='U') n[70].init(keyVel+octave);
    if(key=='w'||key=='W') n[61].init(keyVel+octave);
    if(key=='y'||key=='Y') n[68].init(keyVel+octave);
  }
}

void keyReleased(){
  if(keyControl){
    if(key=='a'||key=='A') n[60].alive=false;
    if(key=='d'||key=='D') n[64].alive=false;
    if(key=='e'||key=='E') n[63].alive=false;
    if(key=='f'||key=='F') n[65].alive=false;
    if(key=='g'||key=='G') n[67].alive=false;
    if(key=='h'||key=='H') n[69].alive=false;
    if(key=='j'||key=='J') n[71].alive=false;
    if(key=='k'||key=='K') n[72].alive=false;
    if(key=='s'||key=='S') n[62].alive=false;
    if(key=='t'||key=='T') n[66].alive=false;
    if(key=='u'||key=='U') n[70].alive=false;
    if(key=='w'||key=='W') n[61].alive=false;
    if(key=='y'||key=='Y') n[68].alive=false;
  }
}

/*
a, 60;
d, 64;
e, 63;
f, 65;
g, 67;
h, 69;
j, 71;
k, 72;
s, 62;
t, 66;
u, 70;
w, 61;
y, 68;
*/
