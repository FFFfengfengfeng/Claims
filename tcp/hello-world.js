const http = require('http');

var server = http.createServer((req, res) => {
    res.writeHead(200, {
        'Content-Type': 'text/html'
    });
    res.end('<p>hello world</p>');
});

server.listen(7005);