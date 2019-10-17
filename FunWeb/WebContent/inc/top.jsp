<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
<%
// 세션값 가져오기
String id = (String)session.getAttribute("id");
// 세션값이 없을시 login | join 화면 출력
// 세션값이 있을시 ...님 | logout | 회원정보 수정
if(id==null){
	%><div id="login"><a href="../member/login.jsp">login</a> | <a href="../member/join2.jsp">join</a></div><%
}else{
	%><div id="login"><%=id %>님 | <a href="../member/logout.jsp">logout</a> | <a href="../member/updateForm.jsp">회원정보수정</a>
	| <a href="../member/deleteForm.jsp">회원탈퇴</a></div><%
}
%>

<div class="clear"></div>
<!-- 로고들어가는 곳 -->
<div id="logo"><img src="../images/logokorea.png" width="265" height="150" alt="Fun Web"></div>
<!-- 로고들어가는 곳 -->
<nav id="top_menu">
<ul>
	<li><a href="../main/main.jsp">HOME</a></li>
	<li><a href="../company/welcome.jsp">온라인 견적문의</a></li>
	<li><a href="#">패키지 여행</a></li>
	<li><a href="../center/notice.jsp">게시판</a></li>
	<li><a href="../mail/mailForm.jsp" target="_blank">메일보내기</a></li>
</ul>
</nav>
</header>