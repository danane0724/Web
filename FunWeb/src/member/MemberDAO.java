package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberDAO {
	// 디비 연결 메서드
	private Connection getConnection() throws Exception {
		Connection con = null;
		// 1단계 드라이버 불러오기
//		D:\workspace_jsp1\FunWeb\WebContent\WEB-INF\lib
//		폴더에 mysql-connector-java-5.1.47.jar 복사 - F5
		Class.forName("com.mysql.jdbc.Driver");
		// 2단계 디비연결 jspdb1 jspid jsppass
		String dbUrl = "jdbc:mysql://localhost:3306/jspdb1";
		String dbUser = "jspid";
		String dbPass = "jsppass";
		con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
		return con;
	}

	// ----- join 메서드 작업 -------------------------------------
	public void insertMember(MemberBean mb) { // 변수값 들어있는 bean 이름
		Connection con = null;
		PreparedStatement pstmt = null;
		// 예외처리
		try {
			// 예외가 발생할 명령(디비연동, 외부파일연동,..)
			// 1단계 드라이버 불러오기// 2단계 디비연결 jspdb1 jspid jsppass
			con = getConnection();
			// 3단계 - 연결정보를 이용해서 sql구문을 만들고 실행할 객체생성
			String sql = "insert into member(id,pass,name,reg_date,email,zipcode,address,phone,mobile) values(?,?,?,?,?,?,?,?,?);";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getId());
			pstmt.setString(2, mb.getPass());
			pstmt.setString(3, mb.getName());
			pstmt.setTimestamp(4,mb.getReg_date());
			pstmt.setString(5, mb.getEmail());
			pstmt.setString(6, mb.getZipcode());
			pstmt.setString(7, mb.getAddress());
			pstmt.setString(8, mb.getPhone());
			pstmt.setString(9, mb.getMobile());
//			pstmt.setTimestamp(4, mb.getReg_date());
			// 4단계 - 만든 객체 실행 insert,update,delete
			pstmt.executeUpdate();
		} catch (Exception e) {
			// 예외를 잡아서 처리
			e.printStackTrace();
		} finally {
			// 예외상관없이 마무리 작업 => 사용한 내장객체 기억장소 정리
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}

		}

	} // join 끝
	
	// ----- loginPro.jsp 작업 ----------------------------------
	// 리턴활형(정수형) userCheck(아이디 받을 변수, 비밀번호 받을 변수)
	public int userCheck(String id, String pass) {
		
		int check = -1;  // 왜 -1 을 할까?
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			// 1단계 드라이버 불러오기// 2단계 디비연결   jspdb1   jspid    jsppass
			con=getConnection();
			//3단계 - 연결정보를 이용해서 sql구문을 만들고 실행할 객체생성 select
//			       디비에 id정보가 있는지 조회(가져오기)
			String sql="select * from member where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,id);
			//4단계 - 만든 객체 실행   select => 결과 저장 내장객체
			rs=pstmt.executeQuery();
			//5단계 - if 첫행으로 이동 데이터 있으면 true "아이디있음"
//			             if 폼 비밀번호 디비비밀번호 비교 맞으면 세션값 생성 main.jsp이동
//			             else  틀리면 "비밀번호틀림"
//			      else  데이터 없으면 false "아이디없음"        
			if(rs.next()){
				//아이디있음
				if(pass.equals(rs.getString("pass"))){
					check=1;// 비밀번호 맞음
				}else{
					check=0;//비밀번호틀림
				}
			}else{
				check=-1;//아이디없음
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			//마무리
			if(rs!=null) try {rs.close();}catch(SQLException ex) {}	
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
			if(con!=null) try {con.close();}catch(SQLException ex) {}
		}
		return check;
	}//----- loginPro.jsp 작업 종료--------------------------------	
	
	// --- idCheckForm.jsp 작업 --------------------------------
	public int duplicateIdCheck(String id)
    {
		int check = -1;  // 왜 -1 을 할까?
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
        
        try {
            
        	con=getConnection();
			//3단계 - 연결정보를 이용해서 sql구문을 만들고 실행할 객체생성 select
//			       디비에 id정보가 있는지 조회(가져오기)
			String sql="select * from member where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,id);
			//4단계 - 만든 객체 실행   select => 결과 저장 내장객체
			rs=pstmt.executeQuery();
        	
            
			if(rs.next()){
				//아이디있음
					check=1;// 비밀번호 맞음
			}else{
				check=-1;//아이디없음
			}
            
        } catch (Exception e) {
        	e.printStackTrace();
        } finally {
        	if(rs!=null) try {rs.close();}catch(SQLException ex) {}	
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
			if(con!=null) try {con.close();}catch(SQLException ex) {}
        }
        return check;
    } // end duplicateIdCheck()
    
	
	// join2.jsp - join_idcheck.jsp 작업
	public int idcheck(String id) {
		
		int check = 0;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			
		con=getConnection();
		//3단계 - 연결정보를 이용해서 sql구문을 만들고 실행할 객체생성 select
//		 디비에 id정보가 있는지 조회(가져오기)
		String sql="select * from member where id=?";
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1,id);
		//4단계 - 만든 객체 실행   select => 결과 저장 내장객체
		rs=pstmt.executeQuery();
		
		if(rs.next()){
			//아이디있음
				check=1; // 아이디있음 "아이디 중복"
			}else{
				check=0; // 아이디없음 "아이디 사용가능"
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs!=null) try {rs.close();}catch(SQLException ex) {}	
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
			if(con!=null) try {con.close();}catch(SQLException ex) {}
		}
			return check;
		
	} // join2.jsp - join_idcheck.jsp 작업 끝
	
	// ----- info.jsp 작업 --------------------------------------
		// MemberBean 리턴  -> getMember(아이디 받을 변수) 
		// 리턴활형(id, pass, name, reg_date)을 MemberBean 에 담아두었으므로 
		// MemberBean리턴   getMember(아이디 받을 변수)
			public MemberBean getMember(String id) {
				MemberBean mb = null; // 선언
				Connection con=null;
				PreparedStatement pstmt=null;
				ResultSet rs=null;
				try {
					//1단계 드라이버 가져오기	//2단계 디비연결
					con=getConnection();
					//3단계 - 연결정보를 이용해서 sql구문을 만들고 실행할 객체생성 select
					String sql="select * from member where id=?";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, id);
					//4단계 - 만든 객체 실행   select => 결과 저장 내장객체
					rs=pstmt.executeQuery();
					//5단계 - 첫행이동 데이터 있으면  MemberBean객체생성 멤버변수에 값저장
					if(rs.next()){
						mb=new MemberBean();
						mb.setId(rs.getString("id"));
						mb.setPass(rs.getString("pass"));
						mb.setName(rs.getString("name"));
						mb.setReg_date(rs.getTimestamp("reg_date"));
						mb.setEmail(rs.getString("email"));
						mb.setAddress(rs.getString("address"));
						mb.setPhone(rs.getString("phone"));
						mb.setMobile(rs.getString("mobile"));
					}
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					//마무리작업
					if(rs!=null) try {rs.close();}catch(SQLException ex) {}	
					if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
					if(con!=null) try {con.close();}catch(SQLException ex) {}			
				}
				return mb;
			} // info.jsp 작업 종료 ----------------------------------------
			
			
	
	// ----- updatePro.jsp 작업 ---------------------------------		
			// 아이디 & 비밀번호 비교는 loginPro 작업에서 진행 하였기에 
			// loginPro에 만들어진 int check = userCheck(id, pass) 불러다 쓰면 됨
			
			// => updateMember(mb) 호출
			public void updateMember(MemberBean mb) {
				Connection con=null;
				PreparedStatement pstmt=null;
				ResultSet rs=null;
				try {
					// 1단계 드라이버 불러오기// 2단계 디비연결   jspdb1   jspid    jsppass
					con=getConnection();
					// 3단계 sql update
					String sql="update member set name=?, email=?, address=?, phone=?, mobile=? where id=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, mb.getName());
//					pstmt.setTimestamp(4,mb.getReg_date());
					pstmt.setString(2, mb.getEmail());
					pstmt.setString(3, mb.getAddress());
					pstmt.setString(4, mb.getPhone());
					pstmt.setString(5, mb.getMobile());
					pstmt.setString(6, mb.getId());
					// 4단계 실행
					pstmt.executeUpdate();
					
				} catch (Exception e) {
					e.printStackTrace();
					
				}finally {
					// 마무리 기억장소 닫기
					if(rs!=null) try {rs.close();}catch(SQLException ex) {}	
					if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
					if(con!=null) try {con.close();}catch(SQLException ex) {}
				}
				
			} // ----- updatePro.jsp 종료 ----------------------------
			
			// ----- deletePro.jsp 작업 -----
			public void deleteMember(MemberBean mb) {
				Connection con=null;
				PreparedStatement pstmt=null;
				ResultSet rs=null;
				try {
					// 1단계 드라이버 불러오기// 2단계 디비연결   jspdb1   jspid    jsppass
					con=getConnection();
					//3단계 - 연결정보를 이용해서 sql구문을 만들고 실행할 객체생성 select
					//디비에 id정보가 있는지 조회(가져오기)
					String sql="delete from member where id = ?";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1,mb.getId());
					//4단계 - 만든 객체 실행   select => 결과 저장 내장객체
					pstmt.executeUpdate();
					
				} catch (Exception e) {
					
					e.printStackTrace();
					
				}finally {
					// 마무리 기억장소 닫기
					if(rs!=null) try {rs.close();}catch(SQLException ex) {}	
					if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
					if(con!=null) try {con.close();}catch(SQLException ex) {}
				}
			} // ----- deletePro.jsp 작업 종료 -------------------------
	
			public ArrayList<ZipcodeBean> zipcodeRead(String area3){
				Connection con=null;
				PreparedStatement pstmt=null;
				ResultSet rs=null;
				
				ArrayList<ZipcodeBean> list = new ArrayList<ZipcodeBean>();
				System.out.println(area3);
				try {

					con=getConnection();
					String sql = "select * from zipcode where area3 like ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, "%"+area3+"%");
					rs = pstmt.executeQuery();
					while(rs.next()){
						ZipcodeBean bean = new ZipcodeBean();
						bean.setZipcode(rs.getString("zipcode"));
						bean.setArea1(rs.getString("area1"));
						bean.setArea2(rs.getString("area2"));
						bean.setArea3(rs.getString("area3"));
						bean.setArea4(rs.getString("area4"));
						list.add(bean);

					}

				} catch (Exception e) {
					System.out.println("zipcodeRead err : " + e);
				} finally {
					try {
						if(rs!=null)rs.close();
						if(pstmt!=null)pstmt.close();
						if(con!=null)con.close();
					} catch (Exception e2) {
						// TODO: handle exception
					}
				}

				return list;
			}


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
