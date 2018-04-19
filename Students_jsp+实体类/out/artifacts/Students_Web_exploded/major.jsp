<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         import="java.util.*,java.sql.*,java.sql.Connection,charactor.*,java.sql.*"
         import="com.alibaba.fastjson.JSONArray" %>
<%

    request.setCharacterEncoding("UTF-8");
    Majornum manum=new Majornum();
    String xuey = URLDecoder.decode(request.getParameter("xuey"),"UTF-8");
    System.out.println(xuey+"[[[[[[[");

    List<Smajor> smajors = new ArrayList<Smajor>();
    //注意此处使用字符串的格式！需要单引号，双引号同时使用
    Class.forName("com.mysql.jdbc.Driver");
    Connection c5= DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/school?characterEncoding=UTF-8", "root",	"admin");
    String sql5 = "select * from smajor1 where scinfor ='" + xuey + "'";
    PreparedStatement ps5 = c5.prepareStatement(sql5);

    ResultSet rs5 = ps5.executeQuery(sql5);

    while (rs5.next()) {
        Smajor smajor = new Smajor();

        String mname = rs5.getString("mname");

        smajor.mname = mname;


        smajors.add(smajor);

    }

    manum.majors=smajors;
    if(smajors!=null){
       manum.num=smajors.size();}
       //将list转换为数组
       //String[] mamjors = new String[changemajors.size()];
       //changemajors.toArray(mamjors);
       //manum.majors=mamjors;

    out.print(JSONArray.toJSON(manum));
%>