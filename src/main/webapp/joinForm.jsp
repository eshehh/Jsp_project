<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    
    %>
<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
</head>
<body>
<form name="Join" action="joinProcess.jsp" method="post">
<center>
<table border=1>
<tr>
 <td colspan="2" align=center bgcolor="pink">
 <b><font size=5>회원가입</font></b>
 </td>
</tr>
 <tr><td>아이디 : </td><td><input type="text" name="id"></td></tr>
 <tr><td>비밀번호 : </td><td><input type="password" name="password"></td></tr>
 <tr><td>이름 : </td><td><input type="text" name="name"></td></tr>
 <tr><td>나이 : </td><td><input type="text" name="age" size=5></td></tr>
 
 <tr>
  <td>성별</td>
  <td>
   <input type="radio" name="gender" value="남" checked/>남자
   <input type="radio" name="gender" value="여"/> 여자
  </td> 
 </tr>
 <tr><td>이메일 : </td><td><input type="text" name="email" size=30></td></tr>
 <tr>
  <td colspan="2" align=center>
   <input type="submit" value="회원가입"> <!-- 회원가입을 하면 joinProcess.jsp로 넘어가게된다. -->
   <input type="reset" value="다시 작성"> 
 
  </td>
 </tr>
 
</table>
</center>
</form>
</body>
</html>
