PImage mainMenu, scoreLabel, startButton, helpButton, scoreBoardButton, statusBar, aboutButton, gameTitle, diverImage, sharkImage, crabPlayer, backButton;

int pageNumber;

int buttonWidth = 180; 
int buttonHeight = 70;
int backButtonWidth = 100;
int backButtonHeight = 30;
int backButtonX = 3;
int backButtonY = 3;
int statusBarHeight = 36;
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
  scoreLabel = loadImage("../assets/score-button.png");
  backButton = loadImage("../assets/back-button.png");
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
  switch(pageNumber){
    case 1:
      page.mainPage();
      break;
     case 2:
       page.startPage();
       break;
     case 3:
       page.aboutPage();
       break;
     case 4:
       page.helpPage();
       break;
     case 5:
       page.leaderboardPage();
       break;
     default:
       page.mainPage();
       break;
     
  }
}

void mousePressed() {
  if (pageNumber == 1){
     // Check if the mouse is inside the Start button on Main Menu
     if (mouseX > width/2 - buttonWidth/2 && mouseX < width/2 + buttonWidth/2 &&
      mouseY > height/2 - buttonHeight && mouseY < height/2) {
      // Start button clicked, you can add your code here to start the game
      println("Start button clicked");
       pageNumber = 2;
     }
     // Check if Mouse is inside the About Button on Main Menu
     if (mouseX > width/2 - buttonWidth/2 && mouseX < width/2 + buttonWidth/2 &&
      mouseY > (height/2 - buttonHeight) + 100 && mouseY < (height/2) + 100) {
      // Start button clicked, you can add your code here to start the game
       println("About button clicked");
       pageNumber = 3;
     }
     // Check if Mouse is inside the Help Button on Main Menu
     if (mouseX > width/2 - buttonWidth/2 && mouseX < width/2 + buttonWidth/2 &&
      mouseY > (height/2 - buttonHeight) + 200 && mouseY < (height/2) + 200) {
      // Start button clicked, you can add your code here to start the game
       println("Help button Clicked");
       pageNumber = 4;
     }
     // Check if Mouse is inside the Leaderboard Button on Main Menu
     if (mouseX > width/2 - buttonWidth/2 && mouseX < width/2 + buttonWidth/2 &&
      mouseY > (height/2 - buttonHeight) + 300 && mouseY < (height/2) + 300) {
      // Start button clicked, you can add your code here to start the game
       println("LeaderBoard button Clicked");
       pageNumber = 5;
     }
  }
  else{
    // Check if Mouse is inside the Back Button on Any Other Page
    if (mouseX > backButtonX && mouseX < backButtonX + backButtonWidth &&
      mouseY > backButtonY && mouseY < backButtonY + backButtonHeight) {
        println("Back Button clicked");
        pageNumber = 1;
      }
  }
 
}
