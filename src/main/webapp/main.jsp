<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
 
<%
    String id = null;
    if (session.getAttribute("id") != null) {
        id = (String) session.getAttribute("id");//로그인을 성공적으로 수행하면 메인창 입장.
    } else {
        out.println("<script>");
        out.println("location.href='MemberLogin.jsp'"); //로그인 실패시 다시 loginForm.jsp로 돌아간다.
        out.println("</script>");
    }
%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Join Main</title>
</head>
<body>
    <h3 align = "center">
    <%=id%>로 로그인 하셨습니다
    </h3>
    
    <%
     Connection conn = null;
     PreparedStatement pstmt =null;
     ResultSet rs = null;
     
     try{
      Context init=new InitialContext();
      DataSource ds =(DataSource) init.lookup("java:comp/env/jdbc/OracleDB"); //커넥션풀 여기도 등장합니다요
      conn = ds.getConnection();
      
      pstmt=conn.prepareStatement("select * from member where id=?"); //sql문을 똑같이 적어주면 된다.
      pstmt.setString(1,id);
      rs=pstmt.executeQuery();
      
      while(rs.next()) { //DB를 일일이 확인 할 것 없이 바로 자신의 회원정보를 열람 할 수 있도록 하였다.
        %>        
        <center>
        <h2>나의 회원정보</h2>
        <table border ="1" align="center">
            <tr>
                    <td>아이디:</td><td><%= id %></td>
            </tr>
            <tr>
                <td>이름:</td><td><%=rs.getString("name")%></td>
            </tr>
            <tr>
                <td>비밀번호:</td><td><%=rs.getString("password") %></td>
            </tr>
            <tr>
                <td>나이:</td><td><%=rs.getString("age") %></td>
            </tr>
            <tr>
                <td>성별:</td><td><%=rs.getString("gender") %></td>
            </tr>
            <tr>
                <td>이메일:</td><td><%=rs.getString("email") %></td>
            </tr>
        </table>
        
    <%
        }
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
    <br>
    <a href="modifyForm.jsp" align = "center">정보수정</a>    <!-- 정보수정을 원하면 modifyForm.jsp로 이동한다 -->
    
    <%-- <%
        if (id.equals("admin")) {    //admin이라는 아이디는 관리자이다. 관리자가 로그인 하였을 시에는 관리자모드 접속을 하도록 코딩하였다.
    %>
    <!-- //관리자(admin)접속시 -->
    <a href=" member_list.jsp" align ="center">관리자모드 접속(목록 보기 가능)</a>
    <%
        }
    %>
    
  --%>
  <form action ="RentcarMain.jsp"><input type="submit" value="메인으로"></form>
  
    </center>
</body>
</html>
 