class A {
    constructor(name) {
        this.name = name;
    }
    talk() {
        console.log(`我的名字: ${this.name}`);
    }
}
module.exports = A;