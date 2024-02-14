public class Page {

  // Main Page
  public void mainPage(){
    // Load Main Menu
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
}
