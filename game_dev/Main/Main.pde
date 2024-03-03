import ddf.minim.*;
PImage mainMenu, spikes, leaderBoardLogo, platforms, coinModel, howToPlayLabel, livesLabel, shipImage, speechBubble, scoreLabel, startButton, helpButton, scoreBoardButton, statusBar, aboutButton, gameTitle, diverImage, sharkImage, crabPlayer, backButton, loreLogo, leftArrowLabel, rightArrowLabel, spaceKeyLabel, easyButton, levelLogo, mediumButton, hardButton;

int pageNumber;
Minim minim;
GameModel gameModel;
GameService gameService;
Ball ball;
Player player;
static AudioPlayer titlePlayer, gamePlayer;

int buttonWidth = 180;
int musicDelay = 150;
int buttonHeight = 70;
int backButtonWidth = 100;
int backButtonHeight = 30;
int livesWidth = 30;
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
  gameModel = new GameModel();
  player = new Player();
  ball = new Ball(10.0, 10.0); // TODO set some meaningful initial X, Y
  gameService = new GameService(gameModel, ball, player);
  page = new Page(gameService);
  pageNumber = 1;

  minim = new Minim(this);
  titlePlayer = minim.loadFile("../assets/music/titlescreen-music.mp3");
  titlePlayer.loop();
  gamePlayer = minim.loadFile("../assets/music/gameplay-music.mp3");

  mainMenu = loadImage("../assets/deep-sea2.jpg");
  spikes = loadImage("../assets/platform-spikes.png");
  platforms = loadImage("../assets/platform01.png");
  coinModel = loadImage("../assets/coin.png");
  livesLabel = loadImage("../assets/heart-image.png");
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
  loreLogo = loadImage("../assets/lore-logo.png");
  speechBubble = loadImage("../assets/speech-bubble.png");
  easyButton = loadImage("../assets/easy-button.png");
  levelLogo = loadImage("../assets/level-image.png");
  mediumButton = loadImage("../assets/normal-button.png");
  hardButton = loadImage("../assets/hard-button.png");
  leaderBoardLogo = loadImage("../assets/leaderboard-logo.png");

  howToPlayLabel = loadImage("../assets/howToPlay.png");
  leftArrowLabel = loadImage("../assets/left-arrow.png");
  rightArrowLabel = loadImage("../assets/right-arrow.png");
  spaceKeyLabel = loadImage("../assets/space-key.png");
}

void changeMusic(AudioPlayer currentMusic, AudioPlayer newMusic) {
  if (!currentMusic.isPlaying() || newMusic.isPlaying()) {
    return;
  }
  currentMusic.pause();
  delay(musicDelay);
  newMusic.loop();
}

void musicStop(AudioPlayer player) {
  player.close();
  minim.stop();
  super.stop();
}

void draw() {
  switch(pageNumber) {
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
  case 6:
  case 7:
  case 8:
    page.gamePlayPage();
    break;
  default:
    page.mainPage();
    break;
  }
}

void checkCollision(){
  gameService.checkCollision();
}

void mousePressed() {
  if (pageNumber == 1) {
    // Check if the mouse is inside the Start button on Main Menu
    if (mouseX > width/2 - buttonWidth/2 && mouseX < width/2 + buttonWidth/2 &&
      mouseY > height/2 - buttonHeight && mouseY < height/2) {
      // Start button clicked, you can add your code here to start the game
      changeMusic(titlePlayer, gamePlayer);
      println("Start button clicked");
      pageNumber = 2;
    }
    // Check if Mouse is inside the About Button on Main Menu
    if (mouseX > width/2 - buttonWidth/2 && mouseX < width/2 + buttonWidth/2 &&
      mouseY > (height/2 - buttonHeight) + 100 && mouseY < (height/2) + 100) {
      // Start button clicked, you can add your code here to start the game
      println("About button clicked");
      pageNumber = 3;
      changeMusic(gamePlayer, titlePlayer);
    }
    // Check if Mouse is inside the Help Button on Main Menu
    if (mouseX > width/2 - buttonWidth/2 && mouseX < width/2 + buttonWidth/2 &&
      mouseY > (height/2 - buttonHeight) + 200 && mouseY < (height/2) + 200) {
      // Start button clicked, you can add your code here to start the game
      println("Help button Clicked");
      pageNumber = 4;
      changeMusic(gamePlayer, titlePlayer);
    }
    // Check if Mouse is inside the Leaderboard Button on Main Menu
    if (mouseX > width/2 - buttonWidth/2 && mouseX < width/2 + buttonWidth/2 &&
      mouseY > (height/2 - buttonHeight) + 300 && mouseY < (height/2) + 300) {
      // Start button clicked, you can add your code here to start the game
      println("LeaderBoard button Clicked");
      pageNumber = 5;
      changeMusic(gamePlayer, titlePlayer);
    }
  }
  if (pageNumber == 2) {
    // Check if the Mouse is inside the Easy Button
    if (mouseX > width/2 - buttonWidth/2 && mouseX < width/2 + buttonWidth/2 &&
      mouseY > (height/2 - buttonHeight) - 75 && mouseY < (height/2) - 75) {
      println("Easy button clicked");
      gameModel.setLevel("EASY");
      pageNumber = 6;
    }
    // Check if the Mouse is inside the Medium Button
    if (mouseX > width/2 - buttonWidth/2 && mouseX < width/2 + buttonWidth/2 &&
      mouseY > (height/2 - buttonHeight) + 75 && mouseY < (height/2) + 75) {
      println("Medium button clicked");
      gameModel.setLevel("MEDIUM");
      pageNumber = 7;
    }
    // Check if the Mouse is inside the Hard Button
    if (mouseX > width/2 - buttonWidth/2 && mouseX < width/2 + buttonWidth/2 &&
      mouseY > (height/2 - buttonHeight) + 225 && mouseY < (height/2) + 225) {
      println("Hard button clicked");
      gameModel.setLevel("HARD");
      pageNumber = 8;
    }
  }
  // Check if Mouse is inside the Back Button on Any Other Page
  if (mouseX > backButtonX && mouseX < backButtonX + backButtonWidth &&
    mouseY > backButtonY && mouseY < backButtonY + backButtonHeight) {
    println("Back Button clicked");
    pageNumber = 1;
    changeMusic(gamePlayer, titlePlayer);
  }
}
