//variables
int score = 0;
boolean beenClicked;
String gameState = "menu";
float mX;
float mY;
ArrayList<ShyGuy> shyguysTop = new ArrayList<ShyGuy>();
ArrayList<ShyGuy> shyguysMid = new ArrayList<ShyGuy>();
ArrayList<ShyGuy> shyguysBot = new ArrayList<ShyGuy>();
ArrayList<ShyGuy> shyguysFloor = new ArrayList<ShyGuy>();
ShyGuy shyguyMenu = new ShyGuy();

void setup(){
  noCursor();
  size(400, 400);
  background(60, 162, 240);
  
  shyguyMenu.prep(" ");
  
  for (int i = 0; i < 2; i++){
  shyguysTop.add(new ShyGuy());
  shyguysMid.add(new ShyGuy());
  shyguysBot.add(new ShyGuy());
  shyguysFloor.add(new ShyGuy());
  }
  
  for (ShyGuy part : shyguysTop) {
    part.prep("top");
    part.randomizeX();
  }
  for (ShyGuy part : shyguysMid) {
    part.prep("mid");
    part.randomizeX();
  }
  for (ShyGuy part : shyguysBot) {
    part.prep("bot");
    part.randomizeX();
  }
  for (ShyGuy part : shyguysFloor) {
    part.prep("floor");
    part.randomizeX();
  }
  
}

void draw(){
  switch (gameState) {
    case "menu":
      drawMenu();
      break;
    case "play":
      drawPlay();
      break;
    case "gameOver":
      drawGameOver();
      break;
  }
}

void drawMenu(){
  background(60, 162, 240);
  drawLayer(300);
  shyguyMenu.show(90);
  textSize(40);
  text("Whack a Shy Guy", 65, 100);
  textSize(20);
  text("Click to start", 150, 155);
  if (key == ' '){
    gameState = "play";
  }
}

void drawPlay(){
  
  background(60, 162, 240);
  drawSun();
  fill(0);
  textSize(17);
  text("Score: "+ score, 10, 20); 

  for (ShyGuy part : shyguysTop) {
    part.show(part.newX);
  }
  
  drawLayer(130); //top
  
  for (ShyGuy part : shyguysMid) {
    part.show(part.newX);
  }
  
  drawLayer(220); //medium

  for (ShyGuy part : shyguysBot) {
    part.show(part.newX);
  }
  drawLayer(310); //bottom

  for (ShyGuy part : shyguysFloor) {
    part.show(part.newX);
  }
  
  mX = constrain(mouseX, 10, 390);
  mY = constrain(mouseY, 10, 390);
  ellipseMode(CENTER);
  stroke(0, 255, 0);
  strokeWeight(1.5);
  noFill();
  circle(mX, mY, 20);
  line(mX, mY-20, mX, mY+20);
  line(mX+20, mY, mX-20, mY);
  
  if (beenClicked){
    score += 1;
    beenClicked = false;
    println("I've been clicked!");
  }
}


void drawGameOver(){
  
}

void drawLayer(int y){
  fill(209, 188, 144);
  noStroke();
  rectMode(CORNER);
  rect(0, 0 + y, 400, 100);
  //grass
  fill(19, 145, 34);
  rect(0, 0 + y, 400, 20);
  for (int i = 0; i < 400; i += 40){
    fill(19, 145, 34);
    triangle(0 + i, 20 + y, 20 + i, 20 + y, 10 + i, 35 + y);
  }
  for (int i = 20; i < 400; i += 40){
    fill(41, 171, 57);
    triangle(0 + i, 20 + y, 20 + i, 20 + y, 10 + i, 40 + y);
  }
}

void drawSun(){
  ellipseMode(CENTER);
  noStroke();
  fill(247, 216, 15, 20);
  circle(360, 30, 200);
  
  fill(247, 216, 15, 20);
  circle(360, 30, 160);
  
  fill(247, 216, 15, 20);
  circle(360, 30, 100);
  
  fill(247, 216, 15, 255);
  circle(360, 30, 40);
}


void mousePressed() {
  if (gameState == "play"){
    for (ShyGuy part : shyguysTop) {
      if (mouseX >= part.pos.x-15 && mouseX <= part.pos.x - 15 + 30 && mouseY >= part.pos.y-20 && mouseY <= part.pos.y-20 + 46 && part.moveDown == false) {    
        beenClicked = true;
        part.moveDown = true;
      }
    }
    for (ShyGuy part : shyguysMid) {
      if (mouseX >= part.pos.x-15 && mouseX <= part.pos.x - 15 + 30 && mouseY >= part.pos.y-20 && mouseY <= part.pos.y-20 + 46 && part.moveDown == false) {    
        beenClicked = true;
        part.moveDown = true;
      }
    }
    for (ShyGuy part : shyguysBot) {
      if (mouseX >= part.pos.x-15 && mouseX <= part.pos.x - 15 + 30 && mouseY >= part.pos.y-20 && mouseY <= part.pos.y-20 + 46 && part.moveDown == false) {    
        beenClicked = true;
        part.moveDown = true;
      }
    }
    for (ShyGuy part : shyguysFloor) {
      if (mouseX >= part.pos.x-15 && mouseX <= part.pos.x - 15 + 30 && mouseY >= part.pos.y-20 && mouseY <= part.pos.y-20 + 46 && part.moveDown == false) {    
        beenClicked = true;
        part.moveDown = true;
      }
    }
  } else if (gameState == "menu"){
    gameState = "play";
  }
  
}
