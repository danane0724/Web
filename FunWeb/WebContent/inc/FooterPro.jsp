<%@page import="jsp.visit.model.VisitCountBean"%>
<%@page import="jsp.visit.model.VisitCountDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

VisitCountBean vcb = new VisitCountBean();
vcb.setDate(date);
VisitCountDAO dao = new VisitCountDAO();





%>
</body>
</html>