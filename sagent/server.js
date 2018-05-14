const http = require('http');

const server = http.createServer((req, res) => {
    res.writerHead(200, {
        'Content-Type': 'text/html'
    })
});