<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="javax.sql.*" %>
<%@page import="javax.naming.*" %>
<%@page import="java.sql.*" %>
 
<%
 request.setCharacterEncoding("UTF-8");
 String id = (String)session.getAttribute("id");
 String password = request.getParameter("password");
 String name = request.getParameter("name");
 int age = Integer.parseInt(request.getParameter("age"));
 String gender = request.getParameter("gender");
 String email = request.getParameter("email");
 
 Connection conn=null; //DB연결
 PreparedStatement pstmt=null; //SQL문
 ResultSet re = null; //해제
 
 try{
    Context init = new InitialContext();
    DataSource ds =(DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
    conn=ds.getConnection();
    
    pstmt=conn.prepareStatement("UPDATE member SET password=?,name=?,age=?,gender=?,email=? WHERE ID = '"+id+"'");
 
    pstmt.setString(1,password);
    pstmt.setString(2,name);
    pstmt.setInt(3,age);
    pstmt.setString(4,gender);
    pstmt.setString(5,email);
    System.out.println("---------------------result------------------");
    int result = pstmt.executeUpdate();
    
    if(result!=0){
       out.println("<script>");
       out.println("location.href='main.jsp'");
       out.println("</script>");
    }
 }catch(Exception e){
    e.printStackTrace();    
    }
 
 response.sendRedirect("main.jsp");
%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 
</body>
</html>
