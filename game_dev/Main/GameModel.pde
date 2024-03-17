public class GameModel {
  private int score;
  private String level;
  private int lives;
  private float gravity;
  boolean isGameOver;
  GameModel() {
    this(0, 3, "EASY");
  }

  GameModel(int score, int lives, String level) {
    this.score = score;
    this.level = level;
    this.lives = lives;
    this.gravity = 0.05;
    this.isGameOver = false;
  }

  public int getLives() {
    return this.lives;
  }

  public int getScore() {
    return this.score;
  }

  public String getLevel() {
    return this.level;
  }

  public boolean getIsGameOver() {
    return this.isGameOver;
  }

  public void setIsGameOver(boolean val) {
    this.isGameOver = val;
  }

  public void setLives(int lives) {
    if (lives >= 0 && lives <= 5) this.lives = lives;
  }

  public void gainLife() {
    setLives(getLives()+1);
  }

  public float getGravity() {
    return this.gravity;
  }

  public void invertGravity() {
    this.gravity = -(this.gravity);
  }


  public void setLevel(String level) {
    if (level.equals("EASY") || level.equals("MEDIUM") || level.equals("HARD")) this.level = level;
  }

  public void setScore(int score) {
    if (score >= 0) this.score = score;
  }
}
