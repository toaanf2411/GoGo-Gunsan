package member.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberUpdateServlet
 */
@WebServlet("/member/MemberUpdate()")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberEmail = request.getParameter("memberEmail");
		String password = request.getParameter("memberPassword");
		String memberName = request.getParameter("memberName");
		String birthday = request.getParameter("birthDay");
		String phone = request.getParameter("phone");
		
		//생일 문자형으로 
		Date birthDay_ = null;
		if(!"".equals(birthday)) birthDay_ = Date.valueOf(birthday);
		
		Member m = new Member();
	    
		m.setMemberEmail(memberEmail);
		m.setPassword(password);
		m.setMemberName(memberName);
		m.setBirthDay(birthDay_);
		m.setPhone(phone);
		
		int result = new MemberService().memberUpdate(m);
		
		String msg="";
		String loc="/member/memberView?memberEmail="+memberEmail;
		
		if(result>0) {
			msg = "성공적으로 회원정보를 수정했습니다.";
			request.getSession().setAttribute("memberLoggedIn", new MemberService().selectOne(memberEmail));
			}else
				msg = "회원정보수정에 실패했습니다.";	
		
		request.setAttribute("msg",msg);
		request.setAttribute("loc",loc);
		request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
