package mailtest;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;


public class GoogleAuthentication extends Authenticator {
	PasswordAuthentication passAuth;
	
	public GoogleAuthentication() {
		// PasswordAuthentication 객체를 생성하는 부분이다
		// 첫 번쨰 인자가 구글 아이디이며 두 번째 인자가 비밀번호 이다
		passAuth = new PasswordAuthentication("danane072400", "yqbhhctxrktqcgkf");
	}
	// Authentication 구현 시 반드시 구현해 주어야 하는 메소드 이다
	public PasswordAuthentication getPasswordAuthentication() {
		return passAuth;
	}
	
}
