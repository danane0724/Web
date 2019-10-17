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
<!-- member/loginPro.jsp(19.09.02) -->
<%
// 한글처리
request.setCharacterEncoding("utf-8");
// 파라미터 가져오기
String id=request.getParameter("id");
String pass=request.getParameter("pass");
//로그인 인증(폼아이디,비밀번호 / 디비아이디,비밀번호 일치 확인
//=>일치하면 권한부여/페이지 상관없이 값을 저장사용)

// MemberDAO mdao 객체 생성
MemberDAO mdao = new MemberDAO();

// int check = userCheck(id,pass) 메서드 호출
int check = mdao.userCheck(id, pass);

// check == 1 세션값 생성 "id",id maim.jsp 이동
// check == 0 "비밀번호틀림" 뒤로이동
// check == -1 "아이디없음" 뒤로이동
	    if(check == 1)    // 로그인 성공
        { 
            // 세션에 현재 아이디 세팅
            session.setAttribute("id", id);
            // 이동 main.jsp 
            response.sendRedirect("../main/main.jsp");
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
       		 alert("아이디없음");
       	 	 history.back(); // 뒤로 이동
       	 	 </script>
       	 	 <%
        }
%>
</body>
</html>