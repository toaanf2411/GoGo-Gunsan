package admin.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;
import member.model.vo.Member;

/**
 * Servlet implementation class AdminMemberUpdateEndServlet
 */
@WebServlet("/gogo-admin/memberUpdateEnd")
public class AdminMemberUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminMemberUpdateEndServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1. 전송값 꺼내서 변수에 기록하기.
		// String javax.servlet.ServletRequest.getParameter(String arg0)
		String memberNo = request.getParameter("memberNo");
		String memberEmail = request.getParameter("memberEmail");
		String password_new = request.getParameter("memberPassword");
		String memberName = request.getParameter("memberName");
		String birthDay = request.getParameter("birthDay");
		String phone = request.getParameter("phone");
		String grade = request.getParameter("grade");

		
		Date birthDay_ = null; 
		if (!"".equals(birthDay))
			birthDay_ = Date.valueOf(birthDay);

		Member member = new Member(memberNo, memberEmail, password_new, memberName, birthDay_, phone, null, grade);

		System.out.println("입력한 회원정보 : " + member);

		// 3.서비스로직호출
		int result = new AdminService().updateMember(member);

		// 4. 받은 결과에 따라 뷰페이지 내보내기
		String view = "/WEB-INF/views/common/msg.jsp";
		String msg = "";
		// javascript/html에서 사용할 url은 contextPath를 포함한다.
		String loc = "/gogo-admin/adminMemberList";

		if (result > 0) {
			msg = "성공적으로 회원정보를 수정했습니다.";
		} else {
			msg = "회원정보수정에 실패했습니다.";
		}

		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);

		request.getRequestDispatcher(view).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
