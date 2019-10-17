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
 <script src="../script/jquery-3.4.1.js"></script>
 <script type="text/javascript">
 	$(document).ready(function(){
 		// 폼제어
 		$('#join').submit(function(){
 			var id=$('.id').val();
 			if(id==""){
 				alert("아이디입력하세요!!");
 				$('.id').focus();
 				return false;
 			}
 			
 		});
 		
 		// 아이디 중복 체크
 		$('.dup').click(function(){
 			$.ajax('join_idcheck2.jsp',{
 				data:{id:$('.id').val()},
 				success:function(sdata){
 					$('#ch').html(sdata);
 				}
 			});
 		});
 		
 		
 		
 	});

 	function idcheck() {
		// 아이디 상자가 비어있으면  "아이디입력하세요" 포커스 함수호출한곳으로 되돌아가기
		if(document.fr.id.value==""){
			alert("아이디입력하세요");
			document.fr.id.focus();
			return;
		}
		// 창열기 "join_idcheck.jsp","","width=, height="
		var fid=document.fr.id.value;
		window.open("join_idcheck.jsp?userid="+fid,"","width=300, height=200");
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
<form action="joinPro.jsp" id="join" name="fr" method="post">
<fieldset>
<legend>Basic Info</legend>
<label>User ID</label>
<input type="text" name="id" class="id">
<!-- onclick="idcheck()" -->
<input type="button" value="dup. check" class="dup">
<div id="ch"></div>
<br>
<label>Password</label>
<input type="password" name="pass"><br>
<label>Retype Password</label>
<input type="password" name="pass2"><br>
<label>Name</label>
<input type="text" name="name"><br>
<label>E-Mail</label>
<input type="email" name="email"><br>
<label>Retype E-Mail</label>
<input type="email" name="email2"><br>
</fieldset>

<fieldset>
<legend>Optional</legend>
<label>성별</label>
<input type="radio" name="gender" id="gender_man" value="남">남
<input type="radio" name="gender" id="gender_woman" value="여">여
<br><br>
<label>연령</label>
<select name="age" id="age">
	<option value="">선택해주세요</option>
	<option value="10대">10대</option>
	<option value="20대">20대</option>
</select>
<br><br>
<label>Address</label>
<input type="text" name="address"><br>
<label>Phone Number</label>
<input type="text" name="phone"><br>
<label>Mobile Phone Number</label>
<input type="text" name="mobile"><br>
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
<jsp:include page="../inc/bottom.jsp" />
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>
