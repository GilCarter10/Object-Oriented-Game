
class ShyGuy {
  
  PVector pos;
  
  void drawShyGuy(float x, float y){
    pos = new PVector(x, y);
    
    fill(219, 44, 24);
    rect(pos.x - 13.5, pos.y, 30, 27);
    ellipseMode(CORNER);
    ellipse(pos.x - 13.5, pos.y - 20, 30, 35);
    triangle(pos.x - 13.5, pos.y + 22, pos.x - 16.5, pos.y + 27, pos.x - 13.5, pos.y + 27);
    triangle(pos.x + 16.5, pos.y + 22, pos.x + 19.5, pos.y + 27, pos.x + 16.5, pos.y + 27);
    //arms
    triangle(pos.x - 13.5, pos.y + 5, pos.x - 18.5, pos.y + 13, pos.x - 13.5, pos.y + 10);
    triangle(pos.x + 16.5, pos.y + 5, pos.x + 21.5, pos.y + 13, pos.x + 16.5, pos.y + 10);
    
    fill(181, 27, 27);
    rect(pos.x - 13.5, pos.y + 18, 30, 2);
    stroke(232, 179, 5);
    fill(250, 207, 17);
    rect(pos.x - 2.5, pos.y + 17, 7, 4);
    
    //face
    fill(227, 225, 222);
    noStroke();
    ellipse(pos.x - 10.5, pos.y - 17, 24, 25);
    fill(36, 35, 35);
    ellipse(pos.x - 5.5, pos.y - 11, 5, 8);
    ellipse(pos.x + 3.5, pos.y - 11, 5, 8);
    
    ellipse(pos.x, pos.y, 3, 3);
    
    //hitbox
    noFill();
    //stroke(0,255,0);
    rect(pos.x - 15, pos.y - 20, 30, 46);
  }
  
  void upAnimate(){

  }
  
  void downAnimate(){
    
  }
  
  
}
