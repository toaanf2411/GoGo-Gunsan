package member.controller;


import java.io.IOException;
import java.sql.Date;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import member.model.service.MemberService;
import member.model.vo.Member;


/**
 * Servlet implementation class passwordFindServlet
 */
@WebServlet("/member/passwordFind")
public class PasswordFindServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PasswordFindServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 인코딩
		request.setCharacterEncoding("utf-8");

		
		//2. 파라미터 생성
		String fpEmail = request.getParameter("findPassword-email");
		String fpName = request.getParameter("findPassword-name");
		String fpPhone = request.getParameter("findPassword-phone");
		String fpBirthday = request.getParameter("findPassword-birthday");
		
		Member m = new MemberService().passwordFind(fpEmail);
		String msg = "";
		String loc = "/";
		
		//뷰단에서 파라미터로 생일날짜를 받아올때 Date형으로 형변환
		Date birthday_ = null;
		if(!"".equals(fpBirthday)) birthday_ = Date.valueOf(fpBirthday);
		
		//3. 업무로직
		
		if(m != null) {
			
			if(fpEmail.equals(m.getMemberEmail())
					&&fpName.equals(m.getMemberName())
						&&fpPhone.equals(m.getPhone())
							&&birthday_.equals(m.getBirthDay())) {
				msg = m.getMemberName()+"님의 비밀번호는 "+m.getPassword()+"입니다!";
			}
			else {
				msg = "아아디, 이름, 연락처, 생년월일을 다시 확인해주시기 바랍니다";;
			}
			
		}//회원정보가 없는 경우
		else {
			msg = "회원정보가 없습니다. 회원가입부터 해주시길 바랍니다.";
		}
		
		gmailSend(m);
		
		//4. view단 처리
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		
		request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp")
			   .forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	 public static void gmailSend(Member m) {
	        String user = m.getMemberEmail(); // 네이버일 경우 네이버 계정, gmail경우 gmail 계정
	        String password = m.getPassword();   // 패스워드
	        // SMTP 서버 정보를 설정한다.
	        Properties prop = new Properties();
	        prop.put("mail.smtp.host", "smtp.gmail.com"); 
	        prop.put("mail.smtp.port", 465); 
	        prop.put("mail.smtp.auth", "true"); 
	        prop.put("mail.smtp.ssl.enable", "true"); 
	        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
	        
	        Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
	            protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication(user, password);
	            }
	        });
	        try {
	            MimeMessage message = new MimeMessage(session);
	            message.setFrom(new InternetAddress(user));
	            //수신자메일주소
	            message.addRecipient(Message.RecipientType.TO, new InternetAddress(m.getMemberEmail())); 
	            // Subject
	            message.setSubject("군산 관광 사이트입니다"); //메일 제목을 입력
	            // Text
	            message.setText(m.getMemberName()+"의 비밀번호는 "+m.getPassword()+"입니다");    //메일 내용을 입력
	            // send the message
	            Transport.send(message); ////전송
	            System.out.println("message sent successfully...");
	        } catch (AddressException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } catch (MessagingException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
	    }


}
