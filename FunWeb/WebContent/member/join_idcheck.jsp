<%@page import="member.MemberDAO"%>
<%@page import="member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join2 -> join_idcheck.jsp</title>
<style type="text/css">
#wrap {
	width: 490px;
	text-align: center;
	margin: 0 auto 0 auto;
}

#chk {
	text-align: center;
}

#cancelBtn {
	visibility: visible;
}

#useBtn {
	visibility: hidden;
}


</style>
<script type="text/javascript">

function result() {
	// join2.jsp id상자 <= 검색한 id
	opener.document.fr.id.value = document.wfr.userid.value;
	// 창단기
	window.close();
}
</script>

</head>
<body>

<%
request.setCharacterEncoding("utf-8");

// userid 파라미터 가져오기
String id = request.getParameter("userid");
// 가져온 아이디 출력
out.println(id);
// MemberDAO 객체 생성
MemberDAO mdao = new MemberDAO();
// int check = idcheck(id) 메서드 호출
int check = mdao.idcheck(id);
// check == 1 아이디있음 "아이디 중복"
// check == 0 아이디없음 "아이디 사용가능"


MemberBean mb = new MemberBean();



if(check == 1) {   // 아이디있음 "아이디 중복" 
	%>
	<script>
	alert("중복된 아이디 입니다");
<!-- 	out.println("아이디 중복"); -->
	</script>
	<%
}
else {// check == 0 "비밀번호 틀림"	
	
	%>
	<script type="text/javascript">
	alert("아이디 사용 가능")
<!-- 	out.println("아이디 사용가능"); -->
	</script>
	<input type="button" value="아이디사용" onclick="result()">
	<%
}
%>	

<div id="wrap">
<br> <b><font size="4" color="gray">아이디 중복체크</font></b>
		<hr size="1" width="460">
		<br>
		<div id="chk">
		
		
<form action="join_idcheck.jsp" method="post" name="wfr">
아이디 : <input type="text" name="userid" value="<%=id%>">
<input type="submit" value="아이디 중복 확인">
</form>
</div>
</div>

<!-- <div id="wrap"> -->
<!-- 		<br> <b><font size="4" color="gray">아이디 중복체크</font></b> -->
<!-- 		<hr size="1" width="460"> -->
<!-- 		<br> -->
<!-- 		<div id="chk"> -->
<!-- 			<form id="join_idcheck.jsp" method="post" name="wfr"> -->
<%-- 				<input type="text" name="userid" value="<%=id%>">  --%>
<!-- 				<input type="submit" value="중복확인"> -->
			
<!-- 			<div id="msg"></div> -->
<!-- 			<br> <input id="cancelBtn" type="button" value="취소" -->
<!-- 				onclick="window.close()"><br> <input id="useBtn" -->
<!-- 				type="button" value="사용하기" onclick="sendCheckValue()"> -->
<!-- 			</form> -->
<!-- 		</div> -->
<!-- 	</div> -->


</body>
</html>