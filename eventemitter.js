const EventEmitter = require('events').EventEmitter;

let a = new EventEmitter();

a.on('event', () => {
    console.log('event called');
});
a.emit('event');