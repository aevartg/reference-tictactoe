# Test examples

## Create game command
1.Should emit game created event
~~~~
Given []  
When [CreateGame("TheGuy")]  
Then [GameCreated("TheGuy")]
~~~~
## Join game command
1.Should emit game joined event...
~~~~
Given [GameCreated("TheGuy")]
when [JoinGame("Gummi")]
then [GameJoined("Gummi")]
~~~~
2.Should emit FullGameJoinAttempted event when game full
~~~~
Given [GameCreated("TheGuy"), GameJoined("Gummi")]
when [JoinGame("Jens")]
then [FullGameJoinAttempted]
~~~~
## Place move command
1.Should emit MovePlaced on first game moved event
~~~~
Given [GameCreated("TheGuy"), GameJoined("TheGuy")]
when [PlaceMove("TheGuy")(0, 2, X)]
then [MovePlaced("TheGuy")(0, 2, X)]
~~~~
2.Should emit IllegalMove when square is already occupied
~~~~
Given [GameCreated("TheGuy"), GameJoined("Gummi"), MovePlaced("TheGuy")(0, 2, X)]
when [PlaceMove("Gummi")(0, 2, O)]
then [IllegalMove]
~~~~
3.Should emit NotYourMove if attempting to make move out of turn
~~~~
Given [GameCreated("TheGuy"), GameJoined("Gummi"), MovePlaced("TheGuy")(0, 2, X)]
when [PlaceMove("TheGuy")(0, 1, X)]
then [NotYourMove]
~~~~
4.Should emit game won on X accross left to right
~~~~
Given [GameCreated("TheGuy"), GameJoined("Gummi"), 
MovePlaced("TheGuy")(0, 0, X), MovePlaced("Gummi")(1, 0, O), 
MovePlaced("TheGuy")(1, 1, X), MovePlaced("Gummi")(1, 2, O)]
when [PlaceMove("TheGuy")(2, 2, X)]
then [GameWon "TheGuy"]
~~~~
5.Should emit game won on X accross right to left
~~~~
Given [GameCreated("TheGuy"), GameJoined("Gummi"), 
MovePlaced("TheGuy")(0, 2, X), MovePlaced("Gummi")(0, 0, O), 
MovePlaced("TheGuy")(1, 1, X), MovePlaced("Gummi")(2, 2, O)]
when [PlaceMove("TheGuy")(2, 0, X)]
then [GameWon "TheGuy"]
~~~~
6.Should emit game won on X Horizontally
~~~~
Given [GameCreated("TheGuy"), GameJoined("Gummi"), 
MovePlaced("TheGuy")(0, 0, X), MovePlaced("Gummi")(1, 1, O), 
MovePlaced("TheGuy")(0, 1, X), MovePlaced("Gummi")(1, 2, O)]
when [PlaceMove("TheGuy")(0, 2, X)]
then [GameWon "TheGuy"]
~~~~
7.Should emit game won on X vertically
~~~~
Given [GameCreated("TheGuy"), GameJoined("Gummi"), 
MovePlaced("TheGuy")(0, 1, X), MovePlaced("Gummi")(1, 1, O), 
MovePlaced("TheGuy")(0, 2, X), MovePlaced("Gummi")(2, 1, O)]
when [PlaceMove("TheGuy")(0, 0, X)]
then [GameWon "TheGuy"]
~~~~
8.Should emit GameWon when there is a winner and board is full
~~~~
Given [GameCreated("TheGuy"), GameJoined("Gummi"), 
MovePlaced("TheGuy")(0, 0, X), MovePlaced("Gummi")(0, 1, O), 
MovePlaced("TheGuy")(1, 1, X), MovePlaced("Gummi")(2, 1, O),
MovePlaced("TheGuy")(0, 2, X), MovePlaced("Gummi")(2, 0, O),
MovePlaced("TheGuy")(1, 0, X), MovePlaced("Gummi")(1, 2, O)]
when [PlaceMove("TheGuy")(2, 2, X)]
then [MovePlaced("TheGuy")(2, 2, X), GameWon "TheGuy"]
~~~~
9.Should emit game draw when neither wins
~~~~
Given [GameCreated("TheGuy"), GameJoined("Gummi"), 
MovePlaced("TheGuy")(0, 0, X), MovePlaced("Gummi")(0, 1, O), 
MovePlaced("TheGuy")(0, 2, X), MovePlaced("Gummi")(1, 0, O),
MovePlaced("TheGuy")(1, 2, X), MovePlaced("Gummi")(1, 1, O),
MovePlaced("TheGuy")(2, 1, X), MovePlaced("Gummi")(2, 2, O)]
when [PlaceMove("TheGuy")(2, 0, X)]
then [MovePlaced("TheGuy")(2, 2, X), GameDraw]
~~~~