const connect = require('connect');
const server = connect.createServer();

// 记录日志
server.use((req, res, next) => {
    console.error('&s &s', req.method, req.url);
});

server.use((req, res, next) => {
    if (req.method === 'GET' && req.url.substr(0, 7) === '/images') {

    } else {
        next();
    }
});

server.use((req, res, next) => {
    res.writeHead(404);
    res.end('Not found');
});
