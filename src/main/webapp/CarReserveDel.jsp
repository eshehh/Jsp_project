<%@page import="db.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
 
<% 
    //���� ������ �����ϴ� ������
    //�������� ����ϱ����� pk(�⺻Ű ������ ����ϱ� ����) id�� �뿩���� �Ķ���ͷ� �޴´�.
    String id = request.getParameter("id");
    String rday = request.getParameter("rday");
    System.out.println("ù��°"+id);
    
    RentcarDAO rdao = new RentcarDAO();
    //������� �޼ҵ� ȣ��
    rdao.carRemoveReserve(id,rday);
    System.out.println("�ι�°"+id);
    response.sendRedirect("RentcarMain.jsp");
%>
 
</body>
</html>
