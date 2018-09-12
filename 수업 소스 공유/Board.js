"use strict"
var boardList = [
                    {"no": 1, "writer": "hong", "title" : "javascript 연습중"},
                    {"no": 2, "writer": "kang", "title" : "java...... 연습중"}
                ]

var run = true
while(run) {

    console.log("------------------------------------------------")
    console.log("1. 전체 게시물 조회")
    console.log("2. 글 번호 조회")
    console.log("3. 글 등록")
    console.log("4. 글 수정")
    console.log("5. 글 삭제")
    console.log("0. 종료")
    console.log("------------------------------------------------")
    
    var prompt = require('prompt-sync')()
    var menu = prompt('메뉴 중 처리할 항목을 선택하세요 > ')
    
    switch(menu) {
        case "1" :
            console.log("------------------------------------------------")
            console.log("번호","글쓴이","제목")
            console.log("------------------------------------------------")
            for (var board of boardList) {
                console.log(board["no"], board["writer"], board["title"])
            }
            break

        case "2" :
            var view = prompt('조회 할 글 번호를 입력하세요. > ')
            console.log("------------------------------------------------")
            let find = false
            for (var board of boardList) {
                if (board["no"] == view) {
                    find = true
                    console.log("번호 : " + board["no"])
                    console.log("글쓴이 : " + board["writer"])
                    console.log("제목 : " + board["title"])
                    
                }
                
            }
            if(!find) {
                console.log("해당 글이 존재하지 않습니다.")
            }
            console.log("------------------------------------------------")
            break

        case "3" : 
            let title = prompt('제목을 입력하세요. > ')
            let writer = prompt('작성자를 입력하세요. > ')
            let no = boardList.length + 1
            boardList.push({"no": no, "title": title, "writer":writer})
            console.log("게시글 등록이 완료 되었습니다.");
            break
            
        case "4" :
            let update = false
            let updateNo = prompt('수정할 글 번호를 입력하세요. > ')
            let updateTitle = prompt('수정할 글 제목을 입력하세요. > ')
            for (var i = 0; i < boardList.length; i++) {
                if (boardList[i]["no"] == updateNo) {
                    update = true
                    boardList[i]["title"] = updateTitle
                    console.log("게시글이 수정되었습니다.");
                    
                }
            }
            if (update == false) {
                console.log("해당 글이 존재하지 않습니다.");
            }
            break
            
        case "5" :
            let del = false
            let delNo = prompt('삭제할 글 번호를 입력하세요. > ')
            for (var i = 0; i < boardList.length; i++) {
                if(boardList[i]["no"] == delNo) {
                    del = true
                    boardList.splice(i, 1)
                }
            }
            if (del == false) {
                console.log("해당 글이 존재하지 않습니다.");
            }
            break

        case "0" :
            console.log("게시판 프로그램을 종료합니다.");
            run = false
            break
    }

}