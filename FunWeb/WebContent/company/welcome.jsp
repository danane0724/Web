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
<!-- 헤더가 들어가는 곳 -->
<jsp:include page="../inc/top.jsp"/>
<!-- 헤더가 들어가는 곳 -->

<!-- 본문 들어가는 곳 -->
<!-- 서브페이지 메인이미지 -->
<div id="sub_img"></div>
<!-- 서브페이지 메인이미지 -->
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="#">Welcome</a></li>
<li><a href="#">History</a></li>
<li><a href="#">Newsroom</a></li>
<li><a href="#">Public Policy</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 내용 -->
<article>
<h1>Welcome</h1>
<figure class="ceo"><img src="../images/company/CEO.jpg" width="196" height="226" 
alt="CEO"><figcaption>Fun Web CEO Michael</figcaption>
</figure>
<p>Lorem ipsum ipsum dolor...
tellus Lorem ipsum ipsum dolor...tellus
Lorem ipsum ipsum dolor...tellus
Lorem ipsum ipsum dolor...tellus
Lorem ipsum ipsum dolor...tellus
Lorem ipsum ipsum dolor...tellus
Lorem ipsum ipsum dolor...tellus
Lorem ipsum ipsum dolor...tellus
Lorem ipsum ipsum dolor...tellus
Lorem ipsum ipsum dolor...tellus
Lorem ipsum ipsum dolor...tellus
Lorem ipsum ipsum dolor...tellus
Lorem ipsum ipsum dolor...tellus
Lorem ipsum ipsum dolor...tellus
Lorem ipsum ipsum dolor...tellus
Lorem ipsum ipsum dolor...tellus
Lorem ipsum ipsum dolor...tellus
Lorem ipsum ipsum dolor...tellus
Lorem ipsum ipsum dolor...tellus
Lorem ipsum ipsum dolor...tellus
Lorem ipsum ipsum dolor...tellus
Lorem ipsum ipsum dolor...tellus
Lorem ipsum ipsum dolor...tellus
Lorem ipsum ipsum dolor...tellus
Lorem ipsum ipsum dolor...tellus
Lorem ipsum ipsum dolor...tellus
Lorem ipsum ipsum dolor...tellus
Lorem ipsum ipsum dolor...tellus
Lorem ipsum ipsum dolor...tellus
Lorem ipsum ipsum dolor...tellus
Lorem ipsum ipsum dolor...tellus
Lorem ipsum ipsum dolor...tellus
Lorem ipsum ipsum dolor...tellus
Lorem ipsum ipsum dolor...tellus
Lorem ipsum ipsum dolor...tellus
Lorem ipsum ipsum dolor...tellus
Lorem ipsum ipsum dolor...tellus
Lorem ipsum ipsum dolor...tellus
Lorem ipsum ipsum dolor...tellus
Lorem ipsum ipsum dolor...tellus
Lorem ipsum ipsum dolor...tellus
Lorem ipsum ipsum dolor...tellus
Lorem ipsum ipsum dolor...tellus
Lorem ipsum ipsum dolor...tellus
Lorem ipsum ipsum dolor...tellus
Lorem ipsum ipsum dolor...tellus
Lorem ipsum ipsum dolor...tellus</p>
</article>
<!-- 내용 -->
<!-- 본문 들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터 들어가는 곳 -->

<jsp:include page="../inc/bottom.jsp" />

<!-- <footer> -->
<!-- <hr> -->
<!-- <div id="copy">All contents Copyright 2011 FunWeb 2011 FunWeb  -->
<!-- Inc. all rights reserved<br> -->
<!-- Contact mail:funweb@funwebbiz.com Tel +82 64 123 4315 -->
<!-- Fax +82 64 123 4321</div> -->
<!-- <div id="social"><img src="../images/facebook.gif" width="33"  -->
<!-- height="33" alt="Facebook"> -->
<!-- <img src="../images/twitter.gif" width="34" height="34" -->
<!-- alt="Twitter"></div> -->
<!-- </footer> -->
<!-- 푸터 들어가는 곳 -->
</div>
</body>
</html>



    