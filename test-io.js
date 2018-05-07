console.log('Hello');

setTimeout(() => {
    console.log('World');
}, 1000);

let start = Date.now();

console.log(start);

setTimeout(() => {
    console.log(Date.now() - start);
    for (let i = 0; i < 1000000000; i ++) {}
}, 1000);

setTimeout(() => {
    console.log(Date.now() - start);
}, 2000);
