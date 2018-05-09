var fs = require('fs');

// fs.readFile('./my-file.txt', 'utf-8', (err, data) => {
//     console.log(data);
// });

// var stream = fs.createReadStream('./my-file.txt');

// stream.on('data', function(chunk) {
//     console.log(chunk);
// });

// stream.on('end', function(chunk) {
//     console.log(chunk);
// });

var stream = fs.createReadStream('./my-file.txt');

var files = fs.readdirSync(process.cwd());

files.forEach(file => {
    if (/\.txt/.test(file)) {
        fs.watchFile(`${process.cwd()}/${file}`, () => {
            console.log(`---${file}changed`);
        });
    }
});