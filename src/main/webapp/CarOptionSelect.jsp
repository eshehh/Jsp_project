<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<body>
    <% 
    int no = Integer.parseInt(request.getParameter("no"));
    
    //���� ����
    int qty = Integer.parseInt(request.getParameter("qty"));
    //�̹����� ������
    String img = request.getParameter("img");
%>
    <div style="text-align: center;">
        <form action="RentcarMain.jsp?center=CarReserveResult.jsp"
            method="post">
            <table width="1000">
                <tr height="100">
                    <td align="center" colspan="3"><font size="6" color="gray">
                            �ɼ� ���� </font></td>
                </tr>
                <tr>
                    <!-- colspan�� ���μ����� �����ϴ� ���̰�, rowspan�� ���� ������ �����ϴ� �� -->
                    <!-- ���� ���� ���� �������� �����ϱ⶧���� ���κ����� rowspan�� ��� -->
                    <td rowspan="7" width="500" align="center"><img alt=""
                        src="img/<%=img %>" width="450"></td>
                    <td width="250" align="center">�뿩�Ⱓ</td>
                    <td width="250" align="center"><select name="dday">
                            <option value="1">1��</option>
                            <option value="2">2��</option>
                            <option value="3">3��</option>
                            <option value="4">4��</option>
                            <option value="5">5��</option>
                            <option value="6">6��</option>
                            <option value="7">7��</option>
                    </select></td>
                </tr>
                <tr>
                    <td width="250" align="center">�뿩��</td>
                    <td width="250" align="center"><input type="date" name="rday"
                        size="15"></td>
                <tr>
                    <td width="250" align="center">��������</td>
                    <td width="250" align="center"><select name="usein">
                            <option value="1">���� (1�� 1����)</option>
                            <option value="2">������</option>
                    </select></td>
                </tr>
 
                <tr>
                    <td width="250" align="center">wifi ����</td>
                    <td width="250" align="center"><select name="usewifi">
                            <option value="1">���� (1�� 1����)</option>
                            <option value="2">������</option>
                    </select></td>
                </tr>
 
                <tr>
                    <td width="250" align="center">�׺���̼� ����</td>
                    <td width="250" align="center"><select name="usenavi">
                            <option value="1">���� (����)</option>
                            <option value="2">������</option>
                    </select></td>
                </tr>
 
 
                <tr>
                    <td width="250" align="center">���̺��Ʈ ����</td>
                    <td width="250" align="center"><select name="useseat">
                            <option value="1">���� (1�� 1����)</option>
                            <option value="2">������</option>
                    </select></td>
                </tr>
 
                <tr>
                    <td align="center" colspan="2"><input type="hidden" name="no"
                        value="<%=no %>"> <input type="hidden" name="qty"
                        value="<%=qty %>"> <input type="submit" value="���������ϱ�"></td>
                </tr>
 
            </table>
        </form>
    </div>
</body>
</html>
