void setup(){
  size(400,400);
  myShuffle();
}
void myShuffle(){
  for(int i=0; i<8; i++){
    for(int j=0; j<11; j++){
      cardN[i*11+j] = j;
      cardC[i*11+j] = C[i%4];
    }
  }
  int a = int(random(88)), b = int(random(88));
  int temp = cardN[a];
  cardN[a] = cardN[b];
  cardN[b] = temp;
  temp = cardC[a];
  cardC[a] = cardC[b];
  cardC[b] = temp;
}
//int[][]card = new int[8][11];
int [] cardN = new int[88];///存放卡片的數字n
int [] cardC = new int[88];///存放卡片的顏色
color [] C = { #FF5555, #FFAA00, #55AA55, #5555FF};
void draw(){
  background(255);
  for(int i=0; i<8; i++){
    for(int j=0; j<11; j++){
      //drawCard( j*32, i*50, C[i%4],j);
      drawCard( j*32, i*50, cardC[i*11+j],cardN[i*11+j]);
    }
  }
}
void drawCard(int x,int y,color c,int n){
  stroke(128);
  fill(255);
  rect( x, y, 32, 50, 7);
  noStroke();
  fill(c);
  rect( x+3, y+3, 32-5, 50-5,4);
  
  pushMatrix();
  fill(255);
  translate(x+16,y+25);//移動
  rotate(radians(45));///轉45度
  ellipse(0,0,20,30);///STEP 1畫橢圓
  popMatrix();
  
  textAlign(CENTER,CENTER);//將對齊點移到字的正中間
  textSize(9);
  text( ""+n, x+7, y+8);///畫左上角的字//文字的中心點對齊點在左下角
  
  textSize(20);//畫中間字
  fill(c);//設定中間字的顏色
  text( ""+n, x+16, y+25);
}
