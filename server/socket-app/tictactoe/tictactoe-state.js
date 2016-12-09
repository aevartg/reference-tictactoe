var _ = require('lodash');

module.exports = function (injected) {

    return function (history) {

        function processEvent(event) {
            if(event.type==="GameJoined"){
                gamefull = true;
            }
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
