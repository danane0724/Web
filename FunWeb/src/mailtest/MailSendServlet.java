package mailtest;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MailSendServlet
 */
@WebServlet("/MailSendServlet")
public class MailSendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MailSendServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		
		request.setCharacterEncoding("utf-8");
		String sender = request.getParameter("sender"); // 62~65 클라이언트 페이지에서 메일 전송에 사용되기 위해서
		String receiver = request.getParameter("receiver"); // 전송되어온 파라미터 값들을 받는 부분이다
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		try {
			request.setCharacterEncoding("utf-8");
			Properties properties = System.getProperties(); // 서버 정보를 Properties 객체에 저장한다
			properties.put("mail.smtp.starttls.enable", "true"); // Starttls Command를 사용할 수 있게 설정하는 부분
			properties.put("mail.smtp.host", "smtp.gmail.com");  // SMTP 서버를 지정하는 부분
			properties.put("mail.smtp.auth", "true"); // AUTH command를 사용하여 사용자 인증을 할 수 있게 하는 설정하는 부분
			properties.put("mail.smtp.port", "587"); // gmail 포트 (서버 포트를 지정하는 부분)
			Authenticator auth = new GoogleAuthentication(); // 인증 정보를 생성하는 부분
			Session s = Session.getDefaultInstance(properties, auth); // 메일을 전송하는 역활을 하는 단위인 Session 객체 생성
			Message message = new MimeMessage(s); // 생성한 Session 객체를 사용하여 전송할 Message 객체를 생성하는 부분이다
			Address sender_Address = new InternetAddress(sender); // 메일을 송신할 송신 주소를 생성하는 부분
			Address receiver_address = new InternetAddress(receiver); // 메일을 수신할 수신 주소를 생성하는 부분
			message.setHeader("content-type", "text/html;charset=UTF-8"); // 71~76 메일 전송에 필요한 값들을 설정
			message.setFrom(sender_Address);
			message.addRecipient(Message.RecipientType.TO, receiver_address);
			message.setSubject(subject);
			message.setContent(content, "text/html;charset=UTF-8");
			message.setSentDate(new java.util.Date());
			Transport.send(message); // 메시지를 메일로 전송하는 부분이다.
			out.println("메일이 정상적으로 전송되었습니다");
			
			
			
		} catch (Exception e) {
			out.println("SMTP 서버가 잘못 설정되었거나 서비스에 문제가 있습니다.");
			e.printStackTrace();
		}
				
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
