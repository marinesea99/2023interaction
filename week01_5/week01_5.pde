//互動模式 Interactive Mode (Active Mode)
void setup(){ //設定
  size(500,500);
  background(255); //背景改成白色
}

void draw(){//畫圖 每秒畫60次
  if(mousePressed){//如果mouse有按下去的話
    line(mouseX, mouseY, pmouseX, pmouseY);
  }//畫線(滑鼠座標mouseX,mouseY,到之前滑鼠座標pmouseX,pmouseY);
}

void keyPressed(){
  if(key=='1') stroke(255, 0, 0); //紅
  if(key=='2') stroke(0, 255, 0); //綠
  if(key=='3') stroke(0, 0, 255); //藍
  if(key=='s' || key=='S') save("output.png"); //存成png檔
  if(key=='+') strokeWeight(10);
  if(key=='-') strokeWeight(1);
}
