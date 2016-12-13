var _ = require('lodash');

module.exports = function (injected) {

    return function (history) {

        var gamefull = false;
        var playingBoard = [['', '', ''],['', '', ''],['', '', '']];
        var turn = '';
        var boardsize = 3;


        function processEvent(event) {
            if(event.type === "GameJoined") {
                gamefull = true;
            }

            if(event.type === "MovePlaced") {
                playingBoard[event.move.x][event.move.y] = event.side;
                turn = event.side;
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

        function getSide(side) {
            return side === turn;
        }


        function winner(side)
        {
            if(playingBoard[0][0] === side && playingBoard[1][1] === side && playingBoard[2][2] === side)
            {
                return true;
            }
            if(playingBoard[0][2] === side && playingBoard[1][1] === side && playingBoard[2][0] === side)
            {
                return true;
            }

            for(var i = 0; i < boardsize; i++)
            {
                    if(playingBoard[i][0] == side && playingBoard[i][1] == side && playingBoard[i][2] == side)
                    {
                        return true;
                    }
                    if(playingBoard[0][i] == side && playingBoard[1][i] == side && playingBoard[2][i] == side)
                    {
                        return true;
                    }
            }
            return false;
        }

        processEvents(history);

        return {
            setBoard: setBoard,
            gameFull: gameFull,
            getSide: getSide,
            winner: winner,
            processEvents: processEvents
        }
    };
};