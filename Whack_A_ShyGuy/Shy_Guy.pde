
class ShyGuy {  //Skill #28
   
  PVector pos;  //Skill #38
  PVector speed;  //Skill #39
  float newX;
  float y;
  boolean moveDown = false;
  boolean moveUp = false;
  boolean hit;
  boolean hidden = true;
  String Level;
  int[] colourCodes;
  int[] red = { 219, 44, 24 }; //Skill #33
  int[] turq = { 59, 219, 174 };
  int[] black = { 55, 55, 55 };
  int[] purple = { 125, 32, 201 };
  int[] orange = { 235, 165, 26 };
  int[] grey = { 115, 115, 115 }; //arrays for colour changes
  int[] salmon = { 230, 165, 189 };
  
  void prep(String level){  //Skill #30
    frameRate(100);
    Level = level; //level is a variable assigned to shy guys that lets me know what height they are standing at
    switch(level){
      case "top":
        y = 150;
        speed = new PVector(103, 150);
        break;
      case "mid":
        y = 240;
        speed = new PVector(193, 240);
        break;
      case "bot":
        y = 331;
        speed = new PVector(284, 331);
        break;
      case "floor":
        y = 420;
        speed = new PVector(373, 420);
        break;
      default:
        y = 274;
        speed = new PVector(0, 0);
      }
      
   }
  
  void show(float x){
    pos = new PVector(x, y);
    
    //draw shy guy with corrosponding colour
    fill(colourCodes[0], colourCodes[1], colourCodes[2]);  //Skill #2
    rect(pos.x - 13.5, pos.y, 30, 27);  //Skill #1
    ellipseMode(CORNER);  //Skill #3
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

    
    if (hit){
      //draw shy guy with X's over eyes
      fill(colourCodes[0], colourCodes[1], colourCodes[2]);
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
      stroke(36, 35, 35);
      //ellipse(pos.x - 5.5, pos.y - 11, 5, 8);
      //ellipse(pos.x + 3.5, pos.y - 11, 5, 8);
      line(pos.x - 5.5, pos.y - 11, pos.x - 1.5, pos.y - 5);
      line(pos.x - 5.5, pos.y - 5, pos.x - 1.5, pos.y - 11);
      line(pos.x + 8, pos.y - 11, pos.x + 4, pos.y - 5);
      line(pos.x + 8, pos.y - 5, pos.x + 4, pos.y - 11);
      noStroke();
      fill(36, 35, 35);
      ellipse(pos.x, pos.y, 3, 3);
    }
    
    
    if (moveUp && y > speed.x){ //speed PVector here represents the "up goal" and "down goal" the shy guy is trying to go to
      //move up while below the desired position
      y--;  //Skill #8
    } else if (moveUp && y == speed.x){
      moveUp = false;
      hidden = false;
    }
    
    if (moveDown && y < speed.y){
      //move down while below the desired position
      y++;
      hidden = true;
    } else if (moveDown && y == speed.y){
      moveDown = false;
     
      //RESET
      randomizeX();
      hit = false;

    }

  }
  

  
  float randomizeX(){   //Skill #21
    //randomize the x value of the shy guy and return the new value
    newX = random(50, 350);
    
    return newX;
  }
  

}
