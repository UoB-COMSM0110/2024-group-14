class Platform {
  float x, y;
  boolean isObstacle;
  boolean isMoving;
  float speed;
  boolean isHardObstacle;
  GameModel gameModel;
  float platformSpeed;

  Platform(float tempX, float tempY, boolean isObstacle, GameModel gameModel){
   this(tempX, tempY, gameModel);
   this.isObstacle = isObstacle;
  }
  
  public float getPlatformSpeed(){
     return this.platformSpeed; 
  }
  Platform(float tempX, float tempY, boolean isObstacle, GameModel gameModel, boolean isMoving, float speedY) {
    this(tempX, tempY, gameModel);
    this.isMoving = isMoving;
    this.isObstacle = isObstacle;
    this.platformSpeed = speedY;
    this.isHardObstacle = true;
  }

  Platform(float tempX, float tempY, GameModel gameModel) {
    x = tempX;
    y = tempY;
    this.gameModel = gameModel;
    if(gameModel.getLevel().equals("HARD")){
      platformSpeed = -5;
    }
    else{
      platformSpeed = -2;
    }

    if (random(1) < 0.33) { // Red Platform
      isObstacle = true;
    } else {
      isObstacle = false;
    }

    isMoving = random(1) < 0.5;
    if(gameModel.getLevel().equals("HARD")){
      speed = random(-5, 5);
    }
    else{
      speed = random(-2, 2);
    }
    
  }
  
  boolean isObstacle(){
    return this.isObstacle;
  }

  void display() {
    //fill(platColor);
    if(isHardObstacle){
      tickingBomb.resize(100, 20);
      image(tickingBomb, x, y);
    }
    else if(isObstacle){
      spikes.resize(100, 20);
      image(spikes, x, y);
    }
    else{
      platforms.resize(100, 20);
      image(platforms, x, y);
    }
  }

  boolean checkCollision(float ballX, float ballY) {
    return ballX > x && ballX < x + 100 && ballY > y && ballY < y + 20;
  }
  
  void move() {
    this.y += platformSpeed;
    if (isMoving) {
      x += speed;
      if (x < 0 || x > width - 100) {
        speed *= -1;
      }
    }
  }

  float getX() {
    return x;
  }

  float getWidth() {
    return 100;  // Assuming the width of the platform is always 100
  }
}
