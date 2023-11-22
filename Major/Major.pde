Grid grid;
Shape shape,onDeck;
Background bg;

void setup(){
  size(720,720);
  grid = new Grid();
  shape = new Shape();
  shape.isActive = true;
  onDeck = new Shape();
  bg = new Background();
  textSize(44);
}
void draw(){
  fill(0);
  rect(width/2,0,width/2,height);
  //background(0);
  bg.display();
  grid.display();
  drawShapes();
}
public class Grid{//網格
    private float w;
    public Grid(){
      w= width/24;
    }
    public void display(){
      stroke(155);
      for(int i=0; i<13; i++){
        line(0,i*w,width/2,i*w);
        line(0,(i+12)*w,width/2,(i+12)*w);
        line(i*w,0,i*w,height);
      }
    }
}
void drawShapes(){
  shape.display();//先秀出
  //onDeck.showOnDeck();
  if(shape.checkBack(bg)){
    shape.moveDown();
  }
  else {
    shape.isActive = false;
  }
  if(!shape.isActive){
    bg.writeShape(shape);
    shape = onDeck;
    shape.isActive = true;
    onDeck = new Shape();
  }
}
public class Background{//背景
  private int[][][] colors;
  private int r,g,b;
  private int w;
  private int theX, theY;
  
  public Background(){
    colors = new int[12][24][3];
    w = width/24;
  }
  public void display(){
    for(int i=0;i<12;i++){
      for(int j=0;j<24;j++){
        r = colors[i][j][0];
        g = colors[i][j][1];
        b = colors[i][j][2];
        fill(r,g,b);
        rect(i*w,j*w,w,w);
      }
    }
    for(int i=0; i<24; i++){
      if(checkLine(i)){//判斷是否Full Full才可消
        RemoveRow(i);//消除
      }
    }
  }
  public void writeShape(Shape s){
    for(int i=0;i<4;i++){
      theX = s.theShape[i][0];
      theY = s.theShape[i][1];
      colors[theX][theY][0] = s.r;
      colors[theX][theY][1] = s.g;
      colors[theX][theY][2] = s.b;
    }
  }
  //check for a complete line(boolean)
  public boolean checkLine(int row){
    for(int i=0; i<12; i++){
      if(colors[i][row][0]==0 && colors[i][row][1]==0 && colors[i][row][2]==0){
        return false;
      }
    }
    return true;
  }
  public void RemoveRow(int row){//消行
    int[][][] newbackground = new int[12][24][3];
    for(int i=0; i>12; i++){
      for(int j=23; j>row; j--){
        for(int a=0; a<3; a++){
          newbackground[i][j][a]=colors[i][j][a];
        }
      }
    }
    for(int r=row; r>=1; r--){
      for(int j=0; j<12; j++){
        newbackground[j][r][0]=colors[j][r-1][0];
        newbackground[j][r][1]=colors[j][r-1][1];
        newbackground[j][r][2]=colors[j][r-1][2];
      }
    }
    colors=newbackground;
  }
}
void keyPressed(){
  if(keyCode == RIGHT){
    shape.moveShape("RIGHT"); 
  }
  else if(keyCode == LEFT){
    shape.moveShape("LEFT");
  }
  else if(keyCode == DOWN){
    shape.moveShape("DOWN");
  }
}

void keyReleased(){
  if(keyCode == UP){
    shape.rotate();
    shape.rotate();
  }
  shape.rotCount++;
}
