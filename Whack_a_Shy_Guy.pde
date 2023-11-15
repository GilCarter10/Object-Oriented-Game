//variables
boolean ready;
boolean play;
boolean gameOver;

ShyGuy bob = new ShyGuy();

void setup(){
  size(400, 400);
  background(60, 162, 240);
}

void draw(){
  background(60, 162, 240);
  drawSun();
  drawLayer(130);
  bob.drawShyGuy();
  drawLayer(220);
  drawLayer(310);
  
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
