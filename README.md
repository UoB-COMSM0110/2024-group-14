# 2024-group-14

## Game Video
### Deep Sea Fall

Click on the video above to view our game! 

## Team
### Hao Lu, Jiarong Zhang, Boyang Lin, Tanmay Mishra, Chun Ka Elvis Yung 
![Group-14-Picture](https://github.com/UoB-COMSM0110/2024-group-14/blob/main/report_material/images/group-14.JPG)

## Introduction 
![Rapid-roll-image](https://github.com/UoB-COMSM0110/2024-group-14/blob/main/report_material/images/rapid-roll.jpg)

Our creative inspiration is drawn from a classic Nokia game called "Rapid Roll." On top of preserving its original fun and entertainment, we've added a map inversion feature on the hardest level for the "twist": the player will need to survive by jumping instead of continuing to fall for some time. Throughout the whole game's development process, we've engaged in extensive collaboration to find the most suitable development approach for our team. We ended up choosing Kanban and agile development as our core principles due to their flexibility in developing without clear constraints which helped us iteratively improve our game. Furthermore, this assisted us in constantly reflecting, adjusting and discussing our plans and weekly tasks to better our team's ability to collaborate outside of weekly sessions. 

## Requirements

### Ideation Process
To kick off this unit, we first had an in-person brain-storming session to discuss the kind of games we're interested in and what makes our game idea feasible to create in processing. We generated around 6 well-thought-out game ideas with 3 challenges and a twist associated with each game idea. As a group, we unanimously voted and decided on two games, Flappy Butterfly (a variation of Flappy Bird) and Rapid Roll, a falling platformer game. For both games, we collated requirements such as use case diagrams specifications and user stories to further narrow down our choices. These specifications allowed us to develop basic paper prototypes to demonstrate our game in its simplest form - [Flappy Butterfly](https://www.youtube.com/watch?v=lpQTw_9nIlE) and [Rapid Roll](https://www.youtube.com/shorts/F4jMOeVJRp0). Ultimately, we ended up choosing Rapid Roll as our game as it's complex and challenging enough to develop a suitable twist and keep the players engaged. Moreover, as a team, we were more invested in the potential Rapid Roll has due to its simple nature, allowing us to construct interesting storylines and challenges. 

![Paper-prototype-final-game](https://github.com/UoB-COMSM0110/2024-group-14/blob/main/report_material/images/final-game.gif)

### Early stages design
~Text~

### Technical Requirements
- A home screen where the player can select the difficulty modes, see the controls for the game and read about the lore behind the game.
- Different difficulty levels for players to select: easy, medium and hard.
- Generation of platforms, obstacles (spikes and moving platforms) and coins at random locations on the map. 
- Keeping a record of the high scores of all the players that played the game and their difficulty level. 
- Placing obstacles and coins randomly on platforms according to difficulty level. 
- Adjusting the speed of play according to the level of difficulty level.
- Allowing players to jump due to the inverted direction of the map during  the hardest level. 

### User stories

> "⁠As a player, I want to be able to choose a difficulty level for the game to suit my style of play better"

> "⁠As a player, I want to be able to see a scoreboard and compare myself with my peers"

> "As a player, I want to see my score and lives left on the screen as I play the game"

> "As a player, I want to be warned of the map inversion so that I can prepare myself"

> "⁠⁠As a player, I want to see the rules of the game before playing it, so that I can prepare myself for the challenges ahead"

> "As a player, I want to be able to see the lore/story-line behind the game so that I can immerse myself and be invested in the game"  

### Use-Case Diagram
As a team, we created a use-case diagram to illustrate the functional components of our game to help visualise the required components in our game. During the development phase of our use-case diagram, we held discussions to identify key use cases for our users and how they interact with each component. The player interacts with the game linearly by selecting certain screen pages that display once the game starts, they can then choose specific difficulty modes, allowing the player to challenge themselves once they are familiar with our game. Furthermore, each difficulty mode will have its components that make these modes harder as you progress. With this in mind, we developed the use-case diagram based on these specifications. Likewise, our use-case diagram will serve as a basic implementation of our game, since we decided to adopt an agile development methodology, we will continuously refine our game based on our initial use-case diagram. 
![Use-case-diagram](https://github.com/UoB-COMSM0110/2024-group-14/blob/main/report_material/images/use-case-diagram.png)

### Use-Case Specifications

**Easy mode:**
The platform will only move from the bottom to the top and there are no obstacles.

**Basic flow:**
The user plays the game with less than three lives lost.
1. The system displays the main page, which includes the START, ABOUT HELP, and LEADERBOARD.
2. The user presses START to start playing.
3. The system displays the difficulty level: EASY, MEDIUM, or HARD.
4. The user chooses EASY.
5. The system generates the game interface.
6. The user uses left and right arrow keys to control the crab to move to the next platform and collect coins to increase the number of lives.
7. The user aims to achieve the highest possible score before running out of lives.

**Alternative flow:**

7. If the user hits a spike or falls off, the user loses one life and the system automatically returns the crab to a certain position to continue the game.
8. The users lose all their three lives during the game.
9. The game ends, and a screen pops up asking the player to either play a 'NEW GAME' or return to 'HOME'.

**Medium mode:**
The system adds obstacles and platforms that move left and right to the game interface based on easy mode.

**Basic flow:**
The user plays the game with less than three lives lost.
1. The system displays the main page, which includes the START, ABOUT HELP, and LEADERBOARD.
2. The user presses START to start playing.
3. The system displays the difficulty level: EASY, MEDIUM, or HARD.
4. The user chooses MEDIUM.
5. The system generates the game interface.
6. The user uses left and right arrow keys to control the crab to move to the next platform and collect coins to increase the number of lives.
8. User aims to achieve the highest possible score before running out of lives.

**Alternative flow:**

8. If the user hits a spike or obstacles, or falls off, the user loses one life and the system automatically returns the crab to a certain position to continue the game.
9. The users lose all their three lives during the game.
10. The game ends, and a screen pops up asking the player to either play a 'NEW GAME' or return to 'HOME'.

**Hard mode:**
The system adds an ascending map, map switch timer, and jumping functions based on the medium mode.

**Basic flow:**
The user plays the game with less than three lives lost.
1. The system displays the main page, which includes the START, ABOUT HELP, and LEADERBOARD.
2. The user presses START to start playing.
3. The system displays the difficulty level: EASY, MEDIUM, or HARD.
4. The user chooses HARD.
5. The system generates the game interface.
6. The user uses left and right arrow keys to control the crab to move to the next platform and collect coins to increase the number of lives.
7. When the map switching timer shows 0, the system will automatically change a new map for the user: the platform changes to move from top to bottom.
8. The user controls the left and right keys and space bar to move the crab.
9. User aims to achieve the highest possible score before running out of lives.

**Alternative flow:**

9. If the user hits a spike or obstacles, or falls off, the user loses one life and the system automatically returns the crab to a certain position to continue the game.
10. The users lose all their three lives during the game.
11. The game ends, and a screen pops up asking the player to either play a 'NEW GAME' or return to 'HOME'.

## Design
~Text~

### Class Diagram
~Text~
![class-diagram](https://github.com/UoB-COMSM0110/2024-group-14/blob/develop/report_material/images/class-diagram.png)

### Communication Diagram
~Text~
![communication-diagram](https://github.com/UoB-COMSM0110/2024-group-14/blob/develop/report_material/images/communication-diagram.png)

### Sequence Diagram
~Text~
![sequence-diagram](https://github.com/UoB-COMSM0110/2024-group-14/blob/develop/report_material/images/sequence-diagram.png)

## Implementation
~Text~

