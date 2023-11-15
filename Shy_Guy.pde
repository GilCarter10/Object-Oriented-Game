
class ShyGuy {
  
  void drawShyGuy(){
    fill(219, 44, 24);
    rect(65, 190, 30, 27);
    ellipseMode(CORNER);
    ellipse(65, 170, 30, 35);
    triangle(65, 212, 62, 217, 65, 217);
    triangle(95, 212, 98, 217, 95, 217);
    //arms
    triangle(65, 195, 60, 203, 65, 200);
    triangle(95, 195, 100, 203, 95, 200);
    
    fill(181, 27, 27);
    rect(65, 208, 30, 2);
    stroke(232, 179, 5);
    fill(250, 207, 17);
    rect(76, 207, 7, 4);
    
    //face
    fill(227, 225, 222);
    noStroke();
    ellipse(68, 173, 24, 25);
    fill(36, 35, 35);
    ellipse(73, 179, 5, 8);
    ellipse(82, 179, 5, 8);
    ellipse(78.5, 190, 3, 3);
    
  }
}
