PImage img;
int [][] pos = {{93,491},{247,524},{178,524},{162,490},{152,456},{195,490},
               {228,491},{264,491},{322,456},{298,489},{332,490},{365,490},
               {314,524},{281,524},{356,456},{390,457},{84,457},{187,457},
               {128,491},{221,457},{286,456},{213,524},{119,456},{145,524},
               {254,457},{109,524}};
void setup(){
  size(800,600);
  img = loadImage("keyboard.png");
  rectMode(CENTER);//用中心點,來畫四邊形
}
void draw(){
  background(#FFFFF2);//淡黃色,清背景
  image(img, 0, 600-266);
  fill(255, 0, 0, 128);//半透明的紅色
  rect(mouseX, mouseY, 28, 30, 5);
  fill(0, 255, 0, 128);//半透明的綠色
  for(int i =0; i<26; i++){
    if(pressed[i]) rect(pos[i][0], pos[i][1], 28, 30, 5);
  }
}
boolean [] pressed = new boolean[26];//Java的陣列宣告,都是0 or false
void keyPressed(){
  if(key>='a' && key<='z') pressed[key-'a'] = true;
}
void keyReleased(){
  if(key>='a' && key<='z') pressed[key-'a'] = false;
}
void mousePressed(){
  print(mouseX, mouseY);//定位、印出mouse座標
}
