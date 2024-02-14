PImage mainMenu, startButton, helpButton, scoreBoardButton, aboutButton, gameTitle, diverImage, sharkImage, crabPlayer;

int pageNumber;

int buttonWidth = 180; 
int buttonHeight = 70;
color buttonColor;
color textColor;

Page page; 

void setup() {
  size(600, 700);
  buttonColor = color(255, 255, 255);
  textColor = color(255);
  page = new Page();
  pageNumber = 1;
  
  mainMenu = loadImage("../assets/deep-sea2.jpg");
  startButton = loadImage("../assets/start-button.png");
  helpButton = loadImage("../assets/help-button.png");
  scoreBoardButton = loadImage("../assets/scoreboard-button.png");
  aboutButton = loadImage("../assets/about-button.png");
  gameTitle = loadImage("../assets/game-title.png");
  diverImage = loadImage("../assets/diver-image.png");
  sharkImage = loadImage("../assets/shark-image.png");
  crabPlayer = loadImage("../assets/crab.png");
  
}


void draw() {
  if(pageNumber == 1){
    page.mainPage();
  }
}

void mousePressed() {
  if (pageNumber == 1){
     // Check if the mouse is inside the Start button on Main Menu
     if (mouseX > width/2 - buttonWidth/2 && mouseX < width/2 + buttonWidth/2 &&
      mouseY > height/2 - buttonHeight && mouseY < height/2) {
      // Start button clicked, you can add your code here to start the game
      println("Start button clicked");
     }
     // Check if Mouse is inside the About Button on Main Menu
     if (mouseX > width/2 - buttonWidth/2 && mouseX < width/2 + buttonWidth/2 &&
      mouseY > (height/2 - buttonHeight) + 100 && mouseY < (height/2) + 100) {
      // Start button clicked, you can add your code here to start the game
      println("About button clicked");
     }
     // Check if Mouse is inside the Help Button on Main Menu
     if (mouseX > width/2 - buttonWidth/2 && mouseX < width/2 + buttonWidth/2 &&
      mouseY > (height/2 - buttonHeight) + 200 && mouseY < (height/2) + 200) {
      // Start button clicked, you can add your code here to start the game
      println("Help button Clicked");
     }
     // Check if Mouse is inside the Leaderboard Button on Main Menu
     if (mouseX > width/2 - buttonWidth/2 && mouseX < width/2 + buttonWidth/2 &&
      mouseY > (height/2 - buttonHeight) + 300 && mouseY < (height/2) + 300) {
      // Start button clicked, you can add your code here to start the game
      println("LeaderBoard button Clicked");
     }
  }
 
}
