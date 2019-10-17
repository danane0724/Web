<%@page import="board.BoardBean2"%>
<%@page import="board.BoardDAO2"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardBean"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<!-- top.jsp 폴더 찾아가기 -->
<jsp:include page="../inc/top.jsp" />
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div id="sub_img_center"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="../center/notice.jsp">자유게시판</a></li>
<li><a href="../iboard/inotice.jsp">갤러리게시판</a></li>
<li><a href="../fdownload/notice2.jsp">자료실</a></li>
<li><a href="#">Service Policy</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<%
// 한글처리
request.setCharacterEncoding("utf-8");
//int num =  파라미터 num 가져와서 저장
int num = Integer.parseInt(request.getParameter("num"));
//BoardDAO bdao 객체생성
BoardDAO bdao = new BoardDAO();
//BoardBean bb = getBoard(num)  num에 해당하는 게시판 글 가져오기
BoardBean bb = bdao.getBoard(num);
%>


<!-- 게시판 -->
<article>
<h1>Notice Write</h1>
<form action="fupdatePro.jsp" method="post" enctype="multipart/form-data">
<input type="hidden" name="num" value="<%=num%>">
<table id="notice">
<tr><td>글쓴이</td>
<td><input type="text" name="name" value="<%=bb.getName()%>"></td></tr>
<tr><td>비밀번호</td><td><input type="password" name="pass"></td></tr>
<tr><td>제목</td><td><input type="text" name="subject" value="<%=bb.getSubject()%>"></td></tr>
<tr><td>첨부파일</td><td><input type="file" name="file"></td></tr>
<tr><td>내용</td>
<td><textarea name="content" rows="10" cols="50"><%=bb.getContent() %></textarea></td></tr>
<tr><td colspan="2"><input type="submit" value="게시글 수정"></td></tr>
</table>
<div id="table_search">
<input type="button" value="글목록" class="btn" 
onclick="location.href='notice2.jsp'">
</div>
</form>

<div class="clear"></div>
<div id="page_control">
</div>
</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<!-- bottom.jsp 폴더 찾아가기 -->
<jsp:include page="../inc/bottom.jsp" />
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>