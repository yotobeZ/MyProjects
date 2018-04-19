<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,jdbc.*,charactor.*,java.sql.*"%>
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
	int total = new stuDAO().getTotal();
    List<Student> students = new stuDAO().list(0,total);
    //System.out.println(students);
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