const express = require('express');
const blog    = require('./blog');
const pages   = require('./pages');
const tags    = require('./tags');

// app init
const app = express.createServer();

// blog-routes
app.get('/blog', blog.home);
app.get('/blog/search', blog.search);
app.get('/blog/create', blog.create);

// pages-routes
app.get('/pages', pages.home);
app.get('/pages/list', pages.list);

// tags-routes
app.get('/tags', tags.home);
app.get('/tags/search', tags.search);
