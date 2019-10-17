<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><h1>writePro.jsp 게시판</h1></title>
</head>
<body>
<h1>writePro.jsp 게시판 </h1>
<%
// insertPro.jsp 참조

// 한글처리
request.setCharacterEncoding("utf-8");
// request name, pass, subject, content 파라미터 가져와서 => 변수 저장
String name = request.getParameter("name");
String pass = request.getParameter("pass");
String subject = request.getParameter("subject");
String content = request.getParameter("content");

// 자바빈 패키지 board 파일이름 BoardBean
// BoardBean bb 객체생성
BoardBean bb = new BoardBean();
// 자바빈 멤버변수 <= 파라미터 저장
bb.setName(name);
bb.setPass(pass);
bb.setSubject(subject);
bb.setContent(content);

// 디비자바파일 패키지 board 파일이름 BoardDAO
// BoardDAO bdao 객체생성
BoardDAO bdao = new BoardDAO();
// insertBoard(bb) 메서드 호출
bdao.insertBoard(bb);

// 글목록 이동 notice.jsp
response.sendRedirect("notice.jsp");
%>
</body>
</html>