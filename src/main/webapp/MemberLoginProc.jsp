<%@page import="db.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
 
    <% 
    //�α��� ó�� ������, �ѱ۱��� ����
 
    String id = request.getParameter("id");
    String pass = request.getParameter("pass");
    //ȸ�� ���̵�� �н����尡 ��ġ�ϴ��� ���Ѵ�.
    RentcarDAO rdao = new RentcarDAO();
    
    //�ش� ȸ���� �ִ��� ���θ� ���ڷ� ��ȯ�޴´�.
    int result = rdao.getMember(id,pass);
    
    if(result==0)
    {
%>
 
    <script>//�����ҽÿ� �α����� �ȵǾ�������� ��µǴ� �޽���
        alert("ȸ�� ���̵� �Ǵ� �н����尡 Ʋ���ϴ�.");
    //�α����� �ȵǾ�������� �α��� �������� �̵�
        location.href='RentcarMain.jsp?center=MemberLogin.jsp';
    </script>
 
    <%
    }else
    {
        //�α��� ó���� �Ǿ��ٸ� ���ǿ� ��ƾ� ȭ���� �Ѿ�� �����ȴ�.
        session.setAttribute("id", id);
        response.sendRedirect("RentcarMain.jsp");
    }
    
    
 
%>
 
 
</body>
</html>
