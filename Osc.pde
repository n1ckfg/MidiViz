import oscP5.*;
import netP5.*;

String ipNumber = "127.0.0.1";
int sendPort = 7110;
int receivePort = 33333;
OscP5 oscP5;
NetAddress myRemoteLocation;
boolean sendOsc = true;

void initOsc() {
  oscP5 = new OscP5(this, receivePort);
  myRemoteLocation = new NetAddress(ipNumber, sendPort);
}

void oscTester(){
  OscMessage myMessage;
  myMessage = new OscMessage("/test");
  float testData = random(1);
  myMessage.add(testData);
  oscP5.send(myMessage, myRemoteLocation); 
}

void updateOsc1(int p, int v) {
  OscMessage myMessage;
  try{
    myMessage = new OscMessage("/notes");
    myMessage.add(p);
    myMessage.add(v);
    oscP5.send(myMessage, myRemoteLocation);
  }catch(Exception e){ }
} 

void updateOsc2(int id, PVector p) {
  OscMessage myMessage;
  try{
    myMessage = new OscMessage("/blobs");
    myMessage.add(id);
    myMessage.add(p.x);
    myMessage.add(p.y);
    myMessage.add(p.z);
    oscP5.send(myMessage, myRemoteLocation);
  }catch(Exception e){ }
} 
