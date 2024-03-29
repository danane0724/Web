<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="board.BoardDAO3"%>
<%@page import="board.BoardBean3"%>
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
<title><h1>iwritePro.jsp 게시판</h1></title>
</head>
<body>
<h1>iwritePro.jsp 게시판 </h1>
<%
//한글처리
//request.setCharacterEncoding("utf-8");
//multipart 객체생성
//upload폴더 만들기
String uploadPath=request.getRealPath("/upload");
//첨부파일 크기
int maxSize=5*1024*1024; //5M
MultipartRequest multi=
new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());
//multi  name,pass,subject,content 파라미터 가져와서 => 변수 저장
String name = multi.getParameter("name");
String pass = multi.getParameter("pass");
String subject = multi.getParameter("subject");
String content = multi.getParameter("content");
String file = multi.getFilesystemName("file");

// 자바빈 패키지 board 파일이름 BoardBean
// BoardBean bb 객체생성
BoardBean3 bb = new BoardBean3();
// 자바빈 멤버변수 <= 파라미터 저장
bb.setName(name);
bb.setPass(pass);
bb.setSubject(subject);
bb.setContent(content);
bb.setFile(file);
// 디비자바파일 패키지 board 파일이름 BoardDAO
// BoardDAO bdao 객체생성
BoardDAO3 bdao = new BoardDAO3();
// insertBoard(bb) 메서드 호출
bdao.insertBoard(bb);

// 글목록 이동 notice.jsp
response.sendRedirect("inotice.jsp");
%>
</body>
</html>