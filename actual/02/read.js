const fs = require('fs');

let file;

let buf = new Buffer(100000);

fs.open('./info.txt', 'r', (err, handle) => {
    if (err) {
        console.log(err);
        return err;
    }
    file = handle;
    fs.read(file, buf, 0, 100000, null, () => {
        console.log(buf.toString());
        fs.close(file, () => {
    
        });
    });
});
