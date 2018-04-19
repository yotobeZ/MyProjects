<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,java.sql.*,java.sql.Connection,jdbc.*,charactor.*,java.sql.*"
import="com.alibaba.fastjson.JSONArray" %>
<%
request.setCharacterEncoding("UTF-8");
Student stu=new Student();
//stu.setId(Integer.parseInt(request.getParameter("id")));
stu.setSname(request.getParameter("xming"));
//stu.setSage(Integer.parseInt(request.getParameter("nling")));

if((request.getParameter("nling"))!=null){
Integer sage=Integer.parseInt((request.getParameter("nling")).trim());
stu.setSage(sage);}
stu.setSsex(request.getParameter("sex"));
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
stu.setShobby(str2);}
if(request.getParameter("xyuan")!=null){
stu.setSschool(request.getParameter("xyuan"));}

if(request.getParameter("zhye")!=null){
stu.setSmajor(request.getParameter("zhye"));}

new stuDAO().add(stu);
out.print(JSONArray.toJSON(stu));
//out.print(stu);
System.out.println("ccc");
%>
