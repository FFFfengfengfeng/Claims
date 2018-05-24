const express = require('express')
    , mongodb = require('mongodb')
    , bodyParser = require('body-parser')
    , cookieParser = require('cookie-parser')
    , session = require('express-session');

/** 
 * connect the mongodb
 */
const server = mongodb.Server('127.0.0.1', 27017);

new mongodb.Db('my-website', server).open((err, client) => {
    if (err) {
        throw err;
    } else {
        console.log('\033[96m + \033[39m connected to mongodb');
        app.users = new mongodb.Collection(client, 'users');
        /** 
         * app listen 7005
         */
        app.listen(7005);
    }
});

/**
 * create express app
 */
const app = express();

/** 
 * Middleware 
 */
app.use(bodyParser());
app.use(cookieParser());
app.use(session({ secret: 'my secret' }));

/** 
 * set express view engine 
 */
app.set('view engine', 'jade');

/** 
 * set express view dictory
 */
app.set('views', `${__dirname}/views`);

/** 
 * express routes
 */
// default
app.get('/', (req, res) => {
    res.render('index', {
        a: false
    })
});
// login
app.get('/login', (req, res) => {
    res.render('login');
});
// sign
app.get('/sign', (req, res) => {
    res.render('sign');
});

