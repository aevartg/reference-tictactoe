var _ = require('lodash');

module.exports = function (injected) {

    return function (history) {

        var gamefull = false;
        var playingBoard = [[-1, -1, -1],[-1, -1, -1],[-1, -1, -1]];

        function processEvent(event) {
            if(event.type === "GameJoined") {
                gamefull = true;
            }

            if(event.type === "MovePlaced") {
                playingBoard[event.move.x][event.move.y] = event.side;

            }

        }

        function processEvents(history) {
            _.each(history, processEvent);
        }

        function gameFull() {
            return gamefull;
        }

        function setBoard(move) {
            return playingBoard[move.x][move.y];
        }

        processEvents(history);

        return {
            setBoard: setBoard,
            gameFull: gameFull,
            processEvents: processEvents
        }
    };
};