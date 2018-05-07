const http = require('http');

http.createServer(() => {
    throw new Error('错误不会被捕获');
}).listen(3000);