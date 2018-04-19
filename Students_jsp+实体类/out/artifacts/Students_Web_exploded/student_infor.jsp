<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,charactor.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<html>
<head>
<title>学生信息</title>
</head>
<body>
	<div id="llan" align="center">
		<div style="font-size: 24">学生信息浏览</div>
		<table border="1">
			<tr align="center">
				<td style="width: 100">姓名</td>
				<td style="width: 100">年龄</td>
				<td style="width: 100">性别</td>
				<td style="width: 100">爱好</td>
				<td style="width: 100">学院</td>
				<td style="width: 100">专业</td>
			</tr>

<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection c= DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/school?characterEncoding=UTF-8", "root",	"admin");
    Statement s = c.createStatement();

	int total = 0;

	String sql = "select count(*) from student1";

	ResultSet rs = s.executeQuery(sql);
	while (rs.next()) {
	total = rs.getInt(1);
	}
	System.out.println("total:" + total);

	List<Student> students = new ArrayList<Student>();

	String sql1 = "select * from student1 order by id desc limit ?,? ";

    Connection c1= DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/school?characterEncoding=UTF-8", "root",	"admin");
    PreparedStatement ps1 = c1.prepareStatement(sql1);
			ps1.setInt(1, 0);
			ps1.setInt(2, total);

			ResultSet rs1 = ps1.executeQuery();

			while (rs1.next()) {
				Student student = new Student();
				int id = rs1.getInt(1);
				String sname = rs1.getString(2);
				int sage = rs1.getInt(3);
				String ssex = rs1.getString(4);
				String shobby = rs1.getString(5);
				String sschool = rs1.getString(6);
				String smajor = rs1.getString(7);

				student.sname = sname;
	            student.sage = sage;
	            student.ssex = ssex;
	            student.shobby = shobby;
	            student.sschool = sschool;
	            student.smajor = smajor;
	            student.id = id;
	            students.add(student);
	}

    request.setAttribute("students", students);

%>

			<c:forEach items="${students}" var="student" varStatus="status">
				<tr align="center">
					<td style="width: 100"><c:out value="${student.sname}"></c:out></td>
					<td>${student.sage}</td>
					<td>${student.ssex}</td>
					<td>${student.shobby}</td>
					<td>${student.sschool}</td>
					<td>${student.smajor}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>