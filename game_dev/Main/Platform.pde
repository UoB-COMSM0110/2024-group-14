class Platform {
  float x, y;
  boolean isObstacle;
  boolean isMoving;
  float speed;
  static final float platformSpeed = -2;

  Platform(float tempX, float tempY) {
    x = tempX;
    y = tempY;

    if (random(1) < 0.33) { // Red Platform
      isObstacle = true;
    } else {
      isObstacle = false;
    }

    isMoving = random(1) < 0.5;
    speed = random(-2, 2);
  }
  
  boolean isObstacle(){
    return this.isObstacle;
  }

  void display() {
    //fill(platColor);
    if(isObstacle){
      spikes.resize(100, 20);
      image(spikes, x, y);
    }
    else{
      platforms.resize(100, 20);
      image(platforms, x, y);
      //fill(255, 255, 255);
      //rect(x, y, 100, 20);
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
