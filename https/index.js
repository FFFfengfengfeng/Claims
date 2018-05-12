var http = require('http');
var fs   = require('fs');

http.createServer((req, res) => {
    console.log(req.headers);
    res.writeHead('200', {
        'Content-Type': 'image/jpg'
    });
    
    var stream = fs.createReadStream('./26212855.jpg');
    
    stream.on('data', (data) => {
        res.write(data);
    });

    stream.on('end', () => {
        res.end();
    });
}).listen(7005);