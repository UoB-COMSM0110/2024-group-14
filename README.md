# 2024-group-14

## Game Video
### Deep Sea Fall

Click on the video above to view our game! 

## Team
### Hao Lu, Jiarong Zhang, Boyang Lin, Tanmay Mishra, Elvis Yung 
![Group-14-Picture](https://github.com/UoB-COMSM0110/2024-group-14/blob/main/report_material/images/group-14.JPG)

## Introduction 
![Rapid-roll-image](https://github.com/UoB-COMSM0110/2024-group-14/blob/main/report_material/images/rapid-roll.jpg)

Our creative inspiration is drawn from a classic Nokia game called "Rapid Roll." On top of preserving its original fun and entertainment, we've added a map inversion feature on the hardest level for the "twist": the player will need to survive by jumping instead of continuing to fall for some time. Throughout the whole game's development process, we've engaged in extensive collaboration to find the most suitable development approach for our team. We ended up choosing Kanban and agile development as our core principles due to their flexibility in developing without clear constraints which helped us iteratively improve our game. Furthermore, this assisted us in constantly reflecting, adjusting and discussing our plans and weekly tasks to better our team's ability to collaborate outside of weekly sessions. 

## Requirements

### Ideation Process
To kick off this unit, we first had an in-person brain-storming session to discuss the kind of games we're interested in and what makes our game idea feasible to create in processing. We generated around 6 well-thought-out game ideas with 3 challenges and a twist associated with each game idea. As a group, we unanimously voted and decided on two games, Flappy Butterfly (a variation of Flappy Bird) and Rapid Roll, a falling platformer game. For both games, we collated requirements such as use case diagrams specifications and user stories to further narrow down our choices. These specifications allowed us to develop basic paper prototypes to demonstrate our game in its simplest form - [Flappy Butterfly](https://www.youtube.com/watch?v=lpQTw_9nIlE) and [Rapid Roll](https://www.youtube.com/shorts/F4jMOeVJRp0). Ultimately, we ended up choosing Rapid Roll as our game as it's complex and challenging enough to develop a suitable twist and keep the players engaged. Moreover, as a team, we were more invested in the potential Rapid Roll has due to its simple nature, allowing us to construct interesting storylines and challenges. 

![Paper-prototype-final-game](https://github.com/UoB-COMSM0110/2024-group-14/blob/main/report_material/images/final-game.gif)

### Early stages design
During the early stages of the design process, we began to iterate on the game that was chosen as our template - Rapid Roll. We wanted to incorporate elements of pixel art and retro-like aspects in our game since all of us shared fond memories of playing these games in our childhood. Because of this, Rapid Roll was the perfect game for us to develop interesting challenges and captivating lore behind our game. We believe that creating a simple, but challenging and impressionable, game would captivate the players and have them coming back for more. 

During our discussions, we identified what game mechanics and graphics we would like to be incorporated in our game and drew mock-ups of what it would look like on an iPad. This allowed us to visualise the final game which motivated all of us to be invested in the development process. These images represent an early rough draft of our game with different levels incorporated and what the main game page would look like. As a team, we also wanted to immerse the player in a lore-like environment by designing our graphics based on a deep sea theme (spikes, crabs and shark teeth). Furthermore, as we continued to refine our ideas, different iterations of mock-ups were drew up to represent the ideas of the team. 

Overall, the early stage design process consisted of discussions around appropriate themes, game mechanics, challenges and difficulty levels. We wanted these elements to be represented throughout our game and we believe that creating mock-ups early on helped us envision the final product. Because of this, we have a clear vision of what the game would look like and are confident that it will bring different elements of enjoyment to players.

![early-stage01](https://github.com/UoB-COMSM0110/2024-group-14/blob/develop/report_material/images/early-stage01.png)
![early-stage02](https://github.com/UoB-COMSM0110/2024-group-14/blob/develop/report_material/images/early-stage02.png)

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
7. When the map switching timer shows 0, the system will automatically change a new map for the user: the platform changes to move from bottom to top. 
8. The user controls the left and right keys and space bar to move the crab.
9. When the timer reverts, the map will change again for the user: the platform will revert to moving from top to bottom. 
10. User aims to achieve the highest possible score before running out of lives.

**Alternative flow:**

9. If the user hits a spike or obstacles, or falls off, the user loses one life and the system automatically returns the crab to a certain position to continue the game.
10. The users lose all their three lives during the game.
11. The game ends, and a screen pops up asking the player to either play a 'NEW GAME' or return to 'HOME'.

## Design
This section is where we applied the knowledge we gained from workshops and lectures and applied it to our game. This section illustrates an overview of the system architecture of our game, in addition to the Unified Modelling Language (UML) diagrams that we created to help us and others visualise the workflow of our game. These designs heavily influenced the implementation of our game as they provided comprehensive design elements that would serve as a good starting point. Moreover, these tools and techniques solidified our understanding of the trade-offs and benefits of certain diagrams, helping us further understand and appreciate the taught material. Finally, since we chose an agile/iterative approach to our game development, these diagrams served as rough guides to help us envision and keep us on track for the final product. We found that this approach allowed for the most flexibility in terms of planning and improvements, due to the ever-changing nature of game development. 

### Class Diagram
During the design process of our game, we first decided to create a class diagram before creating other diagrams as this will serve as the main guide for our implementation. The class diagram helped us represent the game's architecture design, as well as the functionality of the game mechanics. Moreover, the class diagram provides a comprehensive overview of the relationships between specific classes, depicting association and inheritance - further illustrating the usage of Object-oriented design. Likewise, the class diagram is composed of multiple classes that have attributes and methods that describe their utility in the game, helping us create the game and focus on different classes based on priority. 

![class-diagram](https://github.com/UoB-COMSM0110/2024-group-14/blob/develop/report_material/images/class-diagram.png)

The class diagram also illustrates the functional components of our game, allowing others to visualise the workflow. The class diagram shows that once you enter into the main page, you can select different pages that would then load up the gameModel and Player class to start the game. With this, different methods and attributes are then associated with these classes. As the player continues into the game, classes such as Platform, Coin and Move will be used depending on the difficulty the player selected. Separating the core elements of our game into individual classes ensures the implementation of our game to be modular and maintainable. Likewise, it allows each member of the team to develop an aspect of the game in parallel without encountering merge conflicts. Furthermore, we decided to design our game based on the behavioural design pattern: Observer. Since our game has multiple classes/objects interacting with each other, we thought the observer pattern was ideal since the core principles align with our game - objects reacting to changes in another object's state. Again, this promotes a decoupled and modular architecture, further enhancing maintainability and flexibility as we develop our game.  

### Sequence Diagram
With the class diagram created, we thought the next best step was to slowly implement the classes displayed in our class diagram and create a sequence diagram to further illustrate the design pattern we chose. As described above, the observer pattern perfectly encapsulates our game as we have multiple components reacting to the change in another object's state - whether that be checking collisions or updating lives and scores. That means a sequence diagram was perfect for our use case. With this, we wanted our sequence diagram to show how the player's gameplay flows as the game progresses. We showed how the player interacted with platforms, spikes, coins, lives and the score. Furthermore, we included additional information on how our game checks for collisions and relays that message back to the player the methods of certain classes and their association with the player. Overall, the sequence diagram provides a clear depiction of how the player interacts with the classes/components in the game and what the appropriate response would look like - helping us develop our game as a rough blueprint. 

![sequence-diagram](https://github.com/UoB-COMSM0110/2024-group-14/blob/develop/report_material/images/sequence-diagram.png)

### Communication Diagram
Lastly, we decided to create a communication diagram to help us visualise the interactions between classes in our game. Moreover, in the early stages of our planning, we realised that a difficult mechanic in our game would be detecting collisions of platforms and coins and updating the game state based on this information. Therefore, we decided to create a communication diagram to help us illustrate how the player handles input and interactions it has with other objects in our game. The communication diagram provided us with a rough guideline to develop collision detection and the game state based on the player's input. This was extremely helpful in the early stages of game development as once we understood how to handle collisions and updating the game state, we were able to slowly implement the rest of our game based on our sequence and class diagrams. 

![communication-diagram](https://github.com/UoB-COMSM0110/2024-group-14/blob/develop/report_material/images/communication-diagram.png)

## Implementation
~Text~

## Evaluation
~Text~

## Process
~Text~

## Conclusion
~Text~


