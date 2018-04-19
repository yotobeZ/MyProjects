<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,jdbc.*,charactor.*,java.sql.*"%>



<% 
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("username");
	String password = request.getParameter("password");

	LoginPeople result = null;

	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection c = DriverManager.getConnection(
				"jdbc:mysql://127.0.0.1:3306/school?useUnicode=true&characterEncoding=utf8", "root", "admin");
		String sql = "select * from loginpeople where name = ? and password = ?";
		
		PreparedStatement ps = c.prepareStatement(sql);
		ps.setString(1, name);
		ps.setString(2, password);
		ResultSet rs = ps.executeQuery();
		//System.out.println("连接成功");
		//System.out.println("111");
		if (rs.next()) {
			//int grade=rs.getGrade(3);
			result = new LoginPeople();
			result.setId(rs.getInt(1));
			result.setPassword(password);
			result.setUsername(name);
			result.setPower(rs.getInt("power"));
			if (result.getPower() == 1)
				response.sendRedirect("student_allroot.jsp");
			else
				response.sendRedirect("student_infor.jsp");

		} else {
			response.sendRedirect("fail.html");
		}

		ps.close();
		c.close();
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block     
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block     
		e.printStackTrace();
	}
%>
