const request = require('superagent');

module.exports = function search(query, fn) {
    request.get(`https://segmentfault.com/search?q=${query}`)
           .end(function(res) {
               if (res.text) {
                return fn(null, res.text);
               }
               fn(new Error('Bad Segmen response'));
           })
}