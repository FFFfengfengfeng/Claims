var ajax = new XMLHTTPRequest()

ajax.addEventListener('stateChange', () => {
    if (ajax.readyState === 4 && ajax.responseText) {
        console.log(ajax.responseText);
    }
});
ajax.open('GET', '/my-page');
ajax.send(null);