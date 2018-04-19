<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         import="java.util.*,java.sql.*,java.sql.Connection,jdbc.*,charactor.*,java.sql.*"
         import="com.alibaba.fastjson.JSONArray" %>
<%

    request.setCharacterEncoding("UTF-8");
    Majornum manum=new Majornum();
    String xuey = URLDecoder.decode(request.getParameter("xuey"),"UTF-8");
    System.out.println(xuey+"[[[[[[[");
    List<Smajor> changemajors = new schDAO().getMajor(xuey);
    manum.majors=changemajors;
    if(changemajors!=null){
       manum.num=changemajors.size();}
       //将list转换为数组
       //String[] mamjors = new String[changemajors.size()];
       //changemajors.toArray(mamjors);
       //manum.majors=mamjors;

    out.print(JSONArray.toJSON(manum));
%>