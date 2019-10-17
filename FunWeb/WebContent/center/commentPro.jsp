<%@page import="board.BoardDAO"%>
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
request.setCharacterEncoding("utf-8");
String comment = request.getParameter("comment");
String id =(String)session.getAttribute("id");
int num = Integer.parseInt(request.getParameter("num"));
if(id==null){%>
   <script>
      alert("로그인 후에 이용해 주세요");
      location.href="../member/login.jsp";
   </script>
<%}
else{
BoardDAO bdao = new BoardDAO();
bdao.writeComment(comment, num, id);
}%>
<script>
   location.href="content.jsp?num=<%=num%>";
</script>
</body>
</html>