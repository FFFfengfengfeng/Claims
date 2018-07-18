module.exports = function(opts) {
    // 设置时间阀值
    let time = opts.time || 100;

    return function(req, res, next) {
        let timer = setTimeout(() => {
            console.log('\033[90m%s %s\033[91m is talking too long!\033[39m', req.method, req.url);
        }, time);
        
        // 清除计时器
        let end = res.end;
        res.end = (chunk, encoding) => {
            res.end = end;
            res.end(chunk, encoding);
            clearTimeout(timer);
        }
        next();
    }
}