const http = require('http');
const qs   = require('querystring');

const server = http.createServer((req, res) => {
    let body = '';
    req.on('data', (chunk) => {
        body += chunk;
    });
    req.on('end', () => {
        res.writeHead(200);
        res.end('Done');
        console.log(`\n got name: ${qs.parse(body).name}\n`);
    });
});

server.listen(7006);