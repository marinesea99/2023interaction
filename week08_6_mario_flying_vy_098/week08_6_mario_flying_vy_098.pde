void setup(){
  size(400,400);
}
float marioX=50, marioY=250, vx=0, vy=0;
void draw(){
  background(108,137,255);
  marioX += vx;
  if(flying){//如果在飛行中
    marioY += vy;//上下的位置會改變
    vy += 0.98;//重力加速度往下
    if(marioY >= 250){//碰到地板
      marioY = 250;//站在地板上
      flying = false;//不再飛行
    }
  }
  fill(255,0,0); ellipse(marioX, marioY, 15, 25);
  fill(229,119,42); rect(0,260,400,150);
}
boolean flying = false;//一開始沒有飛
void keyPressed(){
  if(keyCode==RIGHT) vx = 2;
  if(keyCode==LEFT) vx = -2;
  if(keyCode==UP && flying==false) {//如果沒有在飛的話才會飛
    vy = -20;
    flying = true;//開始飛行
  }
}
void keyReleased(){
  if(keyCode==LEFT || keyCode==RIGHT) vx = 0;
}
