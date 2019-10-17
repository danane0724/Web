<%@page import="member.MemberDAO"%>
<%@page import="member.MemberBean"%>
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
String id = request.getParameter("id");
MemberBean mb = new MemberBean();
MemberDAO mdao = new MemberDAO();

int check = mdao.duplicateIdCheck(id);


if(check == 1)    // 로그인 성공
{ 
%>
	
	<script>
	alert("중복된 아이디 입니다");
	history.back(); // 뒤로 이동
	</script>
	
	<%
}
else if(check == 0) // check == 0 "비밀번호 틀림"		
{
	%>
	
	<script>
	alert("비밀번호틀림");
	history.back(); // 뒤로 이동
	</script>
	
	<%
}
else   // check == -1 "아이디없음"
{
 	%>
	 <script>
	 alert("아이디 사용 가능");
	 opener.document.join.id.value = '<%=id%>';
     
   
         self.close();
         
	 	 </script>
	 	 <%
}
%>


</body>
</html>