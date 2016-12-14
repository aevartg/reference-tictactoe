# Test examples

## Create game command
1. should emit game created event
~~~~
Given []  
When [CreateGame]  
Then [GameCreated]
~~~~
## Join game command
1.should emit game joined event...
~~~~
Given [GameCreated]
when [JoinGame]
then [GameJoined]
~~~~
2.should emit FullGameJoinAttempted event when game full
~~~~
Given [GameCreated, GameJoined]
when [JoinGame]
then [FullGameJoinAttempted]
~~~~