import promidi.*;

MidiIO midiIO;

int midiChannelNum = 0;
int midiPortNum = 0;
int velocityFloor = 63;

//arbitrary setup function
void initMidi(){
  midiIO = MidiIO.getInstance(this);
  println("printPorts of midiIO");
  midiIO.printDevices();
  try{
    midiIO.openInput(midiChannelNum,midiPortNum);
  }catch(Exception e){
    midiIO.openInput(0,0);
  }
}

//built-in receiver functions
void noteOn(Note note, int deviceNumber, int midiChannel){
  int vel = note.getVelocity();
  int pit = note.getPitch();
  println("noteON:  p ." + pit + "   v . " + (vel + velocityFloor));
  if(vel==0){
    n[pit].alive = false;
  }else{
    n[pit].init(vel + velocityFloor);
  }
  updateOsc1(pit,vel + velocityFloor);
  /*
  fill(255,vel*2,pit*2,vel*2);
  stroke(255,vel);
  ellipse(vel*5,pit*5,30,30);
  */
}

void noteOff(Note note, int deviceNumber, int midiChannel){
  int pit = note.getPitch();
  println("noteOFF:  p . " + pit + "   v . _");
  n[pit].alive = false;
  /*
  fill(255,pit*2,pit*2,pit*2);
  stroke(255,pit);
  ellipse(pit*5,pit*5,30,30);
  */
}

void controllerIn(Controller controller, int deviceNumber, int midiChannel){
  int num = controller.getNumber();
  int val = controller.getValue();
  /*
  fill(255,num*2,val*2,num*2);
  stroke(255,num);
  ellipse(num*5,val*5,30,30);
  */
}

void programChange(ProgramChange programChange, int deviceNumber, int midiChannel){
  int num = programChange.getNumber();
  /*
  fill(255,num*2,num*2,num*2);
  stroke(255,num);
  ellipse(num*5,num*5,30,30);
  */
}
