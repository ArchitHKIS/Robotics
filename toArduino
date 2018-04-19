String stuff = "";
float data[8];
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
}

void loop() {
  if (Serial.available()) {
    str = Serial.read();
  }
  for(int i = 0; i < 8; i++){
    int index = stuff.indexOf(","); // find first comma
    data[i] = atof(stuff.substring(0,index).c_str()); // number added to the data array
    stuff = stuff.substring(index+1); // remove that number from the string
  }
}
