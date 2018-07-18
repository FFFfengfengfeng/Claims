var net = require('net');

// 追踪连接数
var count = 0;
var users = {};

var server = net.createServer((conn) =>{
    let nickname = null;
    var msg = '';
    conn.write('\n>welcome to \033[92m node-chat! \033[90m' + '\r\n>' + count + ' other people are connected at this time.' + '\r\n>please write your name and press enter:');
    count ++;

    conn.setEncoding('utf8');

    conn.on('data', (data) => {
        
        if (!(data === '\r\n')) {
            msg += data;
        } else {
            if (!nickname) {
                if (users[msg]) {
                    conn.write('nickname is already in user try again: ');
                    msg = '';
                    return;
                } else {
                    nickname = msg;
                    users[nickname] = conn;

                    for (var i in users) {
                        users[i].write('\r\n' + nickname + ' joined the room!\r\n');
                    }
                }
            } else {
                for (var i in users) {
                    if (i != nickname) {
                        users[i].write('\r\n' + nickname + ': ' + msg + '\r\n');
                    }
                }
            }
            msg = '';
        }
    });

    conn.on('close', () => {
        count --;
    });
});

server.listen(7005, () => {
    console.log('\033[90m   server is listen on *: 7005\033[39m');
});