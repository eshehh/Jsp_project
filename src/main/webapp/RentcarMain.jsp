<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
 
    <%
        String center = request.getParameter("center");
        //ó�� ����ÿ��� center ���� �Ѿ���� �ʱ⿡ �ݵ��  nulló���� �ؾ��Ѵ�.
        //ó���� ���������� ������ �߻��ɼ� �ִ�.
 
        if (center == null) {
            center = "Center.jsp"; //����Ʈ center���� �ο�(ù ȭ�鿡�� center�� �ߵ��� �Ѵٴ� ��)    
        }
    %>
    <center>
        <table width="1000">
 
            <!-- Top �κ� -->
            <tr height="140" align="center">
                <!-- include page�� ����Ͽ��� main���������� �� �������� ȣ��ɼ� �ֵ��� �Ѵ�. -->
                <td align="center" width="1000"><jsp:include page="Top.jsp" /></td>
            </tr>
 
            <!-- Center �κ� -->
            <!-- Top��,Bottom�� ȭ���� �Ѿ���� �ٲ��� ������ center�� ��� �ٲ�� ������ center���� �ش� -->
 
            <tr height="100" align="center">
                <td align="center" width="1000"><jsp:include
                        page="<%=center%>" /></td>
            </tr>
 
            <!-- Bottom �κ� -->
            <tr height="140" align="center">
                <td align="center" width="1000"><jsp:include page="Bottom.jsp" /></td>
            </tr>
 
        </table>
    </center>
</body>
</html>