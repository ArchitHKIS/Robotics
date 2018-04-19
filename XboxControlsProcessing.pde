import org.gamecontrolplus.gui.*;
import org.gamecontrolplus.*;
import net.java.games.input.*;
import processing.serial.*;

ControlIO control; // dont delete this
Configuration config; //idk some default code dont delete 
ControlDevice gpad; // object for gamepad
Serial myPort; // creates object for communicating between arduino and processing

public void setup() {
  //size(400,400); //idk what size does but i dont think it works without it
  // Initialise the ControlIO
  control = ControlIO.getInstance(this);
  // Find a device that matches the configuration file
  gpad = control.getMatchedDevice("robotdefault");
  String portName = Serial.list()[0]; // change the the value in squarebrackets to whatever port you're gonna use
  myPort = new Serial(this, portName, 9600);
  if (gpad == null) {
    println("No suitable device configured");
    System.exit(-1); // End the program NOW! ur rekt if this shows up
  }
  
}

public void draw(){
  float xposleftstick = gpad.getSlider("XL").getValue();
  float yposleftstick = gpad.getSlider("YL").getValue();
  float xposrightstick = gpad.getSlider("XR").getValue();
  float yposrightstick = gpad.getSlider("YR").getValue();
  float righttrigger = gpad.getSlider("RT").getValue();
  float lefttrigger = gpad.getSlider("LT").getValue();
  float xButton = (float)(gpad.getButton("XBUT").pressed() ? 1 : 0);
  float yButton = (float)(gpad.getButton("YBUT").pressed() ? 1 : 0);
  
  float out[] = new float[8];
  out[0] = xposleftstick; 
  out[1] = yposleftstick;
  out[2] = xposrightstick;
  out[3] = yposrightstick;
  out[4] = righttrigger;
  out[5] = lefttrigger;
  out[6] = xButton;
  out[7] = yButton; //i did this at night and i forgot about naming conventions sorry
  String str = "";
  for(int i = 0; i < out.length; i++){
  if(i > 0){
    str += ",";//We add a comma before each value, except the first value
  }
  str += out[i];//We concatenate each number in the string.
  }
  myPort.write(str); //doesn't accept float arrays so I converted to string bamboozled the system
}

