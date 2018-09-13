/*
    클로저
    
    - 함수내의 지역변수를 함수 외부에서 사용할 수 있게 하는 기술
    - 생명주기가 종료 된 함수의 변수를 참조하게 함
*/
"use strict"

function outer(val) {
    var msg = "당신의 메세지 : " + val
    return function() {return msg}
}

var fn = outer("hi")
console.log(fn());
