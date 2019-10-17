<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updatePro.jsp</title>
</head>
<body>
<%
//한글처리
request.setCharacterEncoding("utf-8");
// num, pass, name, subject, content 파라미터 가져오기
int num = Integer.parseInt(request.getParameter("num"));
String name = request.getParameter("name");
String pass = request.getParameter("pass");
String subject=request.getParameter("subject");
String content=request.getParameter("content");
// BoardBean bb
BoardBean bb = new BoardBean();
// 멤버변수 <= 파라미터값
bb.setNum(num);
bb.setName(name);
bb.setPass(pass);
bb.setSubject(subject);
bb.setContent(content);
// BoardDAO bdao 객체 생성
BoardDAO bdao = new BoardDAO();
// checkNum(bb)
// int check = checkNum(bb)
int check = bdao.checkNum(bb);
// check == 1 이면 num, pass 일치 수정 upadteBoard(bb) 호출 list.jsp 이동
// check == 0 이면 "비밀번호틀림" 뒤로 이동
// check == -1 이면 "글없음" 뒤로 이동
if(check == 1) {
	bdao.updateBoard(bb);
	response.sendRedirect("notice.jsp");
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
















