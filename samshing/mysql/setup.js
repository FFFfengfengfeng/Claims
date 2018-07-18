const mysql = require('mysql')
    , config = require('./config.json');

/** 
 * init mysql client 
 */
delete config.database;
const db = mysql.createConnection(config);

/** 
 * create database
 */
db.query('CREATE DATABASE IF NOT EXISTS `FFF`');
db.query('USE `FFF`');

/**
 * create table
 * for goods item
 */
db.query('DROP TABLE IF EXISTS item');
db.query('CREATE TABLE item (' +
    'id INT(11) AUTO_INCREMENT,' +
    'title VARCHAR(255),' +
    'description TEXT,' +
    'created DATETIME,' +
    'PRIMARY KEY(id))'
);

/**
 * create table
 * for goods review
 */
db.query('DROP TABLE IF EXISTS review');
db.query('CREATE TABLE review (' +
    'id INT(11) AUTO_INCREMENT,' +
    'item_id INT(11),' +
    'text TEXT,' +
    'stars INT(11),' +
    'created DATETIME,' +
    'PRIMARY KEY(id))'
);

/**
 * close db
 */
db.end(() => {
    process.exit();
});