<%@page import="member.MemberDAO"%>
<%@page import="member.MemberBean"%>
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
<title>deletePro (19.08.29)</title>
</head>
<body>
<h1>deletePro (19.08.29)</h1>
<%
//한글처리
request.setCharacterEncoding("utf-8");
//id name 파라미터 값 변수에 저장
String id=request.getParameter("id");
String pass = request.getParameter("pass");

//MemberDAO 객체 생성
MemberDAO md = new MemberDAO();

// int check = userCheck(id, pass) 
// =>loginPro에 만들어있는걸 불러와서 쓰면됨
int check = md.userCheck(id, pass);

	if(check == 1) { // 삭제 작업 - 아이디 일치
		// => MemberBean mb 객체 생성 , 멤버변수 id, pass, name 저장
        MemberBean mb = new MemberBean();
		mb.setId(id);
		mb.setPass(pass);
		
		
		// => deleteMember(mb) 호출
		// (mb) 로 한번에 묶어서 호출(id,pass,name 외 추가로 더 늘어날수있기에)
		md.deleteMember(mb);
		session.invalidate(); // 세션값 초기화 
		%>
		<script type="text/javascript">
		alert("회원정보삭제 완료");
		location.href = "../main/main.jsp";
		</script>
		<%
	}else if(check == 0) {// 비밀번호 일치
		%>
		<script>
		alert("비밀번호틀림");
		 history.back(); // 뒤로 이동
		</script>
		<%
	}else{
	%>
 	<script>
 	alert("아이디없음");
 	history.back(); // 뒤로 이동
 	</script>
	<%
	}
	%>
</body>
</html>
	

			
	
	
	




