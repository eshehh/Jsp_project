<%@page import="db.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
 
<% 
    //차량 예약을 삭제하는 페이지
    //쿼리문을 사용하기위한 pk(기본키 값으로 사용하기 위해) id와 대여일을 파라미터로 받는다.
    String id = request.getParameter("id");
    String rday = request.getParameter("rday");
    System.out.println("첫번째"+id);
    
    RentcarDAO rdao = new RentcarDAO();
    //예약삭제 메소드 호출
    rdao.carRemoveReserve(id,rday);
    System.out.println("두번째"+id);
    response.sendRedirect("RentcarMain.jsp");
%>
 
</body>
</html>
