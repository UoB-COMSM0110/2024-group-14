PImage backgroundImage;
int buttonWidth = 200;
int buttonHeight = 50;
color buttonColor;
color textColor;

void setup() {
  size(600, 700);
  buttonColor = color(150, 150, 255);
  textColor = color(255);
  
  // Load the background image
  backgroundImage = loadImage("../assets/deep-sea2.jpg");
  backgroundImage.resize(width, height);
}

void draw() {
  // Display the background image
  image(backgroundImage, 0, 0);
  
  // Display the menu on top of the background
  displayMenu();
}

void displayMenu() {
  textAlign(CENTER, CENTER);
  textSize(24);
  
  // Start Button
  fill(buttonColor);
  rect(width/2 - buttonWidth/2, height/2 - buttonHeight, buttonWidth, buttonHeight);
  fill(textColor);
  text("Start", width/2, height/2 - buttonHeight/2);
  
  // Quit Button
  fill(buttonColor);
  rect(width/2 - buttonWidth/2, height/2, buttonWidth, buttonHeight);
  fill(textColor);
  text("Quit", width/2, height/2 + buttonHeight/2);
}

void mousePressed() {
  // Check if the mouse is inside the Start button
  if (mouseX > width/2 - buttonWidth/2 && mouseX < width/2 + buttonWidth/2 &&
      mouseY > height/2 - buttonHeight && mouseY < height/2) {
    // Start button clicked, you can add your code here to start the game
    println("Start button clicked");
  }
  
  // Check if the mouse is inside the Quit button
  if (mouseX > width/2 - buttonWidth/2 && mouseX < width/2 + buttonWidth/2 &&
      mouseY > height/2 && mouseY < height/2 + buttonHeight) {
    // Quit button clicked, you can add your code here to exit the application
    println("Quit button clicked");
    exit();
  }
}
