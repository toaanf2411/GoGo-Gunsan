package reservation.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.synth.SynthSplitPaneUI;

import reservation.model.service.ReservationService;
import reservation.model.vo.Reservation;
import tour_info.model.service.TourInfoService;
import tour_info.model.vo.TourInfo;
import tour_staff.model.service.StaffService;
import tour_staff.model.vo.Staff;

/**
 * Servlet implementation class ReservationEndServlet
 */
@WebServlet("/reservation/reservationEnd")
public class ReservationEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ReservationEndServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String tourInfoId = request.getParameter("tourInfoId");
		String memberNo = request.getParameter("memberNo");
		int adultAmount = Integer.parseInt(request.getParameter("adultAmount"));
		int childAmount = Integer.parseInt(request.getParameter("childAmount"));
		String totalPrice = request.getParameter("totalPrice");
		String tourDateTime = request.getParameter("tourDateTime");
		String card = request.getParameter("pay-card-val");
		String bank = request.getParameter("pay-bank-val");
		String tourInfoName = request.getParameter("tourInfoName");
	    
		System.out.println("card="+card);
		System.out.println("bank="+bank);
		System.out.println("memberNo="+ memberNo);
		String pay ="";
		
		if("".equals(card)) {
			pay="W";
		}else if("".equals(bank)) {
			pay="C";
		}

		
		
		
		System.out.println("pay");

		String tourStaffNo = new StaffService().selectStaffNo(tourInfoId);
		
		Reservation reservation = new Reservation(null, tourInfoId, tourStaffNo, memberNo, adultAmount, childAmount, totalPrice,
				tourDateTime, null, pay);

		System.out.println("reservation="+reservation);
		int result = new ReservationService().insertReservation(reservation);
		if (result > 0) {
			System.out.println("예약 성공");
			Reservation reserSeq  =  new ReservationService().selectOne(memberNo,tourDateTime,tourInfoId);
			request.setAttribute("reservation", reserSeq);
			request.setAttribute("tourInfoName", tourInfoName);
		} else {
			System.out.println("예약 실패");
			
		}
			
		request.getRequestDispatcher("/WEB-INF/views/reservation/reservationEnd.jsp").forward(request, response);
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
