public class Page {

  // Main Page
  public void mainPage(){
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
  
  public void drawStatusBar(){
    fill(255);
    rect(0, 0, width, statusBarHeight);
    image(backButton, backButtonX, backButtonY, backButtonWidth, backButtonHeight);
    image(scoreLabel, backButtonX + backButtonWidth + 10, backButtonY, backButtonWidth, backButtonHeight);
  }
  
  public void startPage(){
    image(mainMenu, 0, 0, width, height);
    surface.setTitle("Start");
    drawStatusBar();
  }
  
  public void aboutPage(){
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
    
    shipImage.resize(150, 0);
    image(shipImage, 250, 599);
    
    speechBubble.resize(150, 0);
    image(speechBubble, 400, 580);
    fill(0, 408, 612);
    text("Best of Luck!", 400, 600);
    
  }
  
  public void helpPage(){
    image(mainMenu, 0, 0, width, height);
    surface.setTitle("Help Page");
    image(backButton, backButtonX, backButtonY, backButtonWidth, backButtonHeight);
  }
  
  public void leaderboardPage(){
    image(mainMenu, 0, 0, width, height);
    surface.setTitle("Leaderboard");
    image(backButton, backButtonX, backButtonY, backButtonWidth, backButtonHeight);
  }
}
