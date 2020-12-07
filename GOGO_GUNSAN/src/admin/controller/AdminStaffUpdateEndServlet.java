package admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tour_staff.model.service.StaffService;
import tour_staff.model.vo.Staff;

/**
 * Servlet implementation class AdminMemberUpdateEndServlet
 */
@WebServlet("/gogo-admin/staffUpdateEnd")
public class AdminStaffUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminStaffUpdateEndServlet() {
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
		String staffNo = request.getParameter("staffNo");
		String staffEmail = request.getParameter("staffEmail");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String tourInfoId = request.getParameter("tourInfoId");

		Staff staff = new Staff(staffNo, staffEmail, password, name, phone, null, tourInfoId);
		
		System.out.println("입력한 스태프 정보 : " + staff);

		// 3.서비스로직호출
		int result = new StaffService().updateStaff(staff);

		// 4. 받은 결과에 따라 뷰페이지 내보내기
		String view = "/WEB-INF/views/common/msg.jsp";
		String msg = "";
		// javascript/html에서 사용할 url은 contextPath를 포함한다.
		String loc = "/gogo-admin/adminStaffList";

		if (result > 0) {
			msg = "성공적으로 스태프 정보를 수정했습니다.";
		} else {
			msg = "스태프 수정에 실패했습니다.";
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
