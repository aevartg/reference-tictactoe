var _ = require('lodash');

module.exports = function (injected) {

    return function (history) {

        function processEvent(event) {
<<<<<<< HEAD
            if(event.type==="GameJoined"){
                gamefull = true;
            }
=======
>>>>>>> parent of 3213f86... npm test run beautifully
        }

        function processEvents(history) {
            _.each(history, processEvent);
        }

        processEvents(history);

        return {
            processEvents: processEvents
        }
    };
};
