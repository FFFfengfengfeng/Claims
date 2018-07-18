const http = require('http');
const qs   = require('querystring');

let send = (name) => {
    req = http.request({
        host: 'localhost',
        port: 7006,
        url: '/',
        method: 'POST',
    }, (res) => {
        res.setEncoding('utf8');
        res.on('data', () => {
            console.log('\n request complete!');
            process.stdout.write('\n your name: ');
        });
    }).end(qs.stringify({
        name: name
    }));
}

process.stdout.write('\n your name: ');
process.stdin.resume();
process.stdin.setEncoding('utf-8');
process.stdin.on('data', (name) => {
    send(name.replace('\n', ''));
});