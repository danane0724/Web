<%@page import="member.MemberBean"%>
<%@page import="member.MemberDAO"%>
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
<title>updatePro (19.08.12)</title>
</head>
<body>
<h1>updatePro (19.08.12)</h1>
<%
// 한글처리
request.setCharacterEncoding("utf-8");
// id, pass, name 파라미터 가져오기
String id = request.getParameter("id");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
String email = request.getParameter("email");
String address = request.getParameter("address");
String phone = request.getParameter("phone");
String mobile = request.getParameter("mobile");

// MemberDAO 객체 생성
MemberDAO mdao = new MemberDAO();


// int check = userCheck(id, pass) // loginPro에 만들어있는걸 불러와서 쓰면됨
int check = mdao.userCheck(id, pass);

		// check == 1 이면 수정작업
 		if(check == 1)    // 수정 작업
        { 
			// => MemberBean mb 객체 생성 , 멤버변수  저장
            MemberBean mb = new MemberBean();
			mb.setId(id);
			mb.setPass(pass);
			mb.setName(name);
			mb.setEmail(email);
			mb.setAddress(address);
			mb.setPhone(phone);
			mb.setMobile(mobile);
			// => updateMember(mb) 호출
			// (mb) 로 한번에 묶어서 호출(id,pass,name 외 추가로 더 늘어날수있기에)
			mdao.updateMember(mb);
            
            // 이동 main.jsp 
            response.sendRedirect("../main/main.jsp");
        }
		// check == 0 이면 "비밀번호 틀림"
        else if(check == 0) // check == 0 "비밀번호 틀림"		
        {
        %>	
		<script>
		alert("비밀번호틀림");
		history.back(); // 뒤로 이동
		</script>
		<%
		// check == -1 이면 "아이디 없음"
		}else {
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



