const fs = require('fs'),
      stdin = process.stdin,
      stdout = process.stdout;

console.log(process.argv.slice(2));

fs.readdir(process.cwd(), (err, files) => {
    let stats = [];
    console.log('');

    if (!files.length) {
        return console.log('no files to show');
    }

    console.log('select which file or directory you want to see');
    
    file(0);
    function file(i) {
        var filename = files[i];
        fs.stat(`${__dirname}/${filename}`, (err, stat) => {
            stats[i] = stat;

            if (stat.isDirectory()) {
                
                console.log('    ' + i + '    \033[36m' + filename + '/\033[39m');    
            } else {
                console.log('    ' + i + '    \033[90m' + filename + '\033[39m');  
            }
            
            if (++i === files.length) {
                read();
            } else {
                file(i);
            }
        });
    }
    
    function read() {
        stdout.write('    \033[33mEnter your choice: \033[39m');
        stdin.resume();
        stdin.setEncoding('utf-8');
        stdin.on('data', option);
    }
    
    function option(data) {
        let filename = files[parseInt(data)];
        if (!filename) {
            stdout.write('    \033[33mEnter your choice: \033[39m');
        } else {
            if (stats[parseInt(data)].isDirectory()) {
                console.log('\033[90m' + 'this choice is a directory' + '\033[39m');
            } else {
                stdin.pause();
                fs.readFile(`${__dirname}/${filename}`, 'utf-8', (err, data) => {
                    console.log('');
                    console.log('\033[90m' + data.replace(/(.*)/g,  '     $1') + '\033[39m');
                });

            }
        }
    }

});

