<%@page import="db.CarListBean"%>
<%@page import="db.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
 
<% 
    //������ �������� �������� no���� �����´�.
    int no = Integer.parseInt(request.getParameter("no"));
 
    //�����ͺ��̽��� ����
    RentcarDAO rdao = new RentcarDAO();
    //��Ʈī �ϳ��� ���� ������ ����
    CarListBean bean = rdao.getOneCar(no);
    
    int category = bean.getCategory();
    String temp = "";
    if (category == 1)
        temp = "����";
    else if (category == 2)
        temp = "����";
    else if (category == 3)
        temp = "����";
    
%>
<center>
<form action="CarOptionSelect.jsp">
<table width= "1000" >
<tr height="100">
            <td align="center" colspan="3"><font size="6" color="gray">
                        <%=bean.getName() %> ���� ����
                </font></td>
            </tr>
            <tr>
            <!-- colspan�� ���μ����� �����ϴ� ���̰�, rowspan�� ���� ������ �����ϴ� �� -->
            <!-- ���� ���� ���� �������� �����ϱ⶧���� ���κ����� rowspan�� ��� -->
            <td rowspan="6" width="500" align="center">
            <img alt="" src="img/<%=bean.getImg()%>" width="450"></td>
            <td width="250" align="center"> �����̸�</td>
            <td width="250" align="center"> <%=bean.getName() %></td>
            </tr>
            
            <tr>
            <td width="250" align="center"> ��������</td>
            <td width="250" align="center"> <select name = "qty">
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            </select>
            </td>
            </tr>
            
            
            <tr>
            <td width="250" align="center"> �����з�</td>
            <td width="250" align="center"> <%=temp %>
            </tr>
            
            <tr>
            <td width="250" align="center"> �뿩����</td>
            <td width="250" align="center"> <%=bean.getPrice() %>��</td>
            </tr>
           
            <tr>
            <td width="250" align="center"> ����ȸ��</td>
            <td width="250" align="center"> <%=bean.getCompany() %></td>
            </tr>
             
            <tr>
            <td align="center" colspan="2">
                <input type = "hidden" name ="no" value="<%=bean.getNo() %>">
                <input type="submit" value="�ɼǼ����� �����ϱ�">
                </td>
            </tr>
            
</table>
 </form>
<br><br><br>
<font size="6" color="gray"> ���� ���� ���� </font>
<p>
<%=bean.getInfo() %>
</center>
</body>
</html>
