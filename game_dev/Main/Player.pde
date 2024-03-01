public class Player {
  private int coinsCollected, maxSpeed, playerXSpeed, playerYSpeed;
  private float xPosition, yPosition;

  public float getxPosition() {
    return xPosition;
  }

  public void setxPosition(float xPosition) {
    this.xPosition = xPosition;
  }

  public float getyPosition() {
    return yPosition;
  }

  public void setyPosition(float yPosition) {
    this.yPosition = yPosition;
  }

  public void increaseCoinsCollected() {
    this.coinsCollected++;
  }

  public int getCoinsCollected() {
    return coinsCollected;
  }

  public void setCoinsCollected(int coinsCollected) {
    this.coinsCollected = coinsCollected;
  }

  public int getMaxSpeed() {
    return maxSpeed;
  }

  public void setMaxSpeed(int maxSpeed) {
    this.maxSpeed = maxSpeed;
  }

  public int getPlayerXSpeed() {
    return playerXSpeed;
  }

  public void setPlayerXSpeed(int playerXSpeed) {
    this.playerXSpeed = playerXSpeed;
  }

  public int getPlayerYSpeed() {
    return playerYSpeed;
  }

  public void setPlayerYSpeed(int playerYSpeed) {
    this.playerYSpeed = playerYSpeed;
  }
}
