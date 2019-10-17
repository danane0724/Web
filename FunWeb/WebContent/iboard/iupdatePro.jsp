<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="board.BoardDAO3"%>
<%@page import="board.BoardBean3"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>iupdatePro.jsp</title>
</head>
<body>
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
int num = Integer.parseInt(multi.getParameter("num"));
String name = multi.getParameter("name");
String pass = multi.getParameter("pass");
String subject=multi.getParameter("subject");
String content=multi.getParameter("content");
String file = multi.getFilesystemName("file");
// BoardBean bb
BoardBean3 bb = new BoardBean3();
// 멤버변수 <= 파라미터값
bb.setNum(num);
bb.setName(name);
bb.setPass(pass);
bb.setSubject(subject);
bb.setContent(content);
bb.setFile(file);
// BoardDAO bdao 객체 생성
BoardDAO3 bdao = new BoardDAO3();
// checkNum(bb)
// int check = checkNum(bb)
int check = bdao.checkNum(bb);
// check == 1 이면 num, pass 일치 수정 upadteBoard(bb) 호출 list.jsp 이동
// check == 0 이면 "비밀번호틀림" 뒤로 이동
// check == -1 이면 "글없음" 뒤로 이동
if(check == 1) {
	bdao.updateBoard(bb);
	response.sendRedirect("inotice.jsp");
} else if(check == 0) {
	%>
	<script>
	alert("비밀번호가 틀렸습니다");
	history.back();
	</script>
	<%
} else {
	%>
	<script>
	alert("글 없음");
	history.back();
	</script>
	<%
}
%>
</body>
</html>
















