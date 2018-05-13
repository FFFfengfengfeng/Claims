const http = require('http');

let server = http.createServer((req, res) => {
    res.writeHead(200, {
       'Content-Type': 'text/html' 
    });
    res.end(`<form method="POST" action="url">
                <h1>My form</h1>
                <fieldset>  
    `)
});