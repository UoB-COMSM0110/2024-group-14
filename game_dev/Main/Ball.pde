class Ball {
  float x, y;
  float speedY = 0;
  float speedX = 0;
  float maxSpeed = 5;

  Ball(float initialX, float initialY) {
    x = initialX;
    y = initialY;
  }

  public void setSpeedX(int speedX) {
    this.speedX = speedX;
  }

  public float getSpeedX() {
    return this.speedX;
  }

  public float getSpeedY() {
    return this.speedY;
  }

  public void setSpeedY(int speedY) {
    this.speedY = speedY;
  }

  public float getX() {
    return this.x;
  }

  public float getY() {
    return this.y;
  }

  public void setX(float x) {
    this.x = x;
  }

  public void setY(float y) {
    this.y = y;
  }

  void update(float gravity) {
    speedY += gravity;
    y += speedY;
    x += speedX;

    x = constrain(x, 0, width);

    fill(255, 0, 0);
    ellipse(x, y, 20, 20);
    //crabPlayer.resize(40, 40);
    //image(crabPlayer, x, y);
  }
}
