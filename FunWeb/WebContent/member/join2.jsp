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
 
  <script type="text/javascript">
 	function idcheck() {
		// 아이디 상자가 비어있으면  "아이디입력하세요" 포커스 함수호출한곳으로 되돌아가기
		// 창열기 "join_idcheck.jsp","","width=, height="
		
		if(document.fr.id.value=="") {
			alert("아이디를 입력하세요");
			document.fr.id.focus();
			return;
		} 
		// 창열기 "join_idcheck.jsp", "","width=, height="
		var fid = document.fr.id.value;
		window.open("join_idcheck.jsp?userid="+fid,
	            "chkForm", "width=500, height=300, resizable = no, scrollbars = no");  
	}
 	
 // 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
    function checkValue()
    {
        if(document.fr.id.value==""){
            alert("아이디를 입력하세요.");
            return false;
        }
        
        if(document.fr.pass.value==""){
            alert("비밀번호를 입력하세요.");
            return false;
        }
        
        // 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
        if(document.fr.pass.value != document.fr.pass2.value ){
            alert("비밀번호를 동일하게 입력하세요.");
            return false;
        }
        if(document.fr.name.value==""){
            alert("이름을 입력하세요.");
            return false;
        }
        if(document.fr.email.value==""){
            alert("메일주소를 입력하세요.");
            return false;
        }
    }
 
    </script>
 
    <script src="../js/script.js"></script>
    <script type="text/javascript">
    window.onload = function(){
    	document.getElementById("btnZip").onclick = checkzip;
    }
   

 </script>
 	
 
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp" />
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 본문메인이미지 -->
<div id="sub_img_member"></div>
<!-- 본문메인이미지 -->
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="#">Join us</a></li>
<li><a href="#">Privacy policy</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 본문내용 -->
<article>
<h1>Join Us</h1>
<form action="joinPro.jsp" id="join" name="fr" method="post" onsubmit="return checkValue()">
<fieldset>
<legend>필수 입력 사항</legend>
<label>User ID</label>
<input type="text" name="id" class="id">
<input type="button" value="ID 중복확인" class="dup" onclick="idcheck()"><br>
<label>Password</label>
<input type="password" name="pass"><br>
<label>Retype Password</label>
<input type="password" name="pass2"><br>
<label>Name</label>
<input type="text" name="name"><br>
<label>E-Mail</label>
<input type="email" name="email"><br>
<!-- <label>Retype E-Mail</label> -->
<!-- <input type="email" name="email2"><br> -->
</fieldset>

<fieldset>
<legend>Optional</legend>
<label>우편번호</label>
<input type="text" name="zipcode" size="7"> 
<input type="button" value="우편번호찾기" id="btnZip" class="dup"><br>
<label>주소</label>
<input type="text" name="address" size="30"><br>
<label>Phone Number</label>
<input type="text" name="phone" size="30"><br>
<label>Mobile Phone Number</label>
<input type="text" name="mobile" size="30"><br>
</fieldset>
<div class="clear"></div>
<div id="buttons">
<input type="submit" value="Submit" class="submit">
<input type="reset" value="Cancel" class="cancel">
</div>
</form>
</article>
<!-- 본문내용 -->
<!-- 본문들어가는 곳 -->

<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<footer>
<hr>
<div id="copy">All contents Copyright 2011 FunWeb 2011 FunWeb 
Inc. all rights reserved<br>
Contact mail:funweb@funwebbiz.com Tel +82 64 123 4315
Fax +82 64 123 4321</div>
<div id="social"><img src="../images/facebook.gif" width="33" 
height="33" alt="Facebook">
<img src="../images/twitter.gif" width="34" height="34"
alt="Twitter"></div>
</footer>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>