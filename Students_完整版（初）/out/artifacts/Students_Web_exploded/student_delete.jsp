<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,jdbc.*,charactor.*,java.sql.*"%>
<%

int id = Integer.parseInt(request.getParameter("id"));
 
new stuDAO().delete(id);

response.sendRedirect("student_allroot.jsp");
%>