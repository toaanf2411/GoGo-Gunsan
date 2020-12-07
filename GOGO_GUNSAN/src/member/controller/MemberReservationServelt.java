package member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import member.model.service.MemberService;
import member.model.vo.Member;
import reservation.model.vo.ReservationView;

/**
 * Servlet implementation class MemberReservationServelt
 */
@WebServlet("/member/memberReservation")
public class MemberReservationServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberReservationServelt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//로그인한 세션 불러오기
		HttpSession session = request.getSession(false);
		Member memberLoggedIn = (Member)session.getAttribute("memberLoggedIn");
		//로그인한 회원 예약 테이블 불러오기
		List<ReservationView> list = new MemberService().selectReservation(memberLoggedIn.getMemberNo());
		System.out.println(list.toString());
		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/views/member/memberReservation.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
