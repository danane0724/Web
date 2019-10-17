package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import member.MemberBean;
// 2019 09.03 board 작업
public class BoardDAO3 {
	//디비 연결 메서드
	private Connection getConnection() throws Exception{
//		Connection con=null;
//		// 1단계 드라이버 불러오기
////		D:\workspace_jsp1\FunWeb\WebContent\WEB-INF\lib
////		폴더에 mysql-connector-java-5.1.47.jar 복사 - F5
//		Class.forName("com.mysql.jdbc.Driver");
//		// 2단계 디비연결   jspdb1   jspid    jsppass
//		String dbUrl="jdbc:mysql://localhost:3306/jspdb1";
//		String dbUser="jspid";
//		String dbPass="jsppass";
//		con=DriverManager.getConnection(dbUrl, dbUser, dbPass);
//		return con; 
		
		Connection con=null;
		// 1단계 드라이버 불러오기, 2단계 디비 연결 자원의 이름 저장
		Context init=new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/Mysql");
		con=ds.getConnection();
		return con; 
	} // 디비 연결 메서드 끝 ---------------------------------
	
	// writePro & fwritePro-------------------------------------
	public void insertBoard(BoardBean3 bb) { // 변수값 들어있는 bean 이름
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		// 예외처리
		try {
			// 예외가 발생할 명령(디비연동, 외부파일연동,..)
			// 1단계 드라이버 불러오기// 2단계 디비연결   jspdb1   jspid    jsppass
			con=getConnection(); // 1~2단계 메서드 호출
			
			// num 글번호 구하기
			int num = 0;
			String sql = "select max(num) from iboard"; 
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				num =  rs.getInt("max(num)")+1;
			}
			
			// 3단계 - 연결정보를 이용해서 sql구문을 만들고 실행할 객체생성
			sql = "insert into iboard(num, name, pass, subject, content, readcount, date, file) value(? ,?, ?, ?, ?, ?, now(), ?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);  // num 은 첫 시작이 1이므로 임의의값을 1넣어줌
			pstmt.setString(2, bb.getName());
			pstmt.setString(3, bb.getPass());
			pstmt.setString(4, bb.getSubject());
			pstmt.setString(5, bb.getContent());
			pstmt.setInt(6, 0); // readcount 조회수는 첫 시작이 0
			pstmt.setString(7, bb.getFile());
			// 4단계 - 만든 객체 실행   insert,update,delete 
			pstmt.executeUpdate();
		} catch (Exception e) {
			// 예외를 잡아서 처리 
			e.printStackTrace();
		}finally {
			// 예외상관없이 마무리 작업 => 사용한 내장객체 기억장소 정리
			if(rs!=null) try {rs.close();}catch(SQLException ex) {}	
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
			if(con!=null) try {con.close();}catch(SQLException ex) {}
			
		}
		
	} // writePro 끝-------------------------------------
		
	// ----- list.jsp 작업 -------------------------------------
	// getBoardList();
	public List getBoardList(int startRow, int pageSize) {
			List boardList = new ArrayList();
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			
		try {
			// 1단계 드라이버 불러오기// 2단계 디비연결   jspdb1   jspid    jsppass
			con=getConnection();
			//3단계 - 연결정보를 이용해서 sql구문을 만들고 실행할 객체생성 select
			String sql="select * from iboard Order by num desc limit ?,?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,startRow-1);
			pstmt.setInt(2, pageSize);
			//4단계 - 만든 객체 실행   select => 결과 저장 내장객체
			rs=pstmt.executeQuery();
			//5단계 rs에 저장된 내용을 => 화면에 출력.
			while(rs.next()){
				// 한사람의 정보 저장
				BoardBean3 bb=new BoardBean3();

				bb.setNum(rs.getInt("num"));
				bb.setName(rs.getString("name"));
				bb.setPass(rs.getString("pass"));
				bb.setSubject(rs.getString("subject"));
				bb.setContent(rs.getString("content"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setDate(rs.getDate("date"));
				bb.setFile(rs.getString("file"));
				
				// 배열 한칸에 한개의 글 저장
				boardList.add(bb);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			//마무리
			// 마무리 기억장소 닫기
			if(rs!=null) try {rs.close();}catch(SQLException ex) {}	
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
			if(con!=null) try {con.close();}catch(SQLException ex) {}
		}
		return boardList;
	}// ----- notice.jsp 작업 끝 -------------------------------------
	
	// ----- notice.jsp 페이지 작업 -------------------------------------
		// getBoardList(int startRow, int pageSize, String search);
		public List getBoardList(int startRow, int pageSize, String search) {
				List boardList = new ArrayList();
				Connection con=null;
				PreparedStatement pstmt=null;
				ResultSet rs=null;
				
				
			try {
				// 1단계 드라이버 불러오기// 2단계 디비연결   jspdb1   jspid    jsppass
				con=getConnection();
				//3단계 - 연결정보를 이용해서 sql구문을 만들고 실행할 객체생성 select
				String sql="select * from iboard where subject like ? Order by num desc limit ?,?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, "%"+search+"%");
				pstmt.setInt(2,startRow-1);
				pstmt.setInt(3, pageSize);
				//4단계 - 만든 객체 실행   select => 결과 저장 내장객체
				rs=pstmt.executeQuery();
				//5단계 rs에 저장된 내용을 => 화면에 출력.
				while(rs.next()){
					// 한사람의 정보 저장
					BoardBean3 bb=new BoardBean3();

					bb.setNum(rs.getInt("num"));
					bb.setName(rs.getString("name"));
					bb.setPass(rs.getString("pass"));
					bb.setSubject(rs.getString("subject"));
					bb.setContent(rs.getString("content"));
					bb.setReadcount(rs.getInt("readcount"));
					bb.setDate(rs.getDate("date"));
					bb.setFile(rs.getString("file"));
					
					// 배열 한칸에 한개의 글 저장
					boardList.add(bb);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				//마무리
				// 마무리 기억장소 닫기
				if(rs!=null) try {rs.close();}catch(SQLException ex) {}	
				if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
				if(con!=null) try {con.close();}catch(SQLException ex) {}
			}
			return boardList;
		}// ----- notice.jsp 페이지 작업 끝 -------------------------------------
	
	// ----- notice.jsp - getBoardCount() 글갯수 메서드 --------------------
	public int getBoardCount() {
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		int count = 0;
		try {
			con=getConnection();
			String sql = "select count(*) from iboard";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()){
				count =  rs.getInt("count(*)");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs!=null) try {rs.close();}catch(SQLException ex) {}	
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
			if(con!=null) try {con.close();}catch(SQLException ex) {}
		}
		return count;
	} // ----- list.jsp - getBoardCount() 메서드  끝--------------------
	
	// ----- notice.jsp - getBoardCount(String search) 글검색 메서드 --------------------
		public int getBoardCount(String search) {
			
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			int count = 0;
			try {
				con=getConnection();
//				String sql = "select count(*) from board where subject like '%검색어%'";
				String sql = "select count(*) from iboard where subject like ?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, "%"+search+"%"); // setString 시 '' 자동으로 생김
				rs=pstmt.executeQuery();
				if(rs.next()){
					count =  rs.getInt("count(*)");
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(rs!=null) try {rs.close();}catch(SQLException ex) {}	
				if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
				if(con!=null) try {con.close();}catch(SQLException ex) {}
			}
			return count;
		} // ----- list.jsp - getBoardCount() 메서드  끝--------------------
	
	
		
	// ----- updateReadcount / content.jsp 작업 -------------------------------------	
		public void updateReadcount(int num) {
			Connection con = null;
			PreparedStatement pstmt=null;
			ResultSet rs = null;
			// 예외처리
			try {
				// 1단계 드라이버 불러오기 ~ 2단계 디비연결   jspdb1   jspid    jsppass
				con=getConnection();
				
				//3단계 sql update 수정 readcount = readcount +1 조건 num = ?  // 조회수 업데이트 구문
				String sql = "update iboard set readcount = readcount +1 where num = ?";		
				//4단계 실행
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				//마무리
				// 마무리 기억장소 닫기
				if(rs!=null) try {rs.close();}catch(SQLException ex) {}	
				if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
				if(con!=null) try {con.close();}catch(SQLException ex) {}
			}
			
		}// ----- updateReadcount / content.jsp 작업  끝-----------------
		
		 // ----- content.jsp 작업 -------------------------------------		
			public BoardBean3 getBoard(int num) {
				BoardBean3 bb=null;
				Connection con = null;
				PreparedStatement pstmt=null;
				ResultSet rs = null;
				try {
					// 1,2
					con=getConnection();
					// 3 sql
				String sql="select * from iboard where num =?";
					pstmt=con.prepareStatement(sql);
					pstmt.setInt(1, num);
					// 4
					rs=pstmt.executeQuery();
					// 5
					if (rs.next()) {
						bb=new BoardBean3();
						bb.setNum(rs.getInt("num"));
						bb.setName(rs.getString("name"));
						bb.setPass(rs.getString("pass"));
						bb.setSubject(rs.getString("subject"));
						bb.setContent(rs.getString("content"));
						bb.setReadcount(rs.getInt("readcount"));
						bb.setDate(rs.getDate("date"));
						bb.setFile(rs.getString("file"));
					}
				} catch (Exception e) {
					
				} finally {
					if(rs!=null) try {rs.close();}catch(SQLException ex) {}	
					if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
					if(con!=null) try {con.close();}catch(SQLException ex) {}
				}
				return bb;
			}	// ----- content.jsp 작업  끝-------------------------------------	
	
			// checkNum / updatePro.jsp 작업 ----------------------------
			public int checkNum(BoardBean3 bb) {
				Connection con=null;
				PreparedStatement pstmt=null;
				ResultSet rs=null;
				
				int check = -1; 
				
				try {
					// 1단계 드라이버 불러오기// 2단계 디비연결   jspdb1   jspid    jsppass
					con=getConnection();
					//3단계 - 연결정보를 이용해서 sql구문을 만들고 실행할 객체생성 select 조건 num=?
					String sql="select * from iboard where num=?";
					pstmt=con.prepareStatement(sql);
					pstmt.setInt(1, bb.getNum());
					//4단계 - 만든 객체 실행   select => 결과 저장 내장객체
					rs=pstmt.executeQuery();
					//5단계 - if 첫행으로 이동 데이터 있으면 true "글있음"
//					             if 폼 비밀번호 디비비밀번호 비교 맞으면  수정 , list.jsp이동
//					             else  틀리면 "비밀번호틀림" 뒤로이동
//					      else  데이터 없으면 false "글없음"  뒤로이동
					if(rs.next()){
						//아이디있음
						if(bb.getPass().equals(rs.getString("pass"))){
							check=1;// 비밀번호 맞음
						}else{
							check=0;//비밀번호틀림
						}
					}else{
						check=-1;//아이디없음
					}
					
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					// 마무리 기억장소 닫기
					if(rs!=null) try {rs.close();}catch(SQLException ex) {}	
					if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
					if(con!=null) try {con.close();}catch(SQLException ex) {}
				}
				return check;
			}// checkNum / updatePro.jsp 작업 ----------------------------
			
			// updatePro.jsp 작업 ----------------------------
			public void updateBoard(BoardBean3 bb) {
				Connection con=null;
				PreparedStatement pstmt=null;
				ResultSet rs=null;
				try {
					// 1단계 드라이버 불러오기// 2단계 디비연결   jspdb1   jspid    jsppass
					con=getConnection();
//			      	조건 일치 하면 수정
					String sql="update iboard set name=?,subject=?,content=?,file=? where num=?";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, bb.getName());
					pstmt.setString(2, bb.getSubject());
					pstmt.setString(3, bb.getContent());
					pstmt.setString(4, bb.getFile());
					pstmt.setInt(5, bb.getNum());
					//4단계 - 만든 객체 실행   insert,update,delete 
					pstmt.executeUpdate();
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					// 마무리 기억장소 닫기
					if(rs!=null) try {rs.close();}catch(SQLException ex) {}	
					if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
					if(con!=null) try {con.close();}catch(SQLException ex) {}
				}
			} // updatePro.jsp 작업 ----------------------------
			
			// deletePro.jsp 작업 ------------------------------
			public void deleteBoard(BoardBean3 bb) {
				Connection con=null;
				PreparedStatement pstmt=null;
				ResultSet rs=null;
				
				int check = -1; 
				
				try {
					// 1단계 드라이버 불러오기// 2단계 디비연결   jspdb1   jspid    jsppass
					con=getConnection();
					//조건 id 일치 하면 이름 수정, 위에 변수와 중복안되게 선언하거나 String을 삭제후 sql로 중복 사용가능
					String sql="delete from iboard where num = ?"; // 번호만 삭제, 이름만 삭제 가능
					pstmt=con.prepareStatement(sql);
					pstmt.setInt(1, bb.getNum());
					pstmt.executeUpdate();
					//3단계 - 연결정보를 이용해서 sql구문을 만들고 실행할 객체생성 select 조건 num=?
					//5단계 - if 첫행으로 이동 데이터 있으면 true "아이디있음"
					//if 폼 비밀번호 디비비밀번호 비교 맞으면 수정 list.jsp이동
					//else  틀리면 "비밀번호틀림"
					//else  데이터 없으면 false "아이디없음" loginForm.jsp 이동
					if(rs.next()){
						//아이디있음
						if(bb.getPass().equals(rs.getString("pass"))){
							check=1;// 비밀번호 맞음
						}else{
							check=0;//비밀번호틀림
						}
					}else{
						check=-1;//아이디없음
					}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					// 마무리 기억장소 닫기
					if(rs!=null) try {rs.close();}catch(SQLException ex) {}	
					if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
					if(con!=null) try {con.close();}catch(SQLException ex) {}
				}
				
			}// deletePro.jsp 작업  끝------------------------------

			
//			public void insertReply(BoardBean2 bb) {
//				Connection con=null;
//				PreparedStatement pstmt=null;
//				ResultSet rs=null;
//				
//				try {
//					con=getConnection();
//					
//					String sql = "INSERT INTO board(num, name, pass, subject, content, readcount, date, indent, step) values(?,?,?,?,?,?, now(),?,?)";
//					pstmt=con.prepareStatement(sql);
//					pstmt.setInt(1, num);  // num 은 첫 시작이 1이므로 임의의값을 1넣어줌
//					pstmt.setString(2, bb.getName());
//					pstmt.setString(3, bb.getPass());
//					pstmt.setString(4, bb.getSubject());
//					pstmt.setString(5, bb.getContent());
//					pstmt.setInt(6, 0); // readcount 조회수는 첫 시작이 0
//					pstmt.setInt(8, bb.getIndent());
//					pstmt.setInt(9, bb.getStep());
//					// 4단계 - 만든 객체 실행   insert,update,delete 
//					pstmt.executeUpdate();
//					
//					
//				}catch(Exception e) {
//					e.printStackTrace();
//				}finally {
//					if(rs!=null) try {rs.close();}catch(SQLException ex) {}	
//					if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
//					if(con!=null) try {con.close();}catch(SQLException ex) {}
//				}
//			}
			
} // END
	
	
	
	
	
	
	
	
	
	
	
	

