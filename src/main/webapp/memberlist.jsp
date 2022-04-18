<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 리스트 보기</title>
</head>
<body>
	<% 
		
		String sql = "SELECT * FROM members"; // members 테이블의 모든 데이터 불러오기.

		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/webdb";
	
		String username = "root";
		String password = "12345";
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null; // Select문이니까 결과를 받을 ResultSet을 만들어야 한다.
	
		try {
			
			Class.forName(driverName);
			conn = DriverManager.getConnection(url, username, password);
			stmt = conn.createStatement();	// sql문 실행해 주는 객체, Statement.		
						
			rs = stmt.executeQuery(sql); // select의 반환 결과물을 ResultSet 클래스 객체로 받음.
			// 반환 결과물이 있는 select문이니까 executeUpdate 아니고 executeQuery로 sql문 실행해야 한다.
		
			while(rs.next()) { // next() 다음 내용이 있으면 참. 없으면 거짓.
				String p_id = rs.getString("id");
				String p_pw = rs.getString("passwd");
				String p_name = rs.getString("name");
				String p_email = rs.getString("email");
				String p_jointime = rs.getString("signuptime");
				
				// 왜 교수님처럼 예쁘게 줄바꿈이 안 되는가? 두통 복통이 너무 심해서 나중에 알아보도록 하자...
				out.print(p_id + " / ");
				out.print(p_pw + " / ");
				out.print(p_name + " / ");
				out.print(p_email + " / ");
				out.print(p_jointime + " / ");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try{
				
				if (rs != null) {			
					rs.close(); // ResultSet - Statement - Connection 순서대로 닫아야 한다.
				}	
				
				
				if (stmt != null) {
					stmt.close();
				}
				
				if (conn != null) {			
					conn.close(); 
				}	
			} catch (Exception e) {
				e.printStackTrace();
			}		
		}
	
	%>



</body>
</html>