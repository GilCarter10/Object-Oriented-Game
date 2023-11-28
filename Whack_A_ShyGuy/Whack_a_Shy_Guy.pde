//variables
int score;
boolean beenClicked;
String gameState;
ArrayList<ShyGuy> shyguysTop = new ArrayList<ShyGuy>();
ArrayList<ShyGuy> shyguysMid = new ArrayList<ShyGuy>();
ArrayList<ShyGuy> shyguysBot = new ArrayList<ShyGuy>();
ArrayList<ShyGuy> shyguysFloor = new ArrayList<ShyGuy>();


void setup(){
  size(400, 400);
  background(60, 162, 240);
  score = 0;
  gameState = "menu";
  
  for (int i = 0; i < 2; i++){
  shyguysTop.add(new ShyGuy());
  shyguysMid.add(new ShyGuy());
  shyguysBot.add(new ShyGuy());
  shyguysFloor.add(new ShyGuy());
  }
  
  for (ShyGuy part : shyguysTop) {
    part.randomizeX();
  }
  for (ShyGuy part : shyguysMid) {
    part.randomizeX();
  }
  for (ShyGuy part : shyguysBot) {
    part.randomizeX();
  }
  for (ShyGuy part : shyguysFloor) {
    part.randomizeX();
  }
  
}

void draw(){
  switch (gameState) {
    case "menu":
      drawMenu();
    case "play":
      drawPlay();
    case "game over":
      drawGameOver();
  }
}

void drawMenu(){
  
}

void drawPlay(){
  background(60, 162, 240);
  drawSun();
  fill(0);
  textSize(17);
  text("Score: "+ score, 10, 20); 
  

  for (ShyGuy part : shyguysTop) {
    part.show(part.newX, 103);
  }
  
  drawLayer(130); //top
  
  for (ShyGuy part : shyguysMid) {
    part.show(part.newX, 193);
  }
  
  drawLayer(220); //medium

  for (ShyGuy part : shyguysBot) {
    part.show(part.newX, 284);
  }
  drawLayer(310); //bottom

  for (ShyGuy part : shyguysFloor) {
    part.show(part.newX, 373);
  }
  
  
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
  for (ShyGuy part : shyguysTop) {
    if (mouseX >= part.pos.x-15 && mouseX <= part.pos.x - 15 + 30 && mouseY >= part.pos.y-20 && mouseY <= part.pos.y-20 + 46) {    
      beenClicked = true;
    }
  }
  for (ShyGuy part : shyguysMid) {
    if (mouseX >= part.pos.x-15 && mouseX <= part.pos.x - 15 + 30 && mouseY >= part.pos.y-20 && mouseY <= part.pos.y-20 + 46) {    
      beenClicked = true;
    }
  }
  for (ShyGuy part : shyguysBot) {
    if (mouseX >= part.pos.x-15 && mouseX <= part.pos.x - 15 + 30 && mouseY >= part.pos.y-20 && mouseY <= part.pos.y-20 + 46) {    
      beenClicked = true;
    }
  }
  for (ShyGuy part : shyguysFloor) {
    if (mouseX >= part.pos.x-15 && mouseX <= part.pos.x - 15 + 30 && mouseY >= part.pos.y-20 && mouseY <= part.pos.y-20 + 46) {    
      beenClicked = true;
    }
  }

}
