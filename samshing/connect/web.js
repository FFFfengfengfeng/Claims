var http = require('http'),
    fs   = require('fs');

var server = http.createServer((req, res) => {
    if (req.method === 'GET' && req.url.substr(0, 7) === '/images'
                             && req.url.substr(-4) === '.jpg') {
        fs.stat(__dirname + req.url, (err, stat) => {
            if (err || !stat.isFile()) {
                res.writeHead(404);
                res.end('Not found');
                return;
            } else {
                serve(__dirname + req.url, 'application/jpg');
            }
        });
    } else if (req.method === 'GET' && req.url === '/') {
        serve(__dirname + '/index.html', 'text/html');
    } else {
        res.writeHead(404);
        res.end('Not found');
    }
    function serve(path, type) {
        res.writeHead(200, {
            'Content-Type': type
        });
        fs.createReadStream(path).on('data', (data) => {
           res.write(data); 
        })
        .on('end', () => {
            res.end();
        });
    }
});



server.listen(7005);