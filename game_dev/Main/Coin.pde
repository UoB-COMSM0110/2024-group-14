class Coin {
  private float x, y;
  static final float coinSpeed = -2;
  Coin(float tempX, float tempY) {
    x = tempX;
    y = tempY;
  }

  public void display() {
    coinModel.resize(22, 22);
    image(coinModel, x, y);
    //fill(255, 255, 0); // Yellow color for coins
    //ellipse(x, y, 20, 20);
  }
  
  public void move(){
    this.y += coinSpeed;
  }

  boolean checkCollision(float ballX, float ballY) {
    float d = dist(ballX, ballY, x, y);
    return d < 30; // Radius of the coin
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
}
