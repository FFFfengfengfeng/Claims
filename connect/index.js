const connect = require('connect');
const server = connect.createServer();

// 记录日志

server.use(connect.static(__dirname + '/website'));

server.listen(7005);