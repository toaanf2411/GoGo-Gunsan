package service.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import reservation.model.service.ReservationService;
import reservation.model.vo.Reservation;

/**
 * Servlet implementation class TourServiceEndServlet
 */
@WebServlet("/service/tourServiceEnd")
public class TourServiceEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TourServiceEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		//결제방법
		String card = request.getParameter("pay-card-val");
		String bank = request.getParameter("pay-bank-val");
		String pay ="";

		if("".equals(card)) {
			pay="W";
		}else if("".equals(bank)) {
			pay="C";
		}
		
		//예약리스트
		List<Reservation> rList = (List)session.getAttribute("rList");
		 System.out.println("rList="+rList);
		//결제 수단 등록
		for(int i=0; i<rList.size(); i++) {
			rList.get(i).setPay(pay);
		}
		
		int result = new ReservationService().insertReservation(rList);
		if (result > 0) {
			System.out.println("예약 성공");
		} else {
			System.out.println("예약 실패");
		}
		
		//최종페이지 request 보내기
		request.setAttribute("rList", rList);
		
		//이전 사용한 세션 종료
		session.removeAttribute("result");
		session.removeAttribute("rList");
		
		request.getRequestDispatcher("/WEB-INF/views/service/tourServiceEnd.jsp").forward(request, response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
