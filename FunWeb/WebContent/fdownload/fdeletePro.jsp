<%@page import="board.BoardDAO2"%>
<%@page import="board.BoardBean2"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Web_KJW - deletePro.jsp</title>
</head>
<body>
<%
// 한글처리
request.setCharacterEncoding("utf-8");
// num, pass 파라미터 가져오기
int num = Integer.parseInt(request.getParameter("num"));
String pass = request.getParameter("pass");

BoardBean2 bb = new BoardBean2();
bb.setNum(num);
bb.setPass(pass);

// BoardDAO 객체 생성
BoardDAO2 bdao = new BoardDAO2();
// int check = checkNum(bb)
int check = bdao.checkNum(bb);
if(check == 1) {
	bdao.deleteBoard(bb);
	%>
	<script type="text/javascript">
	alert("게시글 삭제");
	location.href = "notice2.jsp";
	</script>
	<%
} else {
	%>
	<script>
	alert("비밀번호 틀림");
	history.back();
	</script>
	<%
}
%>
</body>
</html>