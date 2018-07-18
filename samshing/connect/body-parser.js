const connect = require('connect');

let server = connect(
    connect.bodyParser(),
    connect.static('static')
);

server.use((req, res, next) => {
    if (req.method === 'POST') {
        console.log(req.body.file);
    } else {
        next();
    }
});

server.listen(7005);