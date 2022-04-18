<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원(회계학원리 아님)가입 폼</title>
</head>
<body>

	<h2>회원 가입 양식. ㅋ</h2>
	<hr>
	
	<form action = "joinOK.jsp" method = "post">
		아이디: <input type = "text" name = "id"> <br><br>
		비밀번호: <input type = "password" name = "pw"> <br><br>
		이름: <input type = "text" name = "name"> <br><br>
		이메일: <input type = "text" name = "email"> <br><br>
	
		<input type= "submit" value = "회원가입">
	</form>

</body>
</html>