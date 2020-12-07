package reservation.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reservation.model.vo.Reservation;
import tour_info.model.service.TourInfoService;
import tour_info.model.vo.TourInfo;

/**
 * Servlet implementation class ReservationPayServlet
 */
@WebServlet("/reservation/reservationPay")
public class ReservationPayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationPayServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
         int adultAmount = Integer.parseInt(request.getParameter("adultAmount"));
         int childAmount = Integer.parseInt(request.getParameter("childAmount"));
         String tourDateTime = request.getParameter("tourDateTime");
         String tourInfoId = request.getParameter("tourInfoId");
         String totalPrice = request.getParameter("totalPrice");
         Reservation reservation = new Reservation(null, tourInfoId, null, null, adultAmount, childAmount, totalPrice, tourDateTime,null,null);
        
         TourInfo tourInfo = new TourInfoService().selectOne(tourInfoId);

         request.setAttribute("tourInfoName",tourInfo.getTourInfoName());
         request.setAttribute("reservation", reservation);
         System.out.println("reservation@Pay="+reservation);
         System.out.println("tourInfoName@Pay="+tourInfo.getTourInfoName());
		request.getRequestDispatcher("/WEB-INF/views/reservation/reservationPay.jsp").forward(request, response);
	}
	


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
