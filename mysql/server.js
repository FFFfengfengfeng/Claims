const express = require('express')
    , mysql = require('mysql')
    , bodyParser = require('body-parser')
    , config = require('./config.json');

const db = mysql.createConnection(config);

/**
 * create express app
 */
const app = express();

/**
 * use body-parser 
 */
app.use(bodyParser());

/** 
 * app views config
 */
app.set('view engine', 'jade');
app.set('views', `${__dirname}/views`);
app.set('views options', {layout: false});

/**
 * app routes
 */
// index
app.get('/', (req, res, next) => {
    db.query('SELECT * FROM item', (err, results) => {
        if (err) {
            return next(err);
        } else {
            res.render('index', {
                items: results
            });
        }
    });
});
// create goods api
app.post('/create', (req, res, next) => {
    db.query('INSERT INTO item SET title = ?, description = ?', [req.body.title, req.body.description], (err, info) => {
        if (err) {
            return next(err);
        } else {
            console.log(' - item created with id %s', info.insertId);
            res.redirect('/');
        }
    });
});
// goods detail
app.get('/item/:id', (req, res, next) => {
    function getItem(fn) {
        db.query('SELECT * FROM item WHERE id = ? LIMIT 1', 
            [req.params.id], 
            (err, results) => {
                if (err) {
                    return next(err);
                }
                if (!results[0]) {
                    return res.send(404);
                } else {
                    fn(results[0]);
                }
            }
        );
    }
    function getReviews(item_id, fn) {
        db.query('SELECT * FROM review WHERE item_id = ?', 
            [item_id],
            (err, results) => {
                if (err) {
                    return next(err);
                } else {
                    fn(results);
                }
            }
        );
    }
    getItem((item) => {
        getReviews(item.id, (reviews) => {
            res.render('item', {
                item: item,
                reviews: reviews
            });
        });
    });
});
// goods evaluate api
app.post('/item/:id/review', (req, res, next) => {
    db.query('INSERT INTO review SET item_id = ?, stars = ?, text = ?',
        [req.params.id, req.body.stars, req.body.text],
        (err, info) => {
            if (err) {
                return next(err);
            } else {
                console.log(' - review created with id %s', info.insertId);
                res.redirect('/item/' + req.params.id);
            }
        }
    )
});

app.listen(7005, () => {
    console.log(' - listening on http://*:7005');
});