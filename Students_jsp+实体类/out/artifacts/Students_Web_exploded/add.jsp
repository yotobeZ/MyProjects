<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,java.sql.*,java.sql.Connection,jdbc.*,charactor.*,java.sql.*"
import="com.alibaba.fastjson.JSONArray" %>
<%
request.setCharacterEncoding("UTF-8");
Student stu=new Student();


	Class.forName("com.mysql.jdbc.Driver");
	Connection c= DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/school?characterEncoding=UTF-8", "root",	"admin");


	String sql = "insert into student1(sname,sage,ssex,shobby,sschool,smajor) values(?,?,?,?,?,?)";
	PreparedStatement ps = c.prepareStatement(sql);

		ps.setString(1, request.getParameter("xming"));
		stu.sname = request.getParameter("xming");
		if((request.getParameter("nling"))!=null){
		Integer sage=Integer.parseInt((request.getParameter("nling")).trim());
			ps.setInt(2, sage);
			stu.sage = sage;}

		ps.setString(3, request.getParameter("sex"));
		stu.ssex = request.getParameter("sex");
	if((request.getParameterValues("aih"))!=null){
		String [] aihao=request.getParameterValues("aih");
		System.out.println("aihao:"+aihao);
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
		ps.setString(4, str2);
	stu.shobby = str2;
	}
	if(request.getParameter("xyuan")!=null){
		ps.setString(5, request.getParameter("xyuan"));
	stu.sschool = request.getParameter("xyuan");
	}
	if(request.getParameter("zhye")!=null){
		ps.setString(6, request.getParameter("zhye"));
	stu.smajor = request.getParameter("zhye");
	}


		ps.execute();

		ResultSet rs = ps.getGeneratedKeys();

		if (rs.next()) {
			int id = rs.getInt(1);
			stu.id = id;

		}

out.print(JSONArray.toJSON(stu));
//out.print(stu);
%>
