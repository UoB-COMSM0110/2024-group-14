import java.util.Timer;
import java.util.TimerTask;

public class GameService {
  private GameModel gameModel;
  private Ball ball;
  Player player;
  ArrayList<Platform> platforms;
  ArrayList<Coin> coins;
  final int platformInterval = 150;
  private boolean canJump = true;
  private boolean displayJumpText = false;

  public GameService(GameModel gameModel, Ball ball, Player player) {
    this.gameModel = gameModel;
    this.ball = ball;
    this.player = player;
    platforms = new ArrayList<>();
    coins = new ArrayList<>();
    initializeGame();
  }

  public void initializeGame() {
    platforms.clear();
    coins.clear();
    for (int i = 0; i < height; i += platformInterval) {
      Platform platform = new Platform(random(width - 100), height - i - platformInterval, gameModel);
      platforms.add(platform);

      if (random(1) < 0.2) {
        Coin coin = new Coin(platform.x + random(20, 80), platform.y - 20, platform.getPlatformSpeed());
        coins.add(coin);
      }
    }
    Platform goodPlatform = new Platform(random(width - 100), height/2, false, gameModel);
    platforms.add(goodPlatform);
    ball.setY(goodPlatform.y - 10);
    ball.setX(goodPlatform.getX() + goodPlatform.getWidth() / 2);
    
    gameModel.setScore(0);
    gameModel.setLives(3);
    gameModel.setIsGameOver(false);
    player.setCoinsCollected(0);
  }

  public void displayScore() {
    int score = gameModel.getScore();
    PFont font = createFont("../assets/pixel-font-text.ttf", 16);
    textFont(font);
    textSize(25);
    fill(0, 0, 0);
    text(score, backButtonX + backButtonWidth + 20 + backButtonWidth, backButtonY+25);
  }

  public void checkGameOver() {
    if(gameModel.getLives() == 0) gameModel.setIsGameOver(true);
    if (ball.getY() > height - 20 || ball.getY() < 0) {
      if (!gameModel.getIsGameOver()) {
        loseLife();
        if (gameModel.getLives() > 0) {
          respawn();
        } else {
          gameModel.setIsGameOver(true);
        }
      }
    }
  }

  public boolean isGameOver() {
    return gameModel.getIsGameOver();
  }

  public void gameOver() {
    gameModel.setLives(0);
  }
  
  public void jumpBall(){
     if(!gameModel.getLevel().equals("HARD")) return;
     if(ball.getJumpState()) return;
     ball.setJumpState(true);
     ball.update(gameModel.getGravity()*(-25));
     ball.setJumpState(false);
  }

  public void updatePlatforms() {
    for (int i = platforms.size() - 1; i >= 0; i--) {
      Platform p = platforms.get(i);

      // Check if the game level is set to "EASY"
      if (gameModel.getLevel().equals("EASY")) {
        // If it's EASY, disable platform movement and red platforms
        p.isMoving = false; // Set platform as not moving
      }
      
      p.move();
      p.display();
    }

    Platform bottomPlatform = platforms.get(platforms.size() - 1);
    if (bottomPlatform.y < height - platformInterval) {
      if(gameModel.getLevel().equals("HARD") && random(10) < 3){
        platforms.add(new Platform(random(width - 100), height, true, gameModel, false, -8));
      }
      else{
        platforms.add(new Platform(random(width - 100), height, gameModel));
      }

      // Generate a coin on top of the new platform
      if (random(1) < 0.2) {
        Coin coin = new Coin(bottomPlatform.x + random(20, 80), bottomPlatform.y - 20, bottomPlatform.getPlatformSpeed());
        coins.add(coin);
      }
    }

    if (platforms.get(0).y < 0) {
      platforms.remove(0);
    }
  }

  public void drawLivesOnScreen() {
    int lives = gameModel.getLives();
    for (int i=lives; i>0; i--) {
      image(livesLabel, width - i*livesWidth, backButtonY, livesWidth, backButtonHeight);
    }
  }

  public void displayGameOver() {
    textSize(32);
    fill(255);
    text("Game Over", width / 4, height / 2);
    textSize(20);
    text("Press 'R' to Restart", width / 4, height / 2 + 50);
  }

  public void loseLife() {
    gameModel.setLives(gameModel.getLives()-1);
  }

  public void checkCollision() {
    float x = ball.getX(), y = ball.getY();
    for (Platform p : platforms) {
      if (p.checkCollision(x, y + 10)) {
        if (p.isObstacle()) {
          loseLife();
          if (!isGameOver()) {
            respawn();
          } else {
            gameOver();
          }
          return;
        }
        ball.setY(p.y - 10);
        ball.setSpeedY(0);
        break;
      }
    }

    for (Coin c : coins) {
      if (c.checkCollision(x, y + 10)) {
        coins.remove(c);
        player.increaseCoinsCollected();

        if (player.getCoinsCollected() % 5 == 0) {
          gameModel.gainLife();
        }

        break;
      }
    }
  }

  public void updateCoins() {
    for (Coin c : coins) {
      c.display();
    }

    for (Coin c : coins) {
      // Update the coin position based on the platform movement
      c.move();
    }
  }

  public void updateScore() {
    gameModel.setScore(gameModel.getScore()+1);
  }

  public void displayCollectedCoins() {
    textSize(25);
    fill(0,0,0);
    text(player.getCoinsCollected(), backButtonX + 395, 30);
  }
  
  public void updateBall() {
        ball.update(gameModel.getGravity());
    }

  public Ball getBall() {
    return ball;
  }

  public void respawn() {
    if (!isGameOver()) {
      delay(500);
      ball.setSpeedY(0);
      ball.setSpeedX(0);

      // Filter out red platforms
      ArrayList<Platform> nonRedPlatforms = new ArrayList<Platform>();
      for (Platform platform : platforms) {
        if (!platform.isObstacle()) {
          nonRedPlatforms.add(platform);
        }
      }

      Platform goodPlatform = new Platform(random(width - 100), height/2, false, gameModel);
      platforms.add(goodPlatform);
      ball.setY(goodPlatform.y - 10);
      ball.setX(goodPlatform.getX() + goodPlatform.getWidth() / 2);
    }
  }

    
    public void displayJumpText() {
    if (displayJumpText) {
        textSize(20);
        fill(255, 0, 0);  // Set text color to red
        text("5 seconds left to jump!", width / 4, height / 2);  // Display text on screen
    }
  }
    
  public boolean canJump() {
    return canJump;
  }
  
  public void resetLives() {
    gameModel.setLives(3); // Assuming initial lives value is 3, adjust accordingly if it's different
  }
}
