<%@page import="db.CarViewBean"%>
<%@page import="db.CarReserveBean"%>
<%@page import="java.util.Vector"%>
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
 
    <!-- ���������ҽÿ� �������� ������ -->
    <%
        String id = (String) session.getAttribute("id");
        //���� ���̵� null�� �ÿ� (�� ��α��� �����϶� �����ϴ� ����)
        if (id == null) {
    %>
    <script>
        //�α��� �������� �����ش�.
        alert("�α����� �ʿ��մϴ�");
        location.href = 'RentcarMain.jsp?center=MemberLogin.jsp';
    </script>
 
    <%
        }
        //�α��� �Ǿ��ִ� ���̵� �о��
        RentcarDAO rdao = new RentcarDAO();
        //��� ���̵� �޾ƿ��� Ȯ������ �ʱ⶧���� ���͸� ����Ѵ�.
        Vector<CarViewBean> v = rdao.getAllReserve(id);
    %>
    <center>
        <table width="1000" border="1">
            <tr height="100">
                <td align="center" colspan="11"><font size="6" color="gray">
                        ���� ���� ȭ�� </font></td>
            </tr>
            <tr height="40">
                <td width="150" align="center">�̹���</td>
                <td width="150" align="center">�̸�</td>
                <td width="150" align="center">�뿩��</td>
                <td width="60" align="center">�뿩�Ⱓ</td>
                <td width="100" align="center">�ݾ�</td>
                <td width="60" align="center">����</td>
                <td width="60" align="center">����</td>
                <td width="60" align="center">wifi</td>
                <td width="60" align="center">���̺��Ʈ</td>
                <td width="60" align="center">�׺���̼�</td>
                <td width="90" align="center">����</td>
            </tr>
            <%
                //���ͷ� ���� ������ ����ؼ� bean�� ������
                for (int i = 0; i < v.size(); i++)
 
                {
                    CarViewBean bean = v.get(i);
            %>
            <!-- ���� �������ִ� ������ �ϳ��� ��� �Ѵ�. -->
            <tr height="40" bordercolor="blue">
                <td width="150" align="center"><img alt=""
                    src="img/<%=bean.getImg()%>" width="120" height="70"></td>
                <td width="150" align="center"><%=bean.getName()%></td>
                <td width="150" align="center"><%=bean.getRday()%></td>
                <td width="60" align="center"><%=bean.getDday()%></td>
                <td width="100" align="center"><%=bean.getPrice()%> ��</td>
                <td width="60" align="center"><%=bean.getQty()%></td>
                <td width="60" align="center"><%=bean.getUsein()%></td>
                <td width="60" align="center"><%=bean.getUsewifi()%></td>
                <td width="60" align="center"><%=bean.getUseseat()%></td>
                <td width="60" align="center"><%=bean.getUsenavi()%></td>
                <!-- ���� �������� �̵��� -->
                <td width="90" align="center">
                    <button onclick="location.href='CarReserveDel.jsp'">����</button>
                </td>
            </tr>
            <%
                }
            %>
 
        </table>
    </center>
</body>
</html>
