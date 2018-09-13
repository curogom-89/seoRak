function nextId() {
    var id = 1
    return function () {return id++}
}

var id1 = nextId()
console.log(id1());
console.log(id1());

var id1 = nextId()
console.log(id1());
console.log(id1());
