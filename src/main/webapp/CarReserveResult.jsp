<%@page import="db.CarListBean"%>
<%@page import="db.RentcarDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
    <!-- 한글이 넘어올수도 있기 때문에 문자셋설정을 다시한다. -->
 
    <%
        request.setCharacterEncoding("euc-kr");
    %>
    <!-- 한번에 빈클래스에 있는 값들을 받아야되서 useBean 사용 -->
    <jsp:useBean id="rbean" class="db.CarReserveBean">
        <jsp:setProperty name="rbean" property="*" />
    </jsp:useBean>
 
    <%
        //로그인한 아이디가 페이지가 변경되어도 유지가 되어야하기 때문에 세션으로 받는다.
        //받는 아이디는 오브젝트 타입이기 때문에 String 타입으로 타입변환을 시켜준다.
        String id = (String) session.getAttribute("id");
 
        //null값과 비교할시에는 GUEST값이 나와버리므로 
        //null 대신에 GUEST와 비교한다.
        //비교한후에 참이면 (로그인이 안되었으면) 로그인페이지로 이동하게함
        if (id == null) {
    %>
 
    <script>
        //예약할시에 로그인이 안되어있을경우 출력되는 메시지
        alert("로그인후 예약이 가능합니다.");
        //로그인이 안되어있을경우 로그인 페이지로 이동
        location.href = 'RentcarMain.jsp?center=MemberLogin.jsp';
    </script>
 
    <%
        }
        //날짜 비교 (현재 날짜보다 앞에 날짜는 선택 못하게 하기.. )
        Date d1 = new Date();
        Date d2 = new Date();
        
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
 
        //d1은 yyyy-MM-dd 형식으로 변경된다.
        d1 = sdf.parse(rbean.getRday());
        //d2는 yyyy-MM-dd 형식으로 변경된다.
        d2 = sdf.parse(sdf.format(d2));
 
        //날짜 비교 메소드를 사용가능 date 클래스 사용
 
        int compare = d1.compareTo(d2);
        //예약하려는 날짜보다 현재 날짜가 크다면 -1을 반환
        //예약하려는 날짜와 현재 날짜가 같다면 0을 반환
        //예약하려는 날짜가 더 크다면 1을 리턴함
 
        if (compare < 0) {
            //오늘보다 이전 날짜 선택시 예약이 안되게끔 해야함
    %>
 
    <script>
        alert("현재 시스템 날짜보다 이전 날짜는 선택할 수 없음");
        history.go(-1);//이전 단계로 이동하시오.
    </script>
 
    <%
        }
 
        //결과적으로 아무런 문제가 없다면 데이터 저장후 결과 페이지로 이동하기
        //아이디값이 빈 클래스에 없고, 세션에 저장시켰기 때문
        //id는 null값이 들어갈수 있으므로 변수이름을 id1 으로 한다.
        String id1 = (String) session.getAttribute("id");
        rbean.setId(id1);
 
        //데이터베이스에 빈클래스를 저장함
        RentcarDAO rdao = new RentcarDAO();
        rdao.setReserveCar(rbean);
 
        //차량정보 얻어오기 CarReserveBean에는 차량 사진이 저장되어 있지 않기때문에 다른곳에서 얻어와야 한다.
        CarListBean cbean = rdao.getOneCar(rbean.getNo());
 
        //차량 총 금액, 금액 * 차량 대수 * 빌리는 날짜
        int totalcar = cbean.getPrice() * rbean.getQty() * rbean.getDday();
        //옵션 금액
        int usein = 0;
        if (rbean.getUsein() == 1)
            usein = 10000;
 
        int usewifi = 0;
        if (rbean.getUsewifi() == 1)
            usewifi = 10000;
 
        int useseat = 0;
        if (rbean.getUseseat() == 1)
            useseat = 10000;
 
        //옵션의 총금액 (보험 등등등)
        int totaloption = (rbean.getQty() * rbean.getDday()) * (usein + usewifi + useseat);
    %>
    <center>
        <table width="1000">
            <tr height="100">
                <td align="center"><font size="6" color="gray"> 차량 예약 완료
                        화면 </font></td>
            </tr>
 
            <tr>
                <td align="center"><img alt="" src="img<%=cbean.getImg()%>"
                    width="470"></td>
            </tr>
 
            <tr height="50">
                <td align="center"><font size="5" color="red"> 차량 총예약 금액
                        <%=totalcar%>원
                </font></td>
            </tr>
 
            <tr height="50">
                <td align="center"><font size="5" color="red"> 차량 총옵션 금액
                        <%=totaloption%>원
                </font></td>
            </tr>
 
            <tr height="50">
                <td align="center"><font size="5" color="red"> 차량 총 금액 <%=totaloption + totalcar%>원
                </font></td>
            </tr>
 
        </table>
    </center>
</body>
</html>
