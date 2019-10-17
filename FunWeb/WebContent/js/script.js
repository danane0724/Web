
/************************  register_form.jsp ************************/

//regform id 중복확인
function checkid() {
	if(regForm.id.value == "") {
		alert("id를 입력하시오.");
		regForm.id.focus();
	} else {
		url = "check_id.jsp?id=" + regForm.id.value;
		// 두 번째 파라미터는 메소드 전송방식이 아니고 타이틀
		window.open(
				url, 
				"id check", "toolbar=no, width=350, height=150, top=150, left=150");
	}
}

//우편번호찾기 새창열기
function checkzip() {
	//새창열기
	url = "check_zip.jsp?check=y";
	window.open(
			url, 
			"post", 
			"toolbar=no, width=350,height=300,top=200,left=300.status=yes,scrollbars=yes,menubar=no");
}


//회원가입 입력검사
function inputCheck(){
	if(regForm.id.value == "") {
		alert("id를 입력하시오.");
		regForm.id.focus();
		return;
	} 
	
	if(regForm.pass.value == "") {
		alert("passwd를 입력하시오.");
		regForm.passwd.focus();
		return;
	}
	
	if(regForm.pass.value !== regForm.repass.value) {
		alert("비밀번호 불일치!");
		regForm.passwd.focus();
		return;
	} 
	// 이름, 이메일, 전화번호 - 정규표현식
	if(regForm.job.value === "0") {
		alert("직업을 선택하시오.");
		regForm.job.focus();
		return;
	}
	regForm.submit();
}