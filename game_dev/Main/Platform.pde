class Platform {
  float x, y;
  color platColor; 
  boolean isMoving; 
  float speed;

  Platform(float tempX, float tempY) {
    x = tempX;
    y = tempY;

    if (random(1) < 0.1) { 
      platColor = color(255, 0, 0); 
    } else {
      platColor = color(255);
    }
    
    isMoving = random(1) < 0.5; 
    speed = random(-2, 2); 
  }

  void display() {
    fill(platColor);
    rect(x, y, 100, 20);
  }

  boolean checkCollision(float ballX, float ballY) {
    return ballX > x && ballX < x + 100 && ballY > y && ballY < y + 20;
  }

  void move() {
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
