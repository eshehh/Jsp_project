<%@page import="db.CarViewBean"%>
<%@page import="db.CarReserveBean"%>
<%@page import="java.util.Vector"%>
<%@page import="db.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
 
    <!-- 차량예약할시에 보여지는 페이지 -->
    <%
        String id = (String) session.getAttribute("id");
        //얻어온 아이디가 null일 시에 (즉 비로그인 상태일때 실행하는 구문)
        if (id == null) {
    %>
    <script>
        //로그인 페이지를 보여준다.
        alert("로그인이 필요합니다");
        location.href = 'RentcarMain.jsp?center=MemberLogin.jsp';
    </script>
 
    <%
        }
        //로그인 되어있는 아이디를 읽어옴
        RentcarDAO rdao = new RentcarDAO();
        //몇개의 아이디를 받아올지 확실하지 않기때문에 벡터를 사용한다.
        Vector<CarViewBean> v = rdao.getAllReserve(id);
    %>
    <center>
        <table width="1000" border="1">
            <tr height="100">
                <td align="center" colspan="11"><font size="6" color="gray">
                        차량 예약 화면 </font></td>
            </tr>
            <tr height="40">
                <td width="150" align="center">이미지</td>
                <td width="150" align="center">이름</td>
                <td width="150" align="center">대여일</td>
                <td width="60" align="center">대여기간</td>
                <td width="100" align="center">금액</td>
                <td width="60" align="center">수량</td>
                <td width="60" align="center">보험</td>
                <td width="60" align="center">wifi</td>
                <td width="60" align="center">베이비시트</td>
                <td width="60" align="center">네비게이션</td>
                <td width="90" align="center">삭제</td>
            </tr>
            <%
                //벡터로 얻은 값들을 출력해서 bean에 저장함
                for (int i = 0; i < v.size(); i++)
 
                {
                    CarViewBean bean = v.get(i);
            %>
            <!-- 빈이 가지고있는 값들을 하나씩 출력 한다. -->
            <tr height="40" bordercolor="blue">
                <td width="150" align="center"><img alt=""
                    src="img/<%=bean.getImg()%>" width="120" height="70"></td>
                <td width="150" align="center"><%=bean.getName()%></td>
                <td width="150" align="center"><%=bean.getRday()%></td>
                <td width="60" align="center"><%=bean.getDday()%></td>
                <td width="100" align="center"><%=bean.getPrice()%> 원</td>
                <td width="60" align="center"><%=bean.getQty()%></td>
                <td width="60" align="center"><%=bean.getUsein()%></td>
                <td width="60" align="center"><%=bean.getUsewifi()%></td>
                <td width="60" align="center"><%=bean.getUseseat()%></td>
                <td width="60" align="center"><%=bean.getUsenavi()%></td>
                <!-- 삭제 페이지로 이동함 -->
                <td width="90" align="center">
                    <button onclick="location.href='CarReserveDel.jsp'">삭제</button>
                </td>
            </tr>
            <%
                }
            %>
 
        </table>
    </center>
</body>
</html>
