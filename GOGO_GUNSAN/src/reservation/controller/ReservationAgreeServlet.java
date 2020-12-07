package reservation.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reservation.model.service.ReservationService;
import reservation.model.vo.Reservation;
import tour_info.model.service.TourInfoService;
import tour_info.model.vo.TourInfo;

/**
 * Servlet implementation class ReservationAgreeServlet
 */
@WebServlet("/reservation/reservationAgree")
public class ReservationAgreeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationAgreeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		  String date = request.getParameter("date");
		  String tourInfoId = request.getParameter("tourInfoId");
		  int adultAmount = Integer.parseInt(request.getParameter("adultValue"));
		  int childAmount = Integer.parseInt(request.getParameter("childValue"));
		  String timeChk = request.getParameter("timeCheck");
//		  Date selectedDate = null;
//		  selectedDate = Date.valueOf(date);
//		  System.out.println("selectedDate"+selectedDate);

		  String tourDateTime = date+"-"+timeChk;
		  TourInfo tourInfo = new TourInfoService().selectOne(tourInfoId);
		  int totalPrice = adultAmount*Integer.parseInt(tourInfo.getAdultPrice())+childAmount*Integer.parseInt(tourInfo.getChildPrice());
		  
		  Reservation reservation = new Reservation(null, tourInfoId, null, null, adultAmount, childAmount, Integer.toString(totalPrice), tourDateTime,null, null);

		  
		  
		  request.setAttribute("tourInfoName", tourInfo.getTourInfoName());
		  request.setAttribute("reservation", reservation);
	
		  request.getRequestDispatcher("/WEB-INF/views/reservation/reservationAgree.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
