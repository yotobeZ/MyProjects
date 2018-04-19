<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         import="java.util.*,java.sql.*,java.sql.Connection,jdbc.*,charactor.*,java.sql.*"
         import="com.alibaba.fastjson.JSONArray" %>
<%

    request.setCharacterEncoding("UTF-8");
    Majornum manum=new Majornum();
   String xuey = URLDecoder.decode(request.getParameter("xuey"),"UTF-8");

  //String xuey=request.getParameter("xuey");
    System.out.println(xuey+"[[[[[[[");
    List<Smajor> changemajors = new schDAO().getMajor(xuey);
    manum.majors=changemajors;
   if(changemajors!=null){
   manum.num=changemajors.size();}
 //   String[] mamjors = new String[changemajors.size()];
 //  changemajors.toArray(mamjors);
  //  manum.majors=mamjors;
 //   String str = "";
 //   for (String string : mamjors) {
//        str+=string;
//    }
//    System.out.println(str+"////////////////");
    //String s3 = StringUtils.join(mamjors,",")
  //  System.out.println(mamjors+"majors");
 //  request.setAttribute("mymajors", mamjors);
    //System.out.println(mamjors);
    out.print(JSONArray.toJSON(manum));
%>