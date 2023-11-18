//variables
boolean ready;
boolean play;
boolean gameOver;
int score;

ShyGuy shy1 = new ShyGuy();
ShyGuy shy2 = new ShyGuy();
ShyGuy shy3 = new ShyGuy();
ShyGuy shy4 = new ShyGuy();

void setup(){
  size(400, 400);
  background(60, 162, 240);
  score = 0;
}

void draw(){
  background(60, 162, 240);
  drawSun();
  shy1.drawShyGuy(325, 103);
  drawLayer(130); //top
  shy2.drawShyGuy(250, 193);
  drawLayer(220); //medium
  shy3.drawShyGuy(175, 284);
  drawLayer(310); //bottom
  shy4.drawShyGuy(100, 373);
  
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
  fill(247, 216, 15, 20);
  circle(360, 30, 200);
  
  fill(247, 216, 15, 20);
  circle(360, 30, 160);
  
  fill(247, 216, 15, 20);
  circle(360, 30, 100);
  
  fill(247, 216, 15, 255);
  circle(360, 30, 40);
}
