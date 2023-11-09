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
    if(ID<typing.length() && typing.charAt(0)-'a' == i) rect(pos[i][0], pos[i][1], 28, 30, 5);
    if(pressed[i]) rect(pos[i][0], pos[i][1], 28, 30, 5);
  }
  textSize(50);
  fill(0);//黑色的字
  text(typing, 50, 50);//現在要打的字
  fill(255, 0, 0);//紅色
  if(ID<typing.length()) text(typed + typing.charAt(ID), 50, 100);//現在要打的字,是typing.charAt(0);
  fill(0);//再用黑色,秀出已經打好的字
  text(typed, 50, 100);//已經打好的字
}
String typing = "printf is a function";
String typed = "";//一開始打了0個字
int ID = 0;//第幾個字母要被打
boolean [] pressed = new boolean[26];//Java的陣列宣告,都是0 or false
void keyPressed(){
  if(ID<typing.length() && key==typing.charAt(ID)){
      if(key>='a' && key<='z') {
        pressed[key-'a'] = true;
        typed += key;
        ID++;
      }
      else if(key==' '){
        typed += key;
        ID++;
      }
  }
  else {
        background(255, 0, 0);//畫面紅色閃一下背景
  }
}
void keyReleased(){
  if(key>='a' && key<='z') pressed[key-'a'] = false;
}
void mousePressed(){
  print(mouseX, mouseY);//定位、印出mouse座標
}
