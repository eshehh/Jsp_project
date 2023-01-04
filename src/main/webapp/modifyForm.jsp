<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
 
<%
    String id = null;
    if (session.getAttribute("id") != null) {
        id = (String) session.getAttribute("id");
    } else {
        out.println("<script>");
        out.println("location.href='main.jsp'");
        out.println("</script>");
    }
 
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
 
%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>정보수정</title>
</head>
<body>
    <form name="Modify" action="modifyProcess.jsp" method="post">
        <center>
            <table border=1>
                <tr>
                    <td colspan="2" align=center bgcolor="pink"><b><font size=5><%=id %>님 회원 정보
                                수정</font></b></td>
                </tr>
                <tr>
                    <td>비밀번호 :</td>
                    <td><input type="password" name="password"></td>
                </tr>
                
                <tr>
                    <td>이름 :</td>
                    <td><input type="text" name="name" size=5></td>
                </tr>
                
                <tr>
                    <td>나이 :</td>
                    <td><input type="text" name="age" size=5></td>
                </tr>
 
                <tr>
                    <td>성별</td>
                    <td><input type="radio" name="gender" value="남" checked />남자 <input
                        type="radio" name="gender" value="여" /> 여자</td>
                </tr>
                <tr>
                    <td>이메일 :</td>
                    <td><input type="text" name="email" size=30></td>
                </tr>
                <tr>
                    <td colspan="2" align=center><input type="submit" value="수정">
                    <input type="reset" value="다시 작성"></td>
                </tr>
 
            </table>
            
        </center>
    </form>
</body>
</html>
