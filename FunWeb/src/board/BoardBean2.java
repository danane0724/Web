package board;

import java.sql.Date;
import java.sql.Timestamp;

public class BoardBean2 {
	// 멤버변수(데이터값 저장) writeForm에 있는 변수값 저장, fwrite
		private int num;
		private String name;
		private String pass;
		private String subject;
		private String content;
		private int readcount;
		private Date date;
		private String file;
		
		
		// 메서드 Getter/Setter 이용하여 변수값 저장
		// 자동완성 Alt + Shift + s => r
		
		public int getNum() {
			return num;
		}
		public void setNum(int num) {
			this.num = num;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getPass() {
			return pass;
		}
		public void setPass(String pass) {
			this.pass = pass;
		}
		public String getSubject() {
			return subject;
		}
		public void setSubject(String subject) {
			this.subject = subject;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public int getReadcount() {
			return readcount;
		}
		public void setReadcount(int readcount) {
			this.readcount = readcount;
		}
		public Date getDate() {
			return date;
		}
		public void setDate(Date date) {
			this.date = date;
		}
		public String getFile() {
			return file;
		}
		public void setFile(String file) {
			this.file = file;
		}
		
		
		
		
}
