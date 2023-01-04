<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 
<form name="loginform" action="loginProcess.jsp" method="post">
    <center>
        <table border=1>
             <tr>
                  <td colspan="2" align=center bgcolor="pink">
                  <b><font size=6>로그인페이지</font></b>
                  </td>
                  </tr>
                  <tr><td>아이디 : </td><td><input type="text" name="id"></td></tr>
                  <tr><td>비밀번호 : </td><td><input type="password" name="pass"></td></tr>
                  <tr>
                  <td colspan="2" align=center>
                  <input type="submit" value="로그인"> <!-- 위의 form과 연동되어 loginProcess로 이동한다. -->
                  <a href ="RentcarMain.jsp?center=joinForm.jsp">회원가입</a>  <!-- 회원가입을 누르면 a태그를 통해서 joinForm으로 이동한다. -->
              </td>
            </tr>
        </table>
    </center>
</form>
</body>
</html>