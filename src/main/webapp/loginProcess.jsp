<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 
<!-- loginProcess는 입력된 정보를 DB와 연결해주는 창입니다. -->
<%
 String id = request.getParameter("id");
 String pass =request.getParameter("pass");
 
 Connection conn = null;
 PreparedStatement pstmt =null;
 ResultSet rs = null;
 
 try{
  Context init=new InitialContext(); //커넥션 풀을 이용하게 되면 편리하게 디비연동을 할 수 있다.
  DataSource ds =(DataSource) init.lookup("java:comp/env/jdbc/OracleDB"); //아래서 저장한 connection name값을 불러온다.
  conn = ds.getConnection();
  
  pstmt=conn.prepareStatement("select * from member where id=?"); //prepareStatement는 Statement와 다르게 ?로 지정된 값을 필요 할 때 마다 이용할수있다.
  pstmt.setString(1,id);
  rs=pstmt.executeQuery();
  
  if(rs.next()){  
   if(pass.equals(rs.getString("passwd"))){ 
    session.setAttribute("id",id);
    out.println("<script>");
    out.println("location.href='RentcarMain.jsp'"); //저장된 정보와 아이디와 비밀번호가 일치하면 main.jsp로 보낸다. main.jsp는 정보가 출력되는 창이다.
    out.println("</script>");
   }
  }
  out.println("<script>");
  out.println("location.href='main.jsp'"); 
  out.println("</script>");
 }catch(Exception e){
  e.printStackTrace();
 }
%>
</body>
</html>