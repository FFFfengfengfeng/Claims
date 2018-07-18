const http = require('http');

http.createServer((req, res) => {
    res.writeHead(200);
    res.write('Hello World');
}).listen(7005);