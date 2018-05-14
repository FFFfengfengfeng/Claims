const http = require('http');
const qs   = require('querystring');

let server = http.createServer((req, res) => {
    if (req.url === '/') {
        res.writeHead(200, {
           'Content-Type': 'text/html' 
        });
        
        res.end(`<form method="POST" action="url">
                    <h1>My form</h1>
                    <fieldset>
                    <label>Personal information</label>
                    <p>What is your name?</p>
                    <input type="text" name="name"/>
                    <p><button>Submit</button></p>
                 </form>  
        `);
    } else if (req.url === '/url' && req.method === 'POST') {
        let body = '';
        req.on('data', (chunk) => {
            body += chunk;
        });
        req.on('end', () => {
            res.writeHead(200, {
                'Content-Type': 'text/html' 
            });
            res.end(`<p>Your name is <i>${qs.parse(body).name}</i></p>`);
        });
    } else {
        res.writeHead(404);
        res.end('Not Found');
    }
});
server.listen(7005);