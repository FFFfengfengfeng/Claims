const connect = require('connect');

let server = connect.createServer();

server.use(connect.logger('dev'));

server.use((req, res, next) => {
    res.writeHead(200);
    res.end('Hello World');
});

server.listen(7005);