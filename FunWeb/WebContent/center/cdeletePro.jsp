<%@page import="board.CommentBean"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Web_KJW - cdeletePro.jsp</title>
</head>
<body>
<%
// 한글처리
request.setCharacterEncoding("utf-8");
// num, pass 파라미터 가져오기
int num = Integer.parseInt(request.getParameter("num"));
int connum = Integer.parseInt(request.getParameter("connum"));

String id = (String)session.getAttribute("id"); // 저장된 세션값 가져오는거

// String id = request.getParameter("id");



CommentBean cb = new CommentBean();
cb.setNum(num);
cb.setId(id);
// bb.setPass(pass);

// BoardDAO 객체 생성
BoardDAO bdao = new BoardDAO();


if(id != null) {
	if(id.equals(cb.getId())) {
	bdao.cdeleteBoard(cb);
	%>
	<script type="text/javascript">
	alert("댓글 삭제");
	location.href = "content.jsp?num=<%=connum%>";
	</script>
	<%
	} 
} else {
	%>
	<script>
    alert("로그인 후에 이용해 주세요");
    location.href="../member/login.jsp";
 	</script>
   	<%
}


%>
</body>
</html>