package reservation.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reservation.model.service.ReservationService;
import time.model.service.TourTimeService;
import time.model.vo.TourTime;
import tour_info.model.service.TourInfoService;
import tour_info.model.vo.TourInfo;

/**
 * Servlet implementation class ReservationGoServlet
 */
@WebServlet("/reservation/reservationGo")
public class ReservationGoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationGoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*사용자가 선택한 관광지의 아이디 값 불러오기 */
		String tourInfoId = request.getParameter("tour_id");

		/*선택한 관광지 정보 불러오기*/
		TourInfo tourInfo = new TourInfoService().selectOne(tourInfoId);
		
		/*선택한  관광지의 티켓 수량과 회차시간 불러오기*/
		TourTime tourTime = new TourTimeService().selectOne(tourInfoId); 

		/*해당 관광지의 예약된 티켓의 예약시간과 날짜  불러오기*/
		List<String> tourDateTimeList = new ReservationService().selectTourDateTimeList(tourInfoId);
		
		
		/*선택한 관광지의 정보와 예약된 티켓의 예약시간과 날짜 불러오기 */
		request.setAttribute("tourDateTimeList", tourDateTimeList);
		request.setAttribute("tourTime", tourTime);						
		request.setAttribute("tourInfo", tourInfo);
		request.getRequestDispatcher("/WEB-INF/views/reservation/reservationGo.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
