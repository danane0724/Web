<%@page import="board.BoardBean"%>
<%@page import="member.MemberDAO"%>
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

int num = Integer.parseInt(request.getParameter("num"));
String name = request.getParameter("name");
String pass = request.getParameter("pass");
String subject = request.getParameter("subject");
String content = request.getParameter("content");
int indent = Integer.parseInt(request.getParameter("indent"));
int step = Integer.parseInt(request.getParameter("step"));
BoardBean bb = new BoardBean();
bb.setName(name);
bb.setPass(pass);
bb.setSubject(subject);
bb.setContent(content);
MemberDAO mdao = new MemberDAO();

bdad.insertReply(bb);

%>
  <script language=javascript>
   self.window.alert("입력한 답글을 저장하였습니다.");
   location.href="list.jsp?pageNum=<%=pageNum%>"; 



</script>

</body>
</html>