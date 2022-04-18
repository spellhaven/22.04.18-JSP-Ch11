<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC 연결 테스트</title>
</head>
<body>

	<% 
		// driverName과 url (+ 아까 배웠던 JSTL uri) 같은 것들은 스펠링을 조심하도록 해. ㅋ. 여기 틀리면 찾기도 어려워 ㅋ. 참고로 url 맨 끝은 방금 만든 MySQL 스키마 이름을 써 주면 된다.
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/webdb";
	
		String username = "root";
		String password = "12345";
		
		Connection conn = null; // 이렇게 null로 초기화해야 에러가 안 나서 좋다.
		
		
		try { // 우리가 하도 오타를 많이 내서 try-catch문도 보여 주셨다. 하하.
			
			Class.forName(driverName); // 드라이버 로딩
			conn = DriverManager.getConnection(url, username, password); // DB 연동
		
			out.println(conn);
			
		} catch (Exception e) {
			e.printStackTrace(); // 에러 내용을 콘솔에 출력해 주는 놈.
		} finally {
			
			// finally문 안에서 커넥션 close하는 것도 오타 날 수 있으니, try-catch로 만드는 게 좋다고 한다. (whyrano whyrano...)
			try{
				if (conn != null) {
					conn.close(); // Connection도 Scanner처럼 다 쓰면 닫아 줘야 한다.
								  // Connection을 쓰지도 않았는데 닫으면 이상하니까 if (conn != null)이라고 조건을 쓴 거다.
				}	
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
	%>

</body>
</html>