//variables
int score;
boolean beenClicked;
String gameState;
ArrayList<ShyGuy> shyguys = new ArrayList<ShyGuy>();

ShyGuy shy1 = new ShyGuy();
ShyGuy shy2 = new ShyGuy();
ShyGuy shy3 = new ShyGuy();
ShyGuy shy4 = new ShyGuy();

void setup(){
  size(400, 400);
  background(60, 162, 240);
  score = 0;
  gameState = "menu";
  
  for (int i = 0; i < 5; i++){
  shyguys.add(new ShyGuy());
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
  
  shy1.drawShyGuy(325, 103);
  drawLayer(130); //top
  shy2.drawShyGuy(250, 193);
  drawLayer(220); //medium
  shy3.drawShyGuy(175, 284);
  drawLayer(310); //bottom
  shy4.drawShyGuy(100, 373);
  
  if (beenClicked){
    score += 1;
    shy1.downAnimate();
    beenClicked = false;
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
  if (mouseX >= shy1.pos.x-15 && mouseX <= shy1.pos.x - 15 + 30 && mouseY >= shy1.pos.y-20 && mouseY <= shy1.pos.y-20 + 46) {    
    beenClicked = true;
  }
}
