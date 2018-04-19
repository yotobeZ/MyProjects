<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<%

	int id = Integer.parseInt(request.getParameter("id"));
	Class.forName("com.mysql.jdbc.Driver");
	Connection c= DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/school?characterEncoding=UTF-8", "root",	"admin");
	Statement s = c.createStatement();

	String sql = "delete from student1 where id = " + id;

	s.execute(sql);
	response.sendRedirect("student_allroot.jsp");
%>