<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

		<% 
		request.setCharacterEncoding("utf-8");
	
		// 삭제시킬 때는 mId 하나 기준으로만 삭제할 데이터 찾으면 되니까.
		String mId = request.getParameter("id");

		//String sql = "DELETE FROM members WHERE id = '"+ mId + "'"; // 그냥 Statement를 쓸 땐 이렇다.
		String sql = "DELETE FROM members WHERE id = ?"; // PreparedStatement를 쓸 땐 이렇다.
		
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/webdb";
	
		String username = "root";
		String password = "12345";
		
		Connection conn = null;
		
		// Prepared Statement를 써 보자.
		PreparedStatement pstmt = null;
	
		try {
			
			Class.forName(driverName);
			conn = DriverManager.getConnection(url, username, password);
			//stmt = conn.createStatement();		
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);
			
			
			//int dbFlag = stmt.executeUpdate(sql);
			int dbFlag = pstmt.executeUpdate();
			
			
			if (dbFlag == 1) {
				out.println("회원 탈퇴 성공!!!");
			} else {
				out.println("회원 탈퇴 실패!!!");
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

</body>
</html>