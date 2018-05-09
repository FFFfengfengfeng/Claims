const fs = require('fs');

var pic = new Buffer('==iilj2i3hli23h', 'base64');

fs.writeFile('logo.png', pic);