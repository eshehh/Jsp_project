<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
 
    <!-- ������ �̿��� �α��� ó�� -->
    <!-- �������� �޾ƿ� ���� ������Ʈ Ÿ���̱� ������ String Ÿ������ ������ �Ѵ�. -->
 
    <%
        String id = (String) session.getAttribute("id");
 
        //�α����� �Ǿ����� �ʴٸ� id�� "GUEST"���� �ش�
        if (id == null) {
            id = "GUEST";
        }
    %>
 
    <table width="1000" bordercolor="white">
        <tr height="70">
            <td colspan="4"><a href="RentcarMain.jsp"
                style="text-decoration: none"> <!-- �̹����� �ҷ��������� �±� �ۼ� --> <img
                    alt="" src="img/RENT.png" height="150" width="250">
            </a></td>
            <td align="center" width="200"><%=id%> �� <%
                if(id.equals("GUEST")){ %>
                <button
                    onclick="location.href='RentcarMain.jsp?center=MemberLogin.jsp'">
                    �α���</button> <%
                }else{%>
                <button onclick="location.href='RentcarMain.jsp?center=logout.jsp'">�α׾ƿ�</button> <% 
                }
            %></td>
        </tr>
        <!-- ���ڸ� ������ ȭ���� �Ѿ�� �ֵ��� a�±׸� �ɾ��� -->
        <tr height="50">
            <td align="center" width="200" bgcolor="pink"><font
                color="white" size="5"> <a
                    href="RentcarMain.jsp?center=CarReserveMain.jsp"
                    style="text-decoration: none"> �� �� �� �� </a></font></td>
 
            <td align="center" width="200" bgcolor="pink">
                <!-- ���ڸ� ������ ȭ���� �Ѿ�� �ֵ��� a�±׸� �ɾ��� --> <font color="white" size="5"><a
                    href="RentcarMain.jsp?center=CarReserveView.jsp" style="text-decoration: none"> �� �� Ȯ ��</a></font>
            </td>
 
            <td align="center" width="200" bgcolor="pink">
                <!-- ���ڸ� ������ ȭ���� �Ѿ�� �ֵ��� a�±׸� �ɾ��� --> <font color="white" size="5"><a
                    href="#" style="text-decoration: none"> �� �� �� �� �� </a></font>
            </td>
 
            <td align="center" width="200" bgcolor="pink">
                <!-- ���ڸ� ������ ȭ���� �Ѿ�� �ֵ��� a�±׸� �ɾ��� --> <font color="white" size="5"><a
                    href="#" style="text-decoration: none"> �� �� Ʈ </a></font>
            </td>
 
            <td align="center" width="200" bgcolor="pink">
                <!-- ���ڸ� ������ ȭ���� �Ѿ�� �ֵ��� a�±׸� �ɾ��� --> <font color="white" size="5"><a
                    href="#" style="text-decoration: none"> �� �� �� �� </a></font>
            </td>
        </tr>
 
    </table>
</body>
</html>