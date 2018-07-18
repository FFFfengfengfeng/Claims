const request = require('superagent');

request.post('http://127.0.0.1:7001/article/list')
       .send({
           size: 10,
           page: 1
       })
       .end((err, res) => {
           console.log(res.body);
       })