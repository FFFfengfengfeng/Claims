const http = require('http');
const qs   = require('querystring');
const fs   = require('fs');

let search = process.argv.slice(2).join(' ').trim();

if (!search.length) {
    return console.log('\n Usage: node tweets <search term\n>');
} else {
    console.log(`\n searching for: ${search}\n`);
    http.request({
        host: 'www.baidu.com',
        path: `s?ie=utf8&oe=utf8&${qs.stringify({wd: search})}&tn=98010089_dg&ch=1`
    }, (res) => {
        let body = '';
        res.setEncoding('utf8');
        res.on('data', (chunk) => {
            body += chunk;
        });
        res.on('end', () => {
            // let _o = JSON.parse(body);
            fs.writeFile(`${search}.html`, body, (err) => {
                console.log('\n\033[92m 写入成功 \033[90m\n');
            });
        });
    }).end();
}