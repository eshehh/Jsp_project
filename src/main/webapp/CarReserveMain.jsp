<%@page import="db.CarListBean"%>
<%@page import="java.util.Vector"%>
<%@page import="db.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
    <center>
 
        <!-- �����ͺ��̽��� �����Ͽ� �ֽż� �ڵ��� 3�븸 �ѷ��ִ� �����͸� ������ -->
 
        <%
            RentcarDAO rdao = new RentcarDAO();
            //���͸� �̿��Ͽ� �ڵ��������͸� ������
            Vector<CarListBean> v = rdao.getSelectCar();
        %>
 
        <table width="1000">
            <tr height="100">
                <td align="center" colspan="3"><font size="6" color="gray">�ֽ���
                        �ڵ���</font></td>
            </tr>
 
 
            <tr height="240">
                <!-- ���Ϳ� ����� �̹����� �ϳ��� ����ؾ��ϱ� ������ for���� ������, �� ������ ��Ŭ���� ������ �־��ش�. -->
                <%
                    for (int i = 1; i < v.size(); i++) {
                        CarListBean bean = v.get(i);
                %>
                <td width="333" align="center">
                    <!-- �̹����� ������ 0������ �ش�Ǵ°� �����´�. for���� ���� td�� ����ؾ� �Ѵ�.--> <!-- Ȯ���ڴ� �̹����ȿ� �����Ƿ� ���� ���� �ʾƵ� �ȴ�. -->
                    <!-- �̹����� ������ �ٷ� �������� �Ѿ�� �ֵ��� �ϱ�����  <a>�±׸� �ɰ�, No�� ���� �������� ��µǵ��� �ϰ�
        �̸��� �����ؿ� ����ϵ��� �Ѵ�. --> <a
                    href="CarReserveInfo.jsp?no=<%=bean.getNo()%>"> <img alt=""
                        src="img/<%=bean.getImg()%>" width="300" height="220">
                </a>
                    <p>
                        ������ :
                        <%=bean.getName()%>
                </td>
 
 
                <%
                    }
                %>
            
        </table>
 
        <p>
            <font size="4" color="gray"> ���� �˻� �ϱ� </font><br> <br> <br>
            <!-- ������ �����ϰ� �˻��� �ϸ� ������� �����͵� ������ �Ѿ���ϱ� ������ form������ ����Ѵ�. -->
        <form action="RentcarMain.jsp?center=CarCategoryList.jsp"
            method="post">
            <font size="3" color="gray"> <b>���� �˻� �ϱ�</b>
            </font>&nbsp;&nbsp; <select name="category">
                <option value="1">����</option>
                <option value="2">����</option>
                <option value="3">����</option>
            </select>&nbsp;&nbsp; <input type="submit" value="�˻�"> &nbsp;&nbsp;
 
        </form>
        <button
            onclick="location.href='RentcarMain.jsp?center=CarAllList.jsp'">��ü
            �˻�</button>
 
    </center>
</body>
 
</html>