<%@page import="db.CarListBean"%>
<%@page import="db.RentcarDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
    <!-- �ѱ��� �Ѿ�ü��� �ֱ� ������ ���ڼ¼����� �ٽ��Ѵ�. -->
 
    <%
        request.setCharacterEncoding("euc-kr");
    %>
    <!-- �ѹ��� ��Ŭ������ �ִ� ������ �޾ƾߵǼ� useBean ��� -->
    <jsp:useBean id="rbean" class="db.CarReserveBean">
        <jsp:setProperty name="rbean" property="*" />
    </jsp:useBean>
 
    <%
        //�α����� ���̵� �������� ����Ǿ ������ �Ǿ���ϱ� ������ �������� �޴´�.
        //�޴� ���̵�� ������Ʈ Ÿ���̱� ������ String Ÿ������ Ÿ�Ժ�ȯ�� �����ش�.
        String id = (String) session.getAttribute("id");
 
        //null���� ���ҽÿ��� GUEST���� ���͹����Ƿ� 
        //null ��ſ� GUEST�� ���Ѵ�.
        //�����Ŀ� ���̸� (�α����� �ȵǾ�����) �α����������� �̵��ϰ���
        if (id == null) {
    %>
 
    <script>
        //�����ҽÿ� �α����� �ȵǾ�������� ��µǴ� �޽���
        alert("�α����� ������ �����մϴ�.");
        //�α����� �ȵǾ�������� �α��� �������� �̵�
        location.href = 'RentcarMain.jsp?center=MemberLogin.jsp';
    </script>
 
    <%
        }
        //��¥ �� (���� ��¥���� �տ� ��¥�� ���� ���ϰ� �ϱ�.. )
        Date d1 = new Date();
        Date d2 = new Date();
        //��¥�� 2016-4-4 �� �������ִ� Ŭ���� ����, month�� �빮�� M�� ���
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
 
        //d1�� yyyy-MM-dd �������� ����ȴ�.
        d1 = sdf.parse(rbean.getRday());
        //d2�� yyyy-MM-dd �������� ����ȴ�.
        d2 = sdf.parse(sdf.format(d2));
 
        //��¥ �� �޼ҵ带 ��밡�� date Ŭ���� ���
 
        int compare = d1.compareTo(d2);
        //�����Ϸ��� ��¥���� ���� ��¥�� ũ�ٸ� -1�� ��ȯ
        //�����Ϸ��� ��¥�� ���� ��¥�� ���ٸ� 0�� ��ȯ
        //�����Ϸ��� ��¥�� �� ũ�ٸ� 1�� ������
 
        if (compare < 0) {
            //���ú��� ���� ��¥ ���ý� ������ �ȵǰԲ� �ؾ���
    %>
 
    <script>
        alert("���� �ý��� ��¥���� ���� ��¥�� ������ �� ����");
        history.go(-1);//���� �ܰ�� �̵��Ͻÿ�.
    </script>
 
    <%
        }
 
        //��������� �ƹ��� ������ ���ٸ� ������ ������ ��� �������� �̵��ϱ�
        //���̵��� �� Ŭ������ ����, ���ǿ� ������ױ� ����
        //id�� null���� ���� �����Ƿ� �����̸��� id1 ���� �Ѵ�.
        String id1 = (String) session.getAttribute("id");
        rbean.setId(id1);
 
        //�����ͺ��̽��� ��Ŭ������ ������
        RentcarDAO rdao = new RentcarDAO();
        rdao.setReserveCar(rbean);
 
        //�������� ������ CarReserveBean���� ���� ������ ����Ǿ� ���� �ʱ⶧���� �ٸ������� ���;� �Ѵ�.
        CarListBean cbean = rdao.getOneCar(rbean.getNo());
 
        //���� �� �ݾ�, �ݾ� * ���� ��� * ������ ��¥
        int totalcar = cbean.getPrice() * rbean.getQty() * rbean.getDday();
        //�ɼ� �ݾ�
        int usein = 0;
        if (rbean.getUsein() == 1)
            usein = 10000;
 
        int usewifi = 0;
        if (rbean.getUsewifi() == 1)
            usewifi = 10000;
 
        int useseat = 0;
        if (rbean.getUseseat() == 1)
            useseat = 10000;
 
        //�ɼ��� �ѱݾ� (���� ����)
        int totaloption = (rbean.getQty() * rbean.getDday()) * (usein + usewifi + useseat);
    %>
    <center>
        <table width="1000">
            <tr height="100">
                <td align="center"><font size="6" color="gray"> ���� ���� �Ϸ�
                        ȭ�� </font></td>
            </tr>
 
            <tr>
                <td align="center"><img alt="" src="img<%=cbean.getImg()%>"
                    width="470"></td>
            </tr>
 
            <tr height="50">
                <td align="center"><font size="5" color="red"> ���� �ѿ��� �ݾ�
                        <%=totalcar%>��
                </font></td>
            </tr>
 
            <tr height="50">
                <td align="center"><font size="5" color="red"> ���� �ѿɼ� �ݾ�
                        <%=totaloption%>��
                </font></td>
            </tr>
 
            <tr height="50">
                <td align="center"><font size="5" color="red"> ���� �� �ݾ� <%=totaloption + totalcar%>��
                </font></td>
            </tr>
 
        </table>
    </center>
</body>
</html>
