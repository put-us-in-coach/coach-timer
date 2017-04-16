# coach-timer

Coach Timer is an iOS application that helps soccer coaches keep track of their players' game time, and their positions on the field. It was written in Swift 3.1 and uses the core Foundation and UIKit libraries.

This application was built as the mid-term project for [Code 401: Advanced Software Development in iOS](https://www.codefellows.org/courses/code-401/advanced-software-development-in-full-stack-javascript/), April 10-14, 2017.

## How to use this application

There are three primary views in Coach Timer:

1. [Game](#Game)
1. [Team Roster](#Team-Roster)
1. [Player Creation](#Player-Creation)

### Game

[!Game view image](coach-timer/screenshots/gameview.jpeg)

**Timer:**

- Tap the timer once to start or stop the game clock. Timers for the players on the field will also be started or stopped.
- Use a long press on the timer to reset the game clock to zero.

**Field:**

- Tap a player on the field to return them to the bench. The player will be added to the end of the bench, and their individual timer will be stopped.

**Bench:**

1. Tap the roster button to view the full list of players.
1. Tap a player, and then a position on the field to put their individual timer in progress.


### Team Roster

[!Roster view image](coach-timer/screenshots/rosterview.jpeg)

1. Tap the Add (+) button to create a new player.
1. Tap the Game button to return to the game.
1. Use the reordering controls to change the order of players on the bench.


### Player Creation

[!Player view image](coach-timer/screenshots/playerview.jpeg)

On this view you can:

1. Enter a new player's name
1. Assign a photo to the player from the camera or Photo Library
1. Mark one or more preferred positions for the player
1. Add notes for the player 

## Contributors
@regenalgrant  
@Sergtsaeb  
@robert-hatfield  

## Attribution

Several tutorials at the following sites were referenced in building this application:  

- [Ray Wenderlich](https://www.raywenderlich.com/category/swift)  
- [Hacking with Swift](https://www.hackingwithswift.com)  

Circular player images were created based on this [example](http://www.appcoda.com/ios-programming-circular-image-calayer/) at AppCoda. 

Our application icon was resized using [MakeAppIcon](https://makeappicon.com).

Default player image "User" by [Noun Project](https://thenounproject.com).

We'd also like to give special thanks to @cathy810218, one of the TAs for the course.  Her assistance was invaluable in completing this project on time. **Thank you, Cathy!**
