ArrayList<Platform> platforms;
float ballX, ballY;
float ballSpeedY = 0;
boolean gameOver = false;
int platformInterval = 150; // 控制平台生成的垂直间隔
float gravity = 0.05; // 小球受到的重力加速度调整为0.05
float platformSpeed = -2; // 平台的匀速上升速度
// 增加小球的水平速度变量
float ballSpeedX = 0;
float maxSpeed = 5; // 定义小球的最大速度

void setup() {
  size(600, 800); // 调整画布大小为600x800
  initializeGame(); // 初始化游戏
}

void draw() {
  background(0);
  if (!gameOver) {
    updateBall();
    updatePlatforms();
    checkGameOver();
  } else {
    displayGameOver();
    if (keyPressed && (key == 'r' || key == 'R')) {
      initializeGame(); // 按下'R'键重新开始游戏
    }
  }
}

void initializeGame() {
  ballX = width / 2;
  ballY = 100; // 小球的初始高度
  ballSpeedY = 0;
  platforms = new ArrayList<Platform>();
  // 生成初始平台
  for (int i = 0; i < height; i += platformInterval) {
    platforms.add(new Platform(random(width - 100), height - i - platformInterval));
  }
  gameOver = false;
}

void updateBall() {
  ballSpeedY += gravity; // 应用重力
  ballY += ballSpeedY;
  ballX += ballSpeedX; // 根据水平速度更新小球位置

  // 保持小球在画布内
  ballX = constrain(ballX, 0, width);

  // 绘制小球
  fill(255, 0, 0);
  ellipse(ballX, ballY, 20, 20);

  // 检查与平台的碰撞
  for (Platform p : platforms) {
    if (p.checkCollision(ballX, ballY + 10)) {
      if (p.platColor == color(255, 0, 0)) { // 检查是否为红色平台
        gameOver = true; // 如果是红色平台，则游戏结束
        return;
      }
      ballY = p.y - 10; // 将小球置于平台上方
      ballSpeedY = 0; // 重置小球速度
      break;
    }
  }
}

void keyPressed() {
  if (keyCode == LEFT) {
    ballSpeedX = -maxSpeed; // 向左移动
  } else if (keyCode == RIGHT) {
    ballSpeedX = maxSpeed; // 向右移动
  }
}

void keyReleased() {
  if (keyCode == LEFT || keyCode == RIGHT) {
    ballSpeedX = 0; // 停止水平移动
  }
}

void updatePlatforms() {
  // 移动平台并绘制
  for (int i = platforms.size() - 1; i >= 0; i--) {
    Platform p = platforms.get(i);
    p.y += platformSpeed; // 使平台向上移动
    p.display(); // 绘制平台
  }

  // 检查并添加新平台到底部
  Platform bottomPlatform = platforms.get(platforms.size() - 1);
  if (bottomPlatform.y < height - platformInterval) {
    platforms.add(new Platform(random(width - 100), height)); // 在底部添加新平台
  }

  // 移除超出屏幕顶部的平台
  if (platforms.get(0).y < 0) {
    platforms.remove(0);
  }
}

void checkGameOver() {
  // 允许小球超出屏幕一定距离后再结束游戏，提供一点反应时间
  if (ballY > height + 30|| ballY < 0) { // 小球超出屏幕底部30像素时结束游戏
    gameOver = true;
  }
}

void displayGameOver() {
  textSize(32);
  fill(255);
  text("Game Over", width / 4, height / 2);
  textSize(20);
  text("Press 'R' to Restart", width / 4, height / 2 + 50);
}

// 平台类定义
class Platform {
  float x, y;
  color platColor; // 平台的颜色

  Platform(float tempX, float tempY) {
    x = tempX;
    y = tempY;
    // 以较低的频率生成红色平台
    if (random(1) < 0.1) { // 假设有10%的概率生成红色平台
      platColor = color(255, 0, 0); // 红色
    } else {
      platColor = color(255); // 默认颜色，白色
    }
  }

  void display() {
    fill(platColor);
    rect(x, y, 100, 20);
  }

  boolean checkCollision(float ballX, float ballY) {
    return ballX > x && ballX < x + 100 && ballY > y && ballY < y + 20;
  }
}
