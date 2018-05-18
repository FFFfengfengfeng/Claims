// 引入依赖
const connect = require('connect'),
      time    = require('./request-time');

// 创建服务器
let server = connect.createServer();

server.use(connect.logger('dev'));

server.use(time({ time: 500 }));

server.use((req, res, next) => {
    if (req.url === '/a') {
        res.writeHead(200);
        res.end('Fast!');
    } else {
        next();
    }
});

server.use((req, res, next) => {
    if (req.url === '/b') {
        setTimeout(() => {
            res.writeHead(200);
            res.end('Slow');
        }, 1000);
    } else {
        next();
    }
});

server.listen(7005);