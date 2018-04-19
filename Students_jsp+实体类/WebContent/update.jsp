<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,java.sql.*,java.sql.Connection,charactor.*,java.sql.*"%>
<%
request.setCharacterEncoding("UTF-8");
Student stu=new Student();

stu.setId(Integer.parseInt(request.getParameter("id")));
stu.setSname(request.getParameter("xming"));
stu.setSage(Integer.parseInt(request.getParameter("nling")));
stu.setSsex(request.getParameter("sex"));
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
stu.setSmajor(request.getParameter("zhye"));

	Class.forName("com.mysql.jdbc.Driver");
	Connection c= DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/school?characterEncoding=UTF-8", "root",	"admin");
	String sql = "update student1 set sname= ?, sage = ? , ssex = ? ,shobby=?, sschool=?,smajor=? where id = ?";
	PreparedStatement ps = c.prepareStatement(sql);

		ps.setString(1, stu.sname);
		ps.setInt(2, stu.sage);
		ps.setString(3, stu.ssex);
		ps.setString(4, stu.shobby);
		ps.setString(5, stu.sschool);
		ps.setString(6, stu.smajor);
		ps.setInt(7, stu.id);


		ps.execute();


response.sendRedirect("student_allroot.jsp");
%>