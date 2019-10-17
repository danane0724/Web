<%@page import="member.MemberBean"%>
<%@page import="member.MemberDAO"%>
<%@page import="member.ZipcodeBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");

	String check = request.getParameter("check");
	String code = request.getParameter("area3");
	MemberDAO mdao = new MemberDAO();
	ArrayList<ZipcodeBean> list = mdao.zipcodeRead(code);
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>우편번호 검색</title>

</head>

<script type="text/javascript">
	window.onload = function() {

		document.getElementById("btnZipFind").onclick = dongCheck;

		document.getElementById("btnZipClose").onclick = function() {

			window.close();

		};

	}

	function dongCheck() {

		if (zipForm.area3.value === "") {

			alert("검색할 동(리) 이름 입력!");

			zipForm.area3.focus();

			return;

		}

		zipForm.submit();

	}

	function send(zipcode, area1, area2, area3, area4) {

		opener.document.fr.zipcode.value = zipcode;

		opener.document.fr.address.value = area1 + " " + area2 + " "
				+ area3 + " " + area4;

		//opener은 부모

		window.close();

	}
</script>

<body>

	<b> *** 우편번호 찾기 *** </b>

	<form action="check_zip.jsp" name="zipForm" method="post">

		<table>

			<tr>

				<td>동(리) 이름 입력 : <input type="text" name="area3" size="25" /> <input
					type="button" value="검색" id="btnZipFind" /> <input type="button"
					value="닫기" id="btnZipClose" /> <input type="hidden" name="check"
					value="n" />

				</td>

			</tr>

		</table>

	</form>

	<%
		if (check.equals("n")) {

			if (list.isEmpty()) {
	%>

	<b> 검색 결과가 없습니다</b>

	<%
		} else {
	%>

	<table>

		<tr>

			<td>검색 자료를 클릭하면 자동으로 주소가 입력됩니다.</td>

		</tr>

		<tr>

			<td>
				<%
					for (ZipcodeBean bean : list) {

								String zipcode = bean.getZipcode();

								String area1 = bean.getArea1();

								String area2 = bean.getArea2();

								String area3 = bean.getArea3();

								String area4 = bean.getArea4();
				%> <a
				href="javascript:send('<%=zipcode%>','<%=area1%>','<%=area2%>','<%=area3%>','<%=area4%>')">

					<%=zipcode%> <%=area1%> <%=area2%> <%=area3%> <%=area4%>

			</a> <br /> <%
 	}
 %>

			</td>

		</tr>

	</table>

	<%
		}

		}
	%>
</body>

</html>

