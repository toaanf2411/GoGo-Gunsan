package admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;
import tour_staff.model.service.StaffService;

/**
 * Servlet implementation class AdminMemberDelete
 */
@WebServlet("/gogo-admin/staffDelete")
public class AdminStaffDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminStaffDelete() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String staffEmail = request.getParameter("staffEmail");

		int result = new StaffService().deleteStaff(staffEmail);

		// 4. 받은 결과에 따라 뷰페이지 내보내기
		String view = "/WEB-INF/views/common/msg.jsp";
		String msg = "";
		// javascript/html에서 사용할 url은 contextPath를 포함한다.
		String loc = "/gogo-admin/adminStaffList";

		if (result > 0) {
			msg = "성공적으로 스태프를 삭제했습니다.";
		} else {
			msg = "스태프 삭제에 실패했습니다.";
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
