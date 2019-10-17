<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- <% --%>
<!-- // int TotalCnt = (int)session.getAttribute("totalCount"); -->
<!-- // int TodayCnt = (int)session.getAttribute("todayCount"); -->
<%-- %> --%>
<!-- <form action="VisitSessionListener.java" method="post"> -->

<br>
    전체 : <%=session.getAttribute("totalCount") %>
    <br>
    오늘 : <%=session.getAttribute("todayCount") %>
    <br>

<!-- </form> -->
</body>
</html>

