const express = require('express');
const search = require('./search');
const app = express.createServer();

// ejs 配置
app.set('view engine', 'ejs');
app.set('views', `${__dirname}/views`);
app.set('view options', {layout: false});

// 错误处理
app.error(function(err, req, res, next) {
    if (err.message === 'Bad Segmen response') {
        res.render('error');
    } else {
        next();
    }
});

// 路由
// 首页
app.get('/', function(req, res) {
    res.render('index');
});
// 搜索结果页
app.get('/search', function(req, res, next) {
    search(req.query.q, function(err, segmen) {
        if (err) {
            return next(err);
        }
        res.render('search', {
            results: segmen,
            search: req.query.q
        });
    });
});

app.listen(7005);
