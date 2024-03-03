public class GameService {
  private GameModel gameModel;
  private Ball ball;
  Player player;
  ArrayList<Platform> platforms;
  ArrayList<Coin> coins;
  final int platformInterval = 150;

  public GameService(GameModel gameModel, Ball ball, Player player) {
    this.gameModel = gameModel;
    this.ball = ball;
    this.player = player;
    platforms = new ArrayList<>();
    coins = new ArrayList<>();
    initializeGame();
  }

  public void initializeGame() {
    for (int i = 0; i < height; i += platformInterval) {
      Platform platform = new Platform(random(width - 100), height - i - platformInterval);
      platforms.add(platform);

      if (random(1) < 0.2) {
        Coin coin = new Coin(platform.x + random(20, 80), platform.y - 20);
        coins.add(coin);
      }
    }
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
    // TODO to be completed
    if (ball.y > height + 30 || ball.y < 0) {
      if (!gameModel.getIsGameOver()) {
        gameService.loseLife();
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
          gameService.loseLife();
          if (!gameService.isGameOver()) {
            gameService.respawn();
          } else {
            gameService.gameOver();
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

    //float depth = height - y;
    //score += (int) (depth / 100);
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
    textSize(20);
    fill(255);
    text("Coins: " + player.getCoinsCollected(), 20, 30);
  }
  
  public void updateBall(){
    ball.update(gameModel.getGravity());
  }

  public void respawn() {
    if (!gameService.isGameOver()) {
      ball.setSpeedY(0);
      ball.setSpeedX(0);

      // Filter out red platforms
      ArrayList<Platform> nonRedPlatforms = new ArrayList<Platform>();
      for (Platform platform : platforms) {
        if (!platform.isObstacle()) {
          nonRedPlatforms.add(platform);
        }
      }

      // Choose a random platform from non-red platforms
      if (nonRedPlatforms.size() > 0) {
        int randomIndex = (int) random(nonRedPlatforms.size());
        Platform randomPlatform = nonRedPlatforms.get(randomIndex);

        // Set ball position above the chosen platform
        ball.setY(randomPlatform.y - 10);
        ball.setX(randomPlatform.getX() + randomPlatform.getWidth() / 2);
      }
    }
  }
}
