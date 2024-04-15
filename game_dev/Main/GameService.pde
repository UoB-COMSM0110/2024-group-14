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
  private Timer jumpTimer;
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
      Platform platform = new Platform(random(width - 100), height - i - platformInterval);
      platforms.add(platform);

      if (random(1) < 0.2) {
        Coin coin = new Coin(platform.x + random(20, 80), platform.y - 20);
        coins.add(coin);
      }
    }
    Platform goodPlatform = new Platform(random(width - 100), height/2, false);
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
    if (ball.y > height + 30 || ball.y < 0) {
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
     //float speed = ball.getSpeedY();
     //float gravityAcceleration = 0.75;
     //while (ball.getSpeedY() >1 ) { 
     // ball.setY(ball.getY()-speed);
     // ball.setSpeedY(ball.getSpeedY() * gravityAcceleration);
     //}
     // gravityAcceleration = -1.25;
     // ball.setSpeedY(ball.getSpeedY() * gravityAcceleration);
     // ball.setY(ball.getY()-speed);
      
     // while (ball.getSpeedY() < -1 && ball.getSpeedY() > -10) {
     //   ball.setY(ball.getY()-speed);
     //   speed = speed * gravityAcceleration;
     // }
     // gravityAcceleration = 0.75;
     // ball.setSpeedY(0);
     ball.setJumpState(true);
     ball.update(gameModel.getGravity()*(-25));
     ball.setJumpState(false);
     //delay(1000);
     //ball.update(gameModel.getGravity()*(-1)/25);
  }

  public boolean checkCoinCollision() {
    // TODO to be completed
    return false;
  }

  public void invertGravity() {
    // TODO to be implemented
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
      platforms.add(new Platform(random(width - 100), height));

      // Generate a coin on top of the new platform
      if (random(1) < 0.2) {
        Coin coin = new Coin(bottomPlatform.x + random(20, 80), bottomPlatform.y - 20);
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
    if (ball.speedY > 0) {
      // Increase the score based on the ball's vertical speed or any other criteria
      gameModel.setScore(gameModel.getScore() + (int) ball.speedY);  // Adjust the scoring mechanism as needed
    }
  }

  public void displayCollectedCoins() {
    textSize(25);
    fill(0,0,0);
    text(player.getCoinsCollected(), backButtonX + 395, 30);
  }
  
  public void updateBall() {
        ball.update(gameModel.getGravity());

        // Start the jump timer for HARD level
        if (gameModel.getLevel().equals("HARD") && canJump()) {
            startJumpTimer();
        }

        // Check if the jump time has expired
        if (!canJump() && jumpTimer != null) {
            jumpTimer.cancel();
            jumpTimer.purge();
        }
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

      Platform goodPlatform = new Platform(random(width - 100), height/2, false);
      platforms.add(goodPlatform);
      ball.setY(goodPlatform.y - 10);
      ball.setX(goodPlatform.getX() + goodPlatform.getWidth() / 2);
    }
  }

public void startJumpTimer() {
    if (gameModel.getLevel().equals("HARD")) {
        canJump = true;
        displayJumpText = false;  // Initialize the flag to false

        jumpTimer = new Timer();
        jumpTimer.schedule(new TimerTask() {
            int count = 0;

            @Override
            public void run() {
                if (count == 20) {  // 20 * 1 second = 20 seconds
                    displayJumpText = true;  // Set flag to true to display the jump text
                } else if (count == 25) {  // 25 * 1 second = 25 seconds
                    canJump = false;
                    displayJumpText = false;  // Set flag to false to stop displaying the jump text
                    jumpTimer.cancel();
                    jumpTimer.purge();
                } else if (count == 30) {  // 30 * 1 second = 30 seconds
                    displayJumpText = false;  // Set flag to false to hide the jump text
                }
                count++;
            }
        }, 0, 1000);  // delay 0, repeat every 1 second
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
}
