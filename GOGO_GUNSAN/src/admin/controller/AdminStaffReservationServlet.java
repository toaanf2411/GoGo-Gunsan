package admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;
import reservation.model.vo.ReservationView;
import tour_staff.model.service.StaffService;
import tour_staff.model.vo.Staff;

/**
 * Servlet implementation class AdminStaffReservationServlet
 */
@WebServlet("/gogo-admin/adminStaffReservation")
public class AdminStaffReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminStaffReservationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//로그인한 세션 가져오기
		HttpSession session = request.getSession(false);
		Staff memberLoggedIn = (Staff)session.getAttribute("staffLoggedIn");
		System.out.println(memberLoggedIn.getName());
		//로그인한 회원 예약 테이블 불러오기
		List<ReservationView> list = new StaffService().selectReservation(memberLoggedIn.getTourInfoId());
		System.out.println(list.toString());
		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/views/staff/staffReservation.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
