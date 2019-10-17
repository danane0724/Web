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
// noticeSearch.jsp 작업
// 한글처리
request.setCharacterEncoding("utf-8");
// search 파라미터 가져오기
String search = request.getParameter("search");


// BoardDAO bdao 객체생성
BoardDAO bdao = new BoardDAO();

// 검색어 포함한 게시판 전체 글 갯수 가져오기 select count(*)
int count = bdao.getBoardCount(search);	

// 한 화면에 보여줄 글 갯수 설정
int pageSize=15;
// 현 페이지 가져오기
// http://localhost:8080/FunWeb/center/notice.jsp
// http://localhost:8080/FunWeb/center/notice.jsp?pageNum=3
String pageNum=request.getParameter("pageNum");
// pageNum 이 없으면 pageNum="1" 설정
if(pageNum == null) {
	pageNum = "1";
}
int currentPage=Integer.parseInt(pageNum);
// 시작하는 행번호 구하기 => 식구하기 => 알고리즘
// pageNum(currentPage) pageSize => startRow
//    1                    10    => 0*10+1 => 0+1 => 1
//    2                    10    => 1*10+1 => 10+1 =>11
//    3                    10    => 2*10+1 => 20+1 =>21
int startRow = (currentPage-1)*pageSize+1;

// pageNum pageSize => endRow
//    1       10    =>   10
//    2       10    =>   20
int endRow = currentPage * pageSize;

//  List boardList = getBoardList() 호출
// select * from board order by num desc 첫행, 몇개
// select * from board order by num desc limit 첫행-1 몇개
// List boardList = bdao.getBoardList();
// List boardList = bdao.getBoardList(첫행, 몇개);
List boardList = bdao.getBoardList(startRow,pageSize, search);
// 날짜 형태 변경 => 문자열 변경
SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
%>

<!-- 게시판 -->
<article>
<h1>Notice</h1>
<table id="notice">
<tr><th class="tno">No.</th>
    <th class="ttitle">Title</th>
    <th class="twrite">Writer</th>
    <th class="tdate">Date</th>
    <th class="tread">Read</th></tr>
    <%
    if(count != 0) {
    	for(int i = 0; i < boardList.size(); i++) {
    		// 자자빈 <= 배열한칸 정보
    	BoardBean bb = (BoardBean)boardList.get(i);
    	%>
    	
    <tr onclick="location.href='content.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>'"><td><%=bb.getNum() %></td>
    <td class="left"><%=bb.getSubject() %></td>
    <td><%=bb.getName() %></td>
    <td><%=sdf.format(bb.getDate()) %></td>
    <td><%=bb.getReadcount() %></td></tr>	
    	<%
    	}
    }
    %>
    
</table>

<%
// 세션값 가져오기
String id = (String)session.getAttribute("id");
// 세견값이 있으면 글쓰기 버튼 보이기
if(id != null ) {
	%>
<div id="table_search">
<input type="button" value="글쓰기" class="btn"
onclick="location.href='writeForm.jsp'">
</div>
	<%
}
%>    
<div id="table_search">
<form action="noticeSearch.jsp" method="get">
<input type="text" name="search" class="input_box">
<input type="submit" value="search" class="btn">
</form>
</div>
<div class="clear"></div>
<div id="page_control">
<%
   
// 전체 페이지수 구하기  전체글갯수 50 한화면 글갯수 10 => 전체 페이지수 5+0 => 5
//				  전체글갯수 55 한화면 글갯수 10 => 전체 페이지수 5+1 => 6
int pageCount=count/pageSize + (count % pageSize != 0? 1 : 0);
// 한화면에 보여줄 페이지 갯수 설정
int pageBlock=10;
// 시작하는 페이지 번호 1~10 => 1페이지
// pageNum(currentPage)   pageBlock  =>  startPage
//   1 ~ 10                  10      => ((1~10)/10)*10+1 => 0*10+1 => 0+1 => 1
//   11 ~ 20                 10      => ((1~10)/10)*10+1 => 1*10+1 => 10+1 => 11
//   21 ~ 30                 10      => ((1~10)/10)*10+1 => 2*10+1 => 20+1 => 21
int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;   
// 끝페이지 번호 구하기
// startPage  pageBlock  => endPage
//     1          10     =>   10
//     11         10     =>   20
//     21         10     =>   30
int endPage = startPage + pageBlock -1;
if(endPage > pageCount) {
	endPage = pageCount;
}
// [이전]
if(startPage > pageBlock) { // pageSize 이상이 되어야 [이전] 이 보임
	%><a href="noticeSearch.jsp?pageNum=<%=startPage-pageBlock %>&search=<%=search%>">Prev</a><%
}

for(int i = startPage; i <= endPage; i++) {
	%><a href="noticeSearch.jsp?pageNum=<%=i %>&search=<%=search%>"><%=i %></a> <%
}

// [다음]
if(endPage < pageCount) {
	%><a href="noticeSearch.jsp?pageNum=<%=startPage+pageBlock %>&search=<%=search%>">Next</a><%
}
%>
<!-- 		1 2 3 .... 10 [다음] -->
<!-- [이전]	11 12 13 .... 20	 -->

<!-- <a href="#">Prev</a> -->
<!-- <a href="#">1</a><a href="#">2</a><a href="#">3</a> -->
<!-- <a href="#">4</a><a href="#">5</a><a href="#">6</a> -->
<!-- <a href="#">7</a><a href="#">8</a><a href="#">9</a> -->
<!-- <a href="#">10</a> -->
<!-- <a href="#">Next</a> -->
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