<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 성공시켜 주는 놈 (+SQL insert into를 써서 DB에 업로드까지 해 주는 놈)</title>
</head>
<body>

	<!-- 계속 졸다가 디버깅하다 보니, 맞았는지 틀렸는지도 모르겠다 이 .jsp 문서가...
	어? 맞았나 보네. 나도 왜 맞았는지 모르겠다... -->


	<% 
		request.setCharacterEncoding("utf-8");
	
		String mId = request.getParameter("id");
		String mPw = request.getParameter("pw");
		String mName = request.getParameter("name");
		String mEmail = request.getParameter("email");
	
		// 이 4줄은 디버깅 잘 되나 보려고 콘솔에 프린트해 주는 놈들이다.. 없어도된디.
		System.out.println(mId);
		System.out.println(mPw);
		System.out.println(mName);
		System.out.println(mEmail);

		
		// 여기다가 sql문 형식을 잘 맞춰서 쓰는 거야. members(필드 이름들)는 별 게 아니고, 아까 우리가 MySQL Workbench에서 만든 테이블이다.
		String sql = "INSERT INTO members(id, passwd, name, email) VALUES ('" + mId + "', '" + mPw + "', '" + mName +"', '" + mEmail +"')";
			

		//이 아래부터는 dbTest.jsp에 썼던 내용 거의 복붙함. 그러나? Connection 상에서 sql 명령을 실행시켜 줄 Statement라는 놈을 만들어 줌.
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/webdb";
	
		String username = "root";
		String password = "12345";
		
		Connection conn = null;
		Statement stmt = null;
	
		try {
			
			Class.forName(driverName);
			conn = DriverManager.getConnection(url, username, password);
			stmt = conn.createStatement();	// sql문 실행해 주는 객체, Statement.		
						
			int dbFlag = stmt.executeUpdate(sql); //sql문 실행 -> 1이 오면 성공, 아니면 실패
		
			if (dbFlag == 1) {
				out.println("회원가입성공.");
			} else {
				out.println("회원가입실패.");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try{
				
				if (stmt != null) {
					stmt.close(); // 꼭 Statement 먼저 닫고 Connection 닫아 줘야 한다. (Statement는 Connection이 있어야 존재할 수 있으니까.)
				}
				
				if (conn != null) {			
					conn.close(); 
				}	
			} catch (Exception e) {
				e.printStackTrace();
			}		
		}
		
		
		
	%>

	<br><br>
	<a href = "memberlist.jsp">회원 리스트 보기</a>



</body>
</html>





