# 2024-group-14

## Game Video

Click on the video above to view our game! 

## Team

### Hao Lu, Jiarong Zhang, Boyang Lin, Tanmay Mishra, Chun Ka Elvis Yung 
![Group-14-Picture](https://github.com/UoB-COMSM0110/2024-group-14/blob/main/report_material/images/group-14.JPG)

## Introduction 
![Rapid-roll-image](https://github.com/UoB-COMSM0110/2024-group-14/blob/main/report_material/images/rapid-roll.jpg)

Our creative inspiration is drawn from a classic Nokia game called "Rapid Roll." On top of preserving its original fun and entertainment, we have added a map inversion feature: the ball needs to survive by jumping instead of continuing to fall. Throughout the whole game development process, we have engaged in extensive collaboration to find the most suitable development approach for our team. Kanban and agile development principles are very important methodologies we applied during our development, which assist us in constantly reflecting, adjusting, and discussing our plans and next tasks on a weekly basis.

## Requirements
To kick off this unit, we first had an in-person brain-storming session to discuss the kind of games we're interested in and what makes our game idea feasible to create in processing. We generated around 6 well-thought-out game ideas with 3 challenges and a twist associated with each game idea. As a group, we took a unanimous vote and decided on two games, Flappy Butterfly (a variation of Flappy Bird) and Rapid Roll, a falling platformer game. For both games, we collated requirements such as use case diagrams specifications and user stories to further narrow down our choices. These specifications allowed us to develop basic paper prototypes to demonstrate our game in its simplest form - [Flappy Butterfly](https://www.youtube.com/watch?v=lpQTw_9nIlE) and [Rapid Roll](https://www.youtube.com/shorts/F4jMOeVJRp0). Ultimately, we ended up choosing Rapid Roll as our game as it's complex and challenging enough to develop a suitable twist and keep the players engaged. 

![Paper-prototype-final-game](https://github.com/UoB-COMSM0110/2024-group-14/blob/main/report_material/images/final-game.gif)

## Technical Requirements
- A home screen where the player is able to select the difficulty modes and see the controls for the game.
- Difficulty Levels (mainly easy, medium and hard)
- Generation of platforms at random places in the map
- Keeping record of high scores of all the players
- Placing obstacles and coins randomly on platforms according to difficulty
- Adjusting the speed of play according to the level of difficulty


### User stories

> "⁠As a player, I want to be able to choose a difficulty level for the game to better suit my style of play"

> "⁠As a player, I want to be able to see a scoreboard and compare myself with my peers"

> "As a player, I want to see my score and lives left on the screen as I play the game"

> "As a player, I want to be warned of the map inversion so that I can prepare myself"

> "⁠⁠As a player, I want to see the rules of the game before playing it, so that I can prepare myself for the challenges ahead"

### Use-Case Diagram

![Use-case-diagram](https://github.com/UoB-COMSM0110/2024-group-14/blob/main/report_material/images/use-case-diagram.png)

### Use-Case Specifications

**Easy mode:**
The platform will only move from bottom to top and there are no obstacles.

**Basic flow:**
User plays the game with less than three lives lost.
1. The system displays the main page, including the PLAY GAME, HELP, and SCORE BOARD.
2. User presses START to start playing.
3. System displays the difficulty level: EASY, MEDIUM, or HARD.
4. User chooses EASY.
5. The system generates the game interface.
6. The user uses left and right arrow keys to control the crab to move to the next platform and collect coins to increase the number of lives.
7. User aims to achieve the highest possible score before running out of lives.

**Alternative flow:**

7. If the user hits spike or falls off, user loses one live and the system automatically returns the crab to a certain position to continue the game.
8. The users lose all their three lives during the game.
9. The game ends, and a 'PLAY AGAIN' screen pops up.

**Medium mode:**
The system adds obstacles and platforms that move left and right to the game interface based on easy mode.

**Basic flow:**
User plays the game with less than three lives lost.
1. The system displays the main page, including the START, HELP, ABOUT, and SCORE BOARD.
2. User presses START to start playing.
3. System displays the difficulty level: EASY, MEDIUM, or HARD.
4. User chooses MEDIUM.
5. The system generates the game interface.
6. The user uses left and right arrow keys to control the crab to move to the next platform and collect coins to increase the number of lives.
8. User aims to achieve the highest possible score before running out of lives.

**Alternative flow:**

8. If the user hits spike or obstacles, or falls off, user loses one live and the system automatically returns the crab to a certain position to continue the game.
9. The users lose all their three lives during the game.
10. The game ends, and a 'PLAY AGAIN' screen pops up.

**Hard mode:**
The system adds an ascending map, map switch timer, and jumping functions based on the medium mode.

**Basic flow:**
User plays the game with less than three lives lost.
1. The system displays the main page, including the START, HELP, ABOUT, and SCORE BOARD.
2. User presses START to start playing.
3. System displays the difficulty level: EASY, MEDIUM, or HARD.
4. User chooses HARD.
5. The system generates the game interface.
6. The user uses left and right arrow keys to control the crab to move to the next platform and collect coins to increase the number of lives.
7. When the map switching timer shows 0, the system will automatically change a new map for the user: the platform changes to move from top to bottom.
8. The user controls the left, right, and up arrow keys to move the crab.
9. User aims to achieve the highest possible score before running out of lives.

**Alternative flow:**

9. If the user hits spike or obstacles, or falls off, user loses one live and the system automatically returns the crab to a certain position to continue the game.
10. The users lose all their three lives during the game.
11. The game ends, and a 'PLAY AGAIN' screen pops up.



