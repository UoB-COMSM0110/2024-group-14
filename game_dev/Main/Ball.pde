class Ball {
  float x, y;
  float speedY = 0;
  float speedX = 0;
  boolean jumpState;
  float maxSpeed = 5;
  float dampingY = 0.9f; // Damping factor for vertical motion
  float dampingX = 0.8f; // Damping factor for horizontal motion
  boolean canJump = false;  // Flag to check if the ball can jump
  float jumpStrength = -10;  // Strength of the jump

  Ball(float initialX, float initialY, String mode) {
    x = initialX;
    jumpState = false;
    y = initialY;
    if(mode.equals("HARD")) maxSpeed = 8;
    //this.speedY = speedY;
  }
  
  public void setJumpState(boolean jumpState){
     this.jumpState = jumpState;
  }
  
  public boolean getJumpState(){
   return this.jumpState; 
  }

  public void setSpeedX(float speedX) {
    this.speedX = speedX;
  }

  public float getSpeedX() {
    return this.speedX;
  }

  public float getSpeedY() {
    return this.speedY;
  }

  public void setSpeedY(float speedY) {
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

  void jump() {
    if (canJump) {
      speedY = jumpStrength;
      canJump = false;  // Disable jumping until the ball lands
    }
  }

  void update(float gravity) {
    speedY += gravity;
    y += speedY;
    x += speedX;

    // Apply damping to simulate inertia
    speedY *= dampingY;
    speedX *= dampingX;

    x = constrain(x, 0, width);

    // Check if the ball is on the ground
    if (y >= height - 10) { // Assuming the ground is at y = height - 10
      y = height - 10; // Set the ball's position to the ground level
      speedY = 0; // Stop the vertical motion
      canJump = true; // Enable jumping
    }

    fill(255, 100, 0);
    ellipse(x, y, 20, 20);
  }

}
