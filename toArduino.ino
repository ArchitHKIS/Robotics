int ledPin1 = 7;
int ledPin2 = 8;
byte currentValue = 0;
byte values[] = {0,0};

void setup() {
  // put your setup code here, to run once:
  pinMode(ledPin1, OUTPUT); //sets up the lights
  pinMode(ledPin2, OUTPUT); //sets up the other light
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  if(Serial.available()){
    byte incomingValue = Serial.read(); // gets each value for the array and add its to the values array pretty OP if say so myself
    values[currentValue] = incomingValue; //voodoo magic
    currentValue++; //add so that the array index moves
    if(currentValue > 7){ // since their are only 8 numbers we need, if it exceeds 7, throw out the old values and use the new ones. 
      currentValue = 0; //reset
    }
  }
  if(values[6] == 1){ // some yum code
    digitalWrite(ledPin2, HIGH);
    digitalWrite(ledPin1, LOW);
  }
  if(values[6] == 0){ // some more yum code
    digitalWrite(ledPin1, HIGH);
    digitalWrite(ledPin2, LOW);
  }
}
