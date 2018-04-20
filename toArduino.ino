int ledPin1 = 7;
int ledPin2 = 8;
byte currentValue = 0;
byte values[] = {0,0};

void setup() {
  // put your setup code here, to run once:
  pinMode(ledPin1, OUTPUT);
  pinMode(ledPin2, OUTPUT);
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  if(Serial.available()){
    byte incomingValue = Serial.read();
    values[currentValue] = incomingValue;
    currentValue++;
    if(currentValue > 7){
      currentValue = 0;
    }
  }
  if(values[6] == 1){
    digitalWrite(ledPin2, HIGH);
    digitalWrite(ledPin1, LOW);
  }
  if(values[6] == 0){
    digitalWrite(ledPin1, HIGH);
    digitalWrite(ledPin2, LOW);
  }
}
