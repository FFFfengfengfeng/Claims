const http = require('http'),
      express = require('express'),
      io = require('socket.io');

/**
 * use users to note user info
 * 
 * use total to note how many people
 */
let users = {},
    total = 0;

/**
 * create express app
 */
const app = express();

/**
 * create http server
 */
const server = http.Server(app);

/**
 * listen socket server
 */
const sio = io(server);

/** 
 *  appoint static directory
 */
app.use(express.static('public'));

/** 
 * listen connections
 */
sio.on('connection', (socket) => {
    socket.join('abc');
    socket.emit('message', {id: socket.id});
    socket.on('message', function (data) {
        // let arr = [],
        //     id = data.id,
        //     msg = data.msg;

        // if (users[id]) {
        //     users[id].push(msg);
        // } else {
        //     users[id] = [];
        //     users[id].push(msg);
        // }
        sio.to('abc').emit('message', {id: data.id , msg: data.msg});
    });
});

/** 
 * listen server
 */
server.listen(7005);