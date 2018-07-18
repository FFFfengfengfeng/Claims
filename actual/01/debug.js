const http = require('http');

function processRequest(req, res) {
    var body = `Thanks for calling!\n`;
    var content = body.length;

    res.writeHead(200, {
        'Content-Length': content,
        'Content-Type': 'text/plain'
    });

    res.end(body);
}

var s = http.createServer(processRequest);

s.listen(3000);