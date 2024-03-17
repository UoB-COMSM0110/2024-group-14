public class Page {
  GameService gameService;

  Page(GameService gameService) {
    this.gameService = gameService;
  }

  // Main Page
  public void mainPage() {
    // Load Main Menu
    surface.setTitle("Deep Sea Fall!! Main Menu");
    image(mainMenu, 0, 0, width, height);

    // Loading Game Title
    gameTitle.resize(550, 0);
    image(gameTitle, 25, 60);

    // Loading Diver Image
    diverImage.resize(200, 0);
    image(diverImage, 0, 500);

    // Loading Shark Image
    sharkImage.resize(200, 0);
    image(sharkImage, 400, 500);

    // Loading Crab/Player Image
    crabPlayer.resize(70, 0);
    image(crabPlayer, 300, 232);

    // Draw Start Button
    image(startButton, width/2 - buttonWidth/2, height/2 - buttonHeight, buttonWidth, buttonHeight);

    image(aboutButton, width/2 - buttonWidth/2, (height/2 - buttonHeight) + 100, buttonWidth, buttonHeight);

    image(helpButton, (width/2 - buttonWidth/2) + 3, (height/2 - buttonHeight) + 200, buttonWidth, buttonHeight);

    // Loading Leaderboard Button
    //scoreBoardButton.resize(350, 0);
    image(scoreBoardButton, width/2 - buttonWidth/2, (height/2 - buttonHeight) + 300, buttonWidth, buttonHeight);
  }

  private void drawStatusBar() {
    fill(255);
    rect(0, 0, width, statusBarHeight);
    image(backButton, backButtonX, backButtonY, backButtonWidth, backButtonHeight);
    image(scoreLabel, backButtonX + backButtonWidth + 10, backButtonY, backButtonWidth, backButtonHeight);
    gameService.drawLivesOnScreen();
    gameService.displayScore();
  }

  public void startPage() {
    image(mainMenu, 0, 0, width, height);
    surface.setTitle("Start");
    drawStatusBar();

    levelLogo.resize(300, 0);
    image(levelLogo, 160, 50);

    image(easyButton, width/2 - buttonWidth/2, (height/2 - buttonHeight) - 75, buttonWidth, buttonHeight);

    image(mediumButton, width/2 - buttonWidth/2, (height/2 - buttonHeight) + 75, buttonWidth, buttonHeight);

    image(hardButton, width/2 - buttonWidth/2, (height/2 - buttonHeight) + 225, buttonWidth, buttonHeight);
  }

  public void gamePlayPage() {
    image(mainMenu, 0, 0, width, height);
    surface.setTitle("Start");
    drawStatusBar();

    if (!gameService.isGameOver()) {
      gameService.updateBall();
      //thread("updateBall");
      //if(gameModel.getLevel().equals("HARD") && random(1) < 0.5){
      //  gameService.invertGravity();
      //}
      gameService.updatePlatforms();
      gameService.updateCoins();
      gameService.checkCollision();
      thread("checkCollision");
      handleInput();
      gameService.checkGameOver();
      gameService.updateScore();
      gameService.displayCollectedCoins();
      gameService.displayScore();
      gameService.drawLivesOnScreen();
    } else {
      gameService.displayGameOver();
      if (keyPressed && (key == 'r' || key == 'R')) {
        gameService.initializeGame();
      }
    }
  }

  public void handleInput() {
    if (keyPressed) {
      if (keyCode == LEFT) {
        ball.speedX = -ball.maxSpeed;
      } else if (keyCode == RIGHT) {
        ball.speedX = ball.maxSpeed;
      }
    } else {
      ball.speedX = 0;
    }
  }

  public void aboutPage() {
    image(mainMenu, 0, 0, width, height);
    surface.setTitle("About Page");
    image(backButton, backButtonX, backButtonY, backButtonWidth, backButtonHeight);

    // Load Lore Logo
    loreLogo.resize(250, 0);
    image(loreLogo, 175, 0);

    PFont font = createFont("../assets/pixel-font-text.ttf", 16);
    textFont(font);
    text("A huge calamity has brought the world to a halt.", 10, 120);
    text("The concept of life is not as apparent. Mysterious ", 10, 150);
    text("phenomenons have been occurring throughout this ", 10, 180);
    text("universe. An inexplainable phenomenon is the ", 10, 210);
    text("conversion of humans into animals. The poor diver ", 10, 240);
    text("was the first to experience this - he unforunately ", 10, 270);
    text("turned into a crab. As he claws his way through ", 10, 300);
    text("the deep sea, he can only hope that one day he ", 10, 330);
    text("will return back to his former self. Forunately, ", 10, 360);
    text("there is an old wives-tale of animals converting ", 10, 390);
    text("back to humans. It states: 'For aquatic animals the ", 10, 420);
    text("only way to revert back to the human state, is to ", 10, 450);
    text("venture to the depths of the ocean and reach 100 ", 10, 480);
    text("coins.' Depending on how choppy the waters are, ", 10, 510);
    text("the difficulty of reaching 100 coins could vary. ", 10, 540);
    text("Now, let's get started and try to save our diver ", 10, 570);
    text("from this horrible misfortune.", 10, 600);
    fill(0, 0, 0);

    // Loading Crab/Player Image
    crabPlayer.resize(70, 0);
    image(crabPlayer, 380, 650);

    speechBubble.resize(190, 0);
    image(speechBubble, 400, 570);
    text("Best of Luck!", 420, 615);
    fill(255, 408, 612);
  }

  public void helpPage() {
    image(mainMenu, 0, 0, width, height);
    surface.setTitle("Help Page");
    image(backButton, backButtonX, backButtonY, backButtonWidth, backButtonHeight);
    image(howToPlayLabel, (width/2 - width/4) + 3, 10, width/2, buttonHeight);
    PFont font = createFont("../assets/pixel-font-text.ttf", 16);
    textFont(font);
    text("Control the crab using the arrow keys", 50, 120);
    text("and space bar", 50, 140);
    image(leftArrowLabel, width/2 - buttonWidth/2, height/2 - buttonHeight*2, buttonWidth, buttonHeight);
    text("Move Left", width/2 - buttonWidth/4, height/2 - buttonHeight + 30);
    image(rightArrowLabel, width/2 - buttonWidth/2, height/2, buttonWidth, buttonHeight);
    text("Move Right", width/2 - buttonWidth/4, height/2 + buttonHeight + 30);
    image(spaceKeyLabel, width/2 - buttonWidth/2, height/2 + buttonHeight*2, buttonWidth, buttonHeight);
    text("Crab Jump", width/2 - buttonWidth/4, height/2 + buttonHeight*3 + 30);
  }

  public void leaderboardPage() {
    image(mainMenu, 0, 0, width, height);
    surface.setTitle("Leaderboard");
    image(backButton, backButtonX, backButtonY, backButtonWidth, backButtonHeight);
    
    // Load Leaderboard Logo
    leaderBoardLogo.resize(350, 0);
    image(leaderBoardLogo, 122, 50);
  }
}
