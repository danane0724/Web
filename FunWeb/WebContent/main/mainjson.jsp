<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//// 1단계 드라이버 불러오기
Class.forName("com.mysql.jdbc.Driver");
//// 2단계 디비연결   jspdb1   jspid    jsppass
Connection con=null;
String dbUrl="jdbc:mysql://localhost:3306/jspdb1";
String dbUser="jspid";
String dbPass="jsppass";
con=DriverManager.getConnection(dbUrl, dbUser, dbPass);
//3단계 - 연결정보를 이용해서 sql구문을 만들고 실행할 객체생성 select
PreparedStatement pstmt=null;
ResultSet rs=null;

String sql="select * from board order by num desc limit 0,5";
pstmt=con.prepareStatement(sql);
//4단계 - 만든 객체 실행   select => 결과 저장 내장객체
rs=pstmt.executeQuery();
//5단계 rs에 저장된 내용을 => 화면에 출력.
JSONArray boardList=new JSONArray();
while(rs.next()){
	// 한사람의 정보 저장
// 	BoardBean bb=new BoardBean();
	JSONObject bb = new JSONObject();
	bb.put("subject", rs.getString("subject"));
	bb.put("date", rs.getString("date"));
	boardList.add(bb);
}	
// 	bb.setNum(rs.getInt("num"));
// 	bb.setName(rs.getString("name"));
// 	bb.setPass(rs.getString("pass"));
// 	bb.setSubject(rs.getString("subject"));
// 	bb.setContent(rs.getString("content"));
// 	bb.setReadcount(rs.getInt("readcount"));
// 	bb.setDate(rs.getDate("date"));
// 	bb.setRe_ref(rs.getInt("re_ref"));
// 	bb.setRe_lev(rs.getInt("re_lev"));
// 	bb.setRe_seq(rs.getInt("re_seq"));

	
	// 배열 한칸에 한개의 글 저장

%>
<%=boardList %>