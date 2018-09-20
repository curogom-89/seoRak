<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
		#writerBody {
		  padding: 60px 0;
		  background-color: rgba(178,209,229,0.7);
		  margin: 0 auto;
		  width: 600px;
		}
		.body-text {
		  padding: 0 20px 15px 10px;
		  font-family: "Roboto";
		  font-size: 3em;
		  color: #333;
		  text-align: left;
		  line-height: 1.0em;
		}
		.form-container {
		  flex-direction: column;
		  justify-content: center;
		  align-items: center;
		}
		.card-wrapper {
		  background-color: #6FB7E9;
		  width: 100%;
		  display: flex;
		
		}
		.personal-information {
		  background-color: rgba(178,209,229,0.7);
		  color: #fff;
		  padding: 1px 0;
		}
		
		input {
		  margin: 2px 0;
		  padding-left: 3%;
		  font-size: 14px;
		}
		input[type="text"]{
		  display: block;
		  height: 50px;
		  width: 97%;
		  border: none;
		}
		input[name="content"]{
		  display: block;
		  margin-top : 1px; 
		  height: 300px;
		  width: 97%;
		  border: none;
		}
		input[type="submit"]{
		  display: block;
		  height: 50px;
		  width: 50%;
		  border: none;
		  background-color: #3C8DC5;
		  color: #fff;
		  margin-top: 2px;
		  curson: pointer;
		  font-size: 0.9em;
		  text-transform: uppercase;
		  font-weight: bold;
		  cursor: pointer;
		}
		input[type="submit"]:hover{
		  background-color: #6FB7E9;
		  transition: 0.3s ease;
		}
		#column-left {
		  width: 48.3%;
		  float: left;
		  margin-bottom: 2px;
		  transform : translateX(9px)
		}
		#column-right {
		  width: 48.3%;
		  float: right;
		  transform : translateX(-9px)
		}
		
		@media only screen and (max-width: 480px){
		  #writerBody {
		    width: 100%;
		    margin: 0 auto;
		  }
		  .form-container {
		    margin: 0 2%;
		    
		  }
		  input {
		    font-size: 1em;
		  }
		  #input-button {
		    width: 100%;
		  }
		  #input-field {
		    width: 96.5%;
		  }
		  h1 {
		    font-size: 1.2em;
		  }
		  input {
		    margin: 2px 0;
		  }
		  input[type="submit"]{
		    height: 50px;
		  }
		  #column-left {
		    width: 96.5%;
		    display: block;
		    float: none;
		  }
		  #column-right {
		    width: 96.5%;
		    display: block;
		    float: none;
		  }
		}
    </style>
</head>
<body>
<%@include file="topList.jsp" %>
<div id="writerBody">
<div class="body-text">My List</div>
        <hr>
        <form>
          <div class="form-container">
            <div class="personal-information">
              <h1>글쓰기</h1>
            </div> <!-- end of personal-information -->
                <center>
	                <input id="column-left" type="text" name="writer" placeholder="작성자"/>
	                <input id="column-right" type="text" name="book" placeholder="책 이름"/>
	                <input id="input-field" type="text" name="title" placeholder="제목"/>
	                <input id="input-field" type="text" name="content" placeholder="내용"/> 
                </center> 
                <div class="card-wrapper"></div>
            
                <!-- <input id="input-field" type="text" name="streetaddress" required="required" autocomplete="on" maxlength="45" placeholder="Streed Address"/>
                <input id="column-left" type="text" name="city" required="required" autocomplete="on" maxlength="20" placeholder="City"/>
                <input id="column-right" type="text" name="zipcode" required="required" autocomplete="on" pattern="[0-9]*" maxlength="5" placeholder="ZIP code"/>
                <input id="input-field" type="email" name="email" required="required" autocomplete="on" maxlength="40" placeholder="Email"/> -->
                <hr>
                <input id="column-left" type="submit" value="Submit"/>
                <input id="column-right" type="submit" value="Cancle"/>
                <!-- <input id="input-button" type="submit" value="Cancle"/> -->
              
          </form>
        </div>      
        <script>
            /* Card.js plugin by Jesse Pollak. https://github.com/jessepollak/card */
            $('form').card({
                container: '.card-wrapper',
                width: 280,

                formSelectors: {
                    nameInput: 'input[name="first-name"], input[name="last-name"]'
                }
            });
        </script>
</div>
</body>
</html>