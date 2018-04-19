<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,java.sql.*,java.sql.Connection,jdbc.*,charactor.*,java.sql.*"%>
<%
request.setCharacterEncoding("UTF-8");
Student stu=new Student();

stu.setId(Integer.parseInt(request.getParameter("id")));
stu.setSname(request.getParameter("xming"));
stu.setSage(Integer.parseInt(request.getParameter("nling")));
stu.setSsex(request.getParameter("sex"));
//爱好

String [] aihao=request.getParameterValues("aih");
String myaihao = null;
String str2 =null;
		for (int i = 0; i < aihao.length; i++) {
			String shuiguoname=aihao[i];
			myaihao = myaihao+"，"+aihao[i];
			System.out.println(shuiguoname);
		}
		if(aihao.length==1){
		str2 = String.format("%s", aihao);}
		if(aihao.length==2){
			str2 = String.format("%s，%s", aihao);}
		if(aihao.length==3){
			str2 = String.format("%s，%s，%s", aihao);}
		if(aihao.length==4){
			str2 = String.format("%s，%s，%s，%s", aihao);}
stu.setShobby(str2);
System.out.println(myaihao);
stu.setSschool(request.getParameter("xyuan"));
//专业
stu.setSmajor(request.getParameter("zhye"));

new stuDAO().update(stu);
response.sendRedirect("student_allroot.jsp");
%>