const express = require('express')
    , Sequelize = require('sequlize');

/**
 * create express app
 */
const app = express();

/**
 * configure for the app
 */
app.set('view engine', 'jade');
app.set('views', `${__dirname}/views`);
app.set('view options', {layout: false});

/**
 * routes
 */
app.get('/', (req, res, next) => {
    // index
    res.render('index');
});
app.post('/projects', (req, res, next) => {
    // create project
});
app.get('/project/:id/tasks', (req, res, next) => {
    // show project task
});
app.post('/project/:id/tasks', (req, res, next) => {
    // create a task for the project

});
app.del('/task/:id', (req, res, next) => {
    // delect the task routes
});

app.listen(7005, () => {
    console.log(' - listening on http://*: 3000');
});