<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃 처리</title>
</head>
<body>
<%
//Cookie user = new Cookie("id", "");
session.invalidate();//세션의 모든 속성 제거
response.sendRedirect("RentcarMain");
%>
<h4>로그아웃 완료</h4>

</body>
</html>