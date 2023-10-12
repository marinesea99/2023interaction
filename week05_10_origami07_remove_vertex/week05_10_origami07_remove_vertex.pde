ArrayList<PVector> pt;
void setup(){
  size(400, 400, P3D);
  pt = new ArrayList<PVector>();
  for(int i=0; i<37; i++){
    pt.add( new PVector(random(400), random(400)) );
  }//假設畫面中，點好了20個頂點
}
void draw(){
  background(255);
  for(PVector p : pt){//畫出20個頂點
    ellipse(p.x, p.y, 10, 10);
  }
  if(ans!=null) ellipse(ans.x, ans.y, 15, 15);
}
PVector ans = null;
void mouseDragged(){
  if(mouseButton==CENTER && ans!=null){
    ans.x = mouseX;
    ans.y = mouseY;
  }  
}
void mousePressed(){
  if(mouseButton==LEFT) pt.add(new PVector(mouseX, mouseY));
  else if(mouseButton==CENTER){
    for(PVector p : pt){//厲害的for迴圈(不能增刪裡面的東西)
      if( dist(p.x, p.y, mouseX, mouseY) < 5){//找到購進的點
        ans = p;
      }
    }
  }
  else if(mouseButton==RIGHT){//右鍵，要刪掉，要用傳統的for迴圈
    for(int i=0; i<pt.size(); i++){//要寫2行，才能等於厲害的1行
      PVector p = pt.get(i);//要寫2行，才能等於厲害的1行
      if( dist(p.x, p.y, mouseX, mouseY) < 5){//找到購進的點
        pt.remove(i);//就把第(i)個點刪掉(刪的時候會把大資料結構都左移動一格)
      }
    }
  }
}
