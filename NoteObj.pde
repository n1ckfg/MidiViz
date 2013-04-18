class NoteObj{
  
  color fgColor = color(255);
  PVector p, s;
  float alphaNum, pitch, vel;
  int counter, id;
  boolean alive;

  float sDelta = 0.1;
  float aDelta = 5;
  float velScaler = 0.5;
  float yPos = height/2;
  float xRange = width * 0.9;
  float xOffset = (width-xRange)/2;
  float origVel = 0;
  
  NoteObj(int _id){
    alive = false;
    id = _id;
    p = new PVector(xOffset + ((float(id)/127)*xRange),yPos);
    s = new PVector(0,0);
    alphaNum = 0;
    counter = 0;
  }
  
  void init(float _v){
    if(_v != 0){
      alive = true;
      origVel = _v;
    }else{
      alive = false;
    }
    alphaNum = (origVel/127)*255;
    alphaNum = 255;
    counter = 0;
    s = new PVector(_v * velScaler, _v * velScaler);
  }
  
  void update(){
    if(alive){
      s.add(new PVector(sDelta,sDelta));
      counter++;
    }else if(!alive){
      if(alphaNum>0){
        alphaNum-=aDelta;
      }else{
        alphaNum=0;
      }
    }
  }

  void draw(){
    noStroke();
    fill(fgColor,alphaNum);
    ellipseMode(CENTER);
    ellipse(p.x,p.y,s.x,s.y);
  }
  
  void run(){
    update();
    draw();
  }
  
}
