//variables
int score = 0;  //Skill #10
int highscore = 0;
int misses = 0;
int keepTime = 0;
int totalShyGuys;
String gameState = "menu";
String colour = "red";
float mX;
float mY;
PVector random = PVector.random2D();  //Skill #41
ArrayList<ShyGuy> shyguysTop = new ArrayList<ShyGuy>();  //Skill #34
ArrayList<ShyGuy> shyguysMid = new ArrayList<ShyGuy>();
ArrayList<ShyGuy> shyguysBot = new ArrayList<ShyGuy>();
ArrayList<ShyGuy> shyguysFloor = new ArrayList<ShyGuy>();
ShyGuy shyguyMenu = new ShyGuy();

void setup(){  //Skill #4
  noCursor();
  size(400, 400);
  background(60, 162, 240);  //Skill #5
  frameCount = 60;
  multiplyVector(random);
  
  shyguyMenu.prep(" ");
  
  //Skill #17
  for (int i = 0; i < 1; i++){  //Skill #9
    shyguysTop.add(new ShyGuy()); //Skill #34
    shyguysFloor.add(new ShyGuy());
    shyguysMid.add(new ShyGuy());
    shyguysBot.add(new ShyGuy());
    for (int j = 0; j < 2; j++){
      shyguysMid.add(new ShyGuy());
      shyguysBot.add(new ShyGuy());

    }
  }
  
  for (ShyGuy part : shyguysTop) {  //Skill #16
    part.prep("top"); //Skill #35
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
  switch (gameState) {  //Skill #15
    case "menu":
      drawMenu();
      break;  //Skill #18
    case "play":
      drawPlay();
      break;
    case "gameOver":
      drawGameOver();
      break;
    case "colourMenu":
      drawColourMenu();
      break;
  }
}

void drawMenu(){  //Skill #20
  background(60, 162, 240);
  drawLayer(300);
  changeColour(shyguyMenu);
  shyguyMenu.show(90);
  shyguyMenu.hit = false;
  shyguyMenu.moveUp = false;
  totalShyGuys = shyguysTop.size() + shyguysMid.size() + shyguysBot.size() + shyguysFloor.size(); //Skill #36
  textSize(40);
  text("Whack a Shy Guy", 63, 100);
  textSize(20);
  text("Can you get all " + totalShyGuys + " of them?", 94, 130);
  text("Highscore: " + highscore, 151, 175);
  text("Click to start", 150, 240);
  
}

void drawPlay(){
  
  background(60, 162, 240);
  drawSun();
  fill(0);
  textSize(17);
  text("Score: "+ score, 10, 20); 
  text("Misses: "+ misses, 100, 20); 
  

  for (ShyGuy part : shyguysTop) {
    changeColour(part);
    part.show(part.newX);  //Skill #29
  }
  
  drawLayer(130); //top
  
  for (ShyGuy part : shyguysMid) {
    changeColour(part);
    part.show(part.newX); 
  }
  
  drawLayer(220); //medium

  for (ShyGuy part : shyguysBot) {
    changeColour(part);  
    part.show(part.newX);
  }
  
  drawLayer(310); //bottom

  for (ShyGuy part : shyguysFloor) {
    changeColour(part);    
    part.show(part.newX);
  }
  
  mX = constrain(mouseX, 30, 370);  //Skill #6
  mY = constrain(mouseY, 30, 370);
  ellipseMode(CENTER);
  stroke(0, 255, 0);
  strokeWeight(1.5);
  noFill();
  circle(mX, mY, 20);
  line(mX, mY-20, mX, mY+20);
  line(mX+20, mY, mX-20, mY);
  
  
  
  if (keepTime < 600){  //Skill #13
    keepTime ++;
  }
  if (keepTime == 180){ //Skill #12
    for (ShyGuy part : shyguysTop) {
      part.moveUp = true;
    }
    for (ShyGuy part : shyguysMid) {
      part.moveUp = true;
    }
    for (ShyGuy part : shyguysBot) {
      part.moveUp = true;
    }
    for (ShyGuy part : shyguysFloor) {
      part.moveUp = true;
    }
    
  } else if (keepTime == 600){
    for (ShyGuy part : shyguysTop) {
      if (part.hidden == false){
        part.moveDown = true;
        misses += 1;
      }
    }
    for (ShyGuy part : shyguysMid) {
      if (part.hidden == false){
        part.moveDown = true;
        misses += 1;
      }
    }
    for (ShyGuy part : shyguysBot) {
      if (part.hidden == false){
        part.moveDown = true;
        misses += 1;
      }
    }
    for (ShyGuy part : shyguysFloor) {
      if (part.hidden == false){
        part.moveDown = true;
        misses += 1;
      }
    }
    keepTime = 0;
  }
  
  
  if (misses >= 15){
    gameState = "gameOver";
  }
  
  if (score > highscore){
    highscore = score;
  }
  
}


void drawGameOver(){
  background(60, 162, 240);
  drawLayer(300);
  changeColour(shyguyMenu);
  shyguyMenu.show(330);
  shyguyMenu.hit = true;
  textSize(40);
  text("GAME OVER", 105, 100);
  textSize(20);
  text("Press space to return to menu", 82, 155);
  text("Press C to change Shy Guy Colour", 68, 200);
  score = 0;
  misses = 0;
}

void drawColourMenu(){
  background(60, 162, 240);
  drawLayer(300);
  changeColour(shyguyMenu);
  shyguyMenu.show(200);
  shyguyMenu.hit = false;
  textSize(40);
  text("Colour Menu", 96, 50);
  textSize(15);
  text("Press 'r' for Red", 150, 90);
  text("Press 't' for Turquoise", 130, 110);
  text("Press 'b' for Black", 143, 130);
  text("Press 'p' for Purple", 141, 150);
  text("Press 'o' for Orange", 142, 170);
  text("Press 'g' for Grey", 143, 190);
  text("Press 's' for Salmon", 136, 210);
  text("Press Space to return to Menu", 109, 230);
  
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


void changeColour(ShyGuy part){  //Skill #24
  switch (colour) {
    case "red":
      part.colourCodes = part.red;
      break;
    case "turq":
      part.colourCodes = part.turq;
      break;
    case "black":
      part.colourCodes = part.black;
      break;
    case "purple":
      part.colourCodes = part.purple;
      break;
    case "orange":
      part.colourCodes = part.orange;
      break;
    case "grey":
      part.colourCodes = part.grey;
      break;
    case "salmon":
      part.colourCodes = part.salmon;
      break;
  }
}


void mousePressed() {  //Skill #7
  if (gameState == "play"){
    for (ShyGuy part : shyguysTop) {
      if (mouseX >= part.pos.x-15 && mouseX <= part.pos.x - 15 + 30 && mouseY >= part.pos.y-20 && mouseY <= part.pos.y-20 + 46 && part.moveDown == false && part.hidden == false) {    //Skill #14
        score += 1;
        println("I've been clicked!");
        part.moveDown = true;
        part.hit = true;
      }
    }
    for (ShyGuy part : shyguysMid) {
      if (mouseX >= part.pos.x-15 && mouseX <= part.pos.x - 15 + 30 && mouseY >= part.pos.y-20 && mouseY <= part.pos.y-20 + 46 && part.moveDown == false && part.hidden == false) {    
        score += 1;
        println("I've been clicked!");
        part.moveDown = true;
        part.hit = true;
      }
    }
    for (ShyGuy part : shyguysBot) {
      if (mouseX >= part.pos.x-15 && mouseX <= part.pos.x - 15 + 30 && mouseY >= part.pos.y-20 && mouseY <= part.pos.y-20 + 46 && part.moveDown == false && part.hidden == false) {    
        score += 1;
        println("I've been clicked!");
        part.moveDown = true;
        part.hit = true;
      }
    }
    for (ShyGuy part : shyguysFloor) {
      if (mouseX >= part.pos.x-15 && mouseX <= part.pos.x - 15 + 30 && mouseY >= part.pos.y-20 && mouseY <= part.pos.y-20 + 46 && part.moveDown == false && part.hidden == false) {    
        score += 1;
        println("I've been clicked!");
        part.moveDown = true;
        part.hit = true;
      }
    }
    
    
    for (ShyGuy part : shyguysTop) {
      if (dist(part.pos.x, part.pos.y, mouseX, mouseY) < 13) {   //Skill 40
        score += 2;
        println("I've been clicked!");
        part.moveDown = true;
        part.hit = true;
        println("shaun");
      }
    }
    for (ShyGuy part : shyguysMid) {
      if (dist(part.pos.x, part.pos.y, mouseX, mouseY) < 13) {    
        score += 2;
        println("I've been clicked!");
        part.moveDown = true;
        part.hit = true;
      }
    }
    for (ShyGuy part : shyguysBot) {
      if (dist(part.pos.x, part.pos.y, mouseX, mouseY) < 13) {    
        score += 2;
        println("I've been clicked!");
        part.moveDown = true;
        part.hit = true;
      }
    }
    for (ShyGuy part : shyguysFloor) {
      if (dist(part.pos.x, part.pos.y, mouseX, mouseY) < 13) {    
        score += 2;
        println("I've been clicked!");
        part.moveDown = true;
        part.hit = true;
      }
    }
  } else if (gameState == "menu"){
    gameState = "play";
  }
  
}

void keyPressed() {
  if (gameState == "gameOver" && key == ' '){
    gameState = "menu";
  } else if (gameState == "gameOver" && (key == 'c' || key == 'C')){
    gameState = "colourMenu";
  } else if (gameState == "colourMenu"){
    if (key == ' '){
      gameState = "menu";
    }
    if (key == 'r'){
      colour = "red";
    }
    if (key == 'b'){
      colour = "black";
    }
    if (key == 't'){
      colour = "turq";
    }
    if (key == 'p'){
      colour = "purple";
    }
    if (key == 'o'){
      colour = "orange";
    }
    if (key == 'g'){
      colour = "grey";
    }
    if (key == 's'){
      colour = "salmon";
    }
  }
}

void multiplyVector(PVector x){  //Skill #23
  x.mult(2); //Skill #43
}
