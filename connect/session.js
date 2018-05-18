const connect = require('connect'),
      users   = require('./users'),
      redis   = require('connect-redis')(connect);

let server = connect(
    connect.logger('dev'),
    connect.bodyParser(),
    connect.cookieParser(),
    connect.session({
        secret: 'my app secret'
    }),
    (req, res, next) => {
        if (req.url === '/' && req.session.logged_in) {
            res.writeHead(200, {
                'Content-Type': 'text/html'
            });
            res.end(`'Welcome back, <b>${req.session.name}</b><a href="/logout">Logout</a>`);
        } else {
            next();
        }
    },
    (req, res, next) => {
        if (req.method === 'GET' && req.url === '/') {
            res.writeHead(200, {
                'Content-Type': 'text/html'
            });
            res.end(`<form action="/login" method="POST">
                        <fieldset>
                            <legend>Please log in</legend>
                            <p>User: <input type="text" name="user"/></p>
                            <p>Password: <input type="password" name="password"/></p>
                            <button>Submit</button>
                        </fieldset>
                     </form>`);
        } else {
            next();
        }
    },
    (req, res, next) => {
        if (req.url === '/login' && req.method === 'POST') {
            res.writeHead(200);
            if (!users[req.body.user] || req.body.password !== users[req.body.user].password) {
                res.end('Bad username/password');
            } else {
                req.session.logged_in = true;
                req.session.name = users[req.body.user].name;
                res.end('Authenticated!');
            }
        } else {
            next();
        }
    },
    (req, res, next) => {
        if (req.url === '/logout') {
            req.session.logged_in = false;
            res.writeHead(200);
            res.end('Logged out!');
        } else {
            next();
        }
    }
)

server.listen(7005);