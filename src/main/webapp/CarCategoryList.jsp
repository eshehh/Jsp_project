<%@page import="db.CarListBean"%>
<%@page import="java.util.Vector"%>
<%@page import="db.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
    <!-- ī�װ� �з����� �޾ƿͼ� ����,����, ������ ���� ȭ�鿡 ����� -->
    <%
        int category = Integer.parseInt(request.getParameter("category"));
        String temp = "";
        if (category == 1)
            temp = "����";
        else if (category == 2)
            temp = "����";
        else if (category == 3)
            temp = "����";
    %>
    <center>
        <table width="1000">
            <tr height="100">
                <td align="center" colspan="3"><font size="6" color="gray">
                        <%=temp%>�ڵ���
                </font></td>
            </tr>
            <%
                //ī�װ� �з����� �޾ƿ´�. (�˻��� �������� ��ƾ��ϱ� ����)
                //CarRserveMain������ ���� //select �ɼ����� �� ������ �����´�.
                //����=1, ����=2 ����
                //request.getParameter ���� �� string Ÿ���̱⶧���� ����Ŭ������ ����� Ÿ�Ժ�ȯ�� �Ѵ�.
 
                System.out.println("category");
 
                //DB������ ���� ��ü�� ����
                RentcarDAO rdao = new RentcarDAO();
 
                //���� �������̱� ������ ���ͷ� �ް�, �Ķ���ͷ� ���� category (�з�����)�� �Ű������� �ش�.
                Vector<CarListBean> v = rdao.getCategoryCar(category);
 
                //tr�� 3���� �����ְ� �ٽ� tr�� ������ �� �ֵ��� �ϴ� ���� ����
                int j = 0;
                for (int i = 0; i < v.size(); i++) {
                    //���Ϳ� ����Ǿ� �ִ� �� Ŭ������ ����
                    CarListBean bean = v.get(i);
                    //3������ 0�� ���ƿ´ٴ� ��. �� 3���� �ѹ� �����ϵ��� �ϴ� ����
                    if (j % 3 == 0) {
            %>
            <tr height="220">
                <%
                    }
                %>
                <td width="333" align="center"><a
                    href="RentcarMain.jsp?center=CarReserveInfo.jsp?no=<%=bean.getNo()%>">
                        <img alt="" src="img/<%=bean.getImg()%>" width="300" height="200">
                </a>
                    <p>
                        <font size="3" color="gray"><b>������ : <%=bean.getName()%>
                        </b> </font></td>
 
 
 
                <%
                    j = j + 1; //j���� �����Ͽ� �ϳ��� �࿡ ��3���� ���������� �����ֱ� ���ؼ� ����
                    }
                %>
            
        </table>
    </center>
</body>
</html>
