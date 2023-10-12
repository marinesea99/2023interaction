void setup(){
  size(400,400,P3D);//P3D Processing 3D功能
}

void draw(){
  background(#FFFFF2);
  pushMatrix();//備份矩陣
    translate(mouseX,mouseY);//移動
    rotateY(radians(mouseX));//對Y軸轉動
    fill(0,255,0);//填綠色
    box(100);//3D的盒子、方塊
    
    noFill();//box面不填充
    scale(2);//放大2倍
    box(100);//被放大2倍
  popMatrix();//還原矩陣
}
