class Shape{
  private int[][] square = {{0,0},{1,0},{0,1},{1,1}};//正方形
  private int[][] line = {{0,0},{1,0},{2,0},{3,0}};//直條
  private int[][] leftL = {{0,0},{0,1},{1,0},{2,0}};//leftL
  private int[][] rightL = {{0,0},{1,0},{2,0},{2,1}};//rightL
  private int[][] theS = {{0,0},{1,0},{1,1},{2,1}};//theS
  private int[][] otherS = {{0,1},{1,1},{1,0},{2,0}};//otherS
  private int[][] triangle = {{0,1},{1,0},{1,1},{2,1}};//triangle

  
  
  private int[][] theShape, oS;//Original Shape
  private int r,g,b,counter;
  private boolean isActive;
  private float w;
  private int choice,rotCount;
  private int theX, theY;
  
  public Shape(){
    w = width/24;
    choice = (int)random(7);
    switch(choice){//radom choose one shape to display
      case 0:
        theShape = square;
        r=254;
        g=255;
        break;
       case 1:
         theShape = line;
         r=46;
         g=222;
         b=255;
         break;
       case 2:
        theShape = triangle;
        r=209;
        g=46;
        b=255;
        break;
       case 3:
        theShape = leftL;
        r=255;
        g=172;
        b=46;
        break;
       case 4:
        theShape = rightL;
        g=27;
        b=255;
        break;
       case 5:
        theShape = theS;
        r=255;
        break;
       case 6:
        theShape = otherS;
        g=255;
        break;
    }
    counter = 1;
    oS = theShape;
    rotCount = 0;
  }
  public void display(){//畫圖形
    fill(r,g,b);
    for(int i=0;i<4;i++){
      rect(theShape[i][0]*w,theShape[i][1]*w,w,w,4);
    }
  }
  /*public void showOnDeck(){//下一個圖形
    fill(#FFFFF2);
    rect(width/2,0,width/2,height);
    //fill(0);
    //text("NEXT",width/2+100,50);//下一個圖形
    fill(r,g,b);
    for(int i=0;i<4;i++){
      rect(theShape[i][0]*w+width/2+100,theShape[i][1]*w+100,w,w,4);
    }
  }*/
  public void moveDown(){//墜落速度
    if(counter%50==0){
      moveShape("DOWN");  
    }
    counter++;
  }
  public boolean collision_boundary(String dir){//碰撞邊界
    switch(dir){
      case "RIGHT"://右邊界
        for(int i=0;i<4;i++){
          if(theShape[i][0]>10){
            return false;
          }
        }
        break;
      case "LEFT":
         for(int i=0;i<4;i++){
            if(theShape[i][0]<1){
              return false;
           }
         }
         break;
      case "DOWN":
        for(int i=0;i<4;i++){
          if(theShape[i][1]>22){
            isActive = false;
            return false;
          }
        }
        break;
    }
    return true;
  }
  public void moveShape(String dir){//左右下控制
    if(collision_boundary(dir)){
      if(dir == "RIGHT"){
        for(int i=0;i<4;i++){
          theShape[i][0]++;
        }
      }
      else if(dir == "LEFT"){
        for(int i=0;i<4;i++){
          theShape[i][0]--;
        }
      }
      else if(dir == "DOWN"){
        for(int i=0;i<4;i++){
          theShape[i][1]++;
        }
      }
    }
  }
  public boolean checkBack(Background b){
    for(int i=0;i<4;i++){
      theX = theShape[i][0];
      theY = theShape[i][1];
      if(theX>=0 && theX<12 && theY>=0 && theY<23){
        for(int a=0;a<3;a++){
          if(b.colors[theX][theY+1][a]!= 0){
            return false;
          }
        }
      }
    }
    return true; 
  }
  public void rotate(){//旋轉
  if(theShape!=square){
      int[][] rotated = new int[4][2];
      if(rotCount % 4 == 0){
        for(int i=0;i<4;i++){
          rotated[i][0] =  oS[i][1] - theShape[1][0];
          rotated[i][1] = -oS[i][0] - theShape[1][1];
        }
      }
      else if(rotCount % 4==1){
        for(int i=0;i<4;i++){
          rotated[i][0] = -oS[i][0] - theShape[1][0];
          rotated[i][1] = -oS[i][1] - theShape[1][1];
        }
      }
      else if(rotCount % 4==2){
        for(int i=0;i<4;i++){
          rotated[i][0] = -oS[i][1] - theShape[1][0];
          rotated[i][1] =  oS[i][0] - theShape[1][1];
        }
      }
      else if(rotCount % 4==3){
        for(int i=0;i<4;i++){
          rotated[i][0] =  oS[i][0] - theShape[1][0];
          rotated[i][1] =  oS[i][1] - theShape[1][1];
        }
      }
      theShape = rotated;
    }
  }
}
