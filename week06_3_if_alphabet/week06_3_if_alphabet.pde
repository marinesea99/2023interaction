void setup(){
  size(800,400);
  textSize(64);
  background(#FFFFF2);
}
String line = "Input: ";
void draw(){
  fill(0);
  text(line,50,100);
}
void keyPressed(){
  if(key>='A' && key<='Z') line += key;
  if(key>='a' && key<='z') line += key;
}
