package service.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import reservation.model.vo.Reservation;
import tour_info.model.vo.TourInfo;
import tour_staff.model.service.StaffService;

/**
 * Servlet implementation class TourServiceGoServlet
 */
@WebServlet("/service/TourServiceRingServlet")
public class TourServiceRingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TourServiceRingServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//추천코스
		HttpSession session = request.getSession();
		List<TourInfo> result = (List)session.getAttribute("result");
		
		//다음을 클릭시 예약정보가 담긴다.
		int idx = Integer.parseInt(request.getParameter("idx"));
		int adultAmount = Integer.parseInt(request.getParameter("adultValue"));
		String adultPrice = (String) request.getParameter("adultPrice");
		int childAmount = Integer.parseInt(request.getParameter("childValue"));
		String childPrice = (String) request.getParameter("childPrice");
		String memberNo = (String) request.getParameter("member_no");
		 String time = request.getParameter("timeCheck");
		String date = (String) request.getParameter("date");
		
		System.out.println(adultAmount + "어른");
		System.out.println(childAmount + "아이");
		System.out.println(adultPrice + "어른 가격");
		System.out.println(childPrice+ "아이가격");
		System.out.println(memberNo);
		System.out.println(time + "시간");
		System.out.println(date + "날짜");

		String timeDate = date+"-"+time;
		
		//티켓이 있는 관광지만 리스트에 담기 위해 분류한다.
		if(result.get(idx).getHasTicket()=='Y') {
			
			int totalPrice = 0;
			if (adultAmount != 999) {
				totalPrice = (Integer.parseInt(adultPrice) * adultAmount) + (Integer.parseInt(childPrice) * childAmount);
			}
			
			String tourStaffNo = new StaffService().selectStaffNo(result.get(idx).getTourInfoId());
			
			Reservation newR = new Reservation(null, result.get(idx).getTourInfoId(), tourStaffNo, memberNo, adultAmount, childAmount,
					String.valueOf(totalPrice), timeDate, null, null);
			
			//추천 코스 인덱스가 0일경우 티켓이 있는 관광지만 담을 새로운 리스트를 생성한다.
			if(idx==0) {
				List<Reservation> rList  = new ArrayList<Reservation>();
				
				System.out.println("newR=" + newR);
				rList.add(newR);
				session.setAttribute("rList", rList);
			}
			//기존에 담겨져있던 리스트를 세션으로 불러와 추가한 값을 다시 세션에 저장한다.
			else {
				List<Reservation> rList = (List)session.getAttribute("rList");
				rList.add(newR);
				System.out.println("rlist=" + rList);
				session.setAttribute("rList", rList);
			}
		}
		
		

		idx++;
		System.out.println("I++=" + idx);
//	     

		request.setAttribute("idx", idx);
		request.getRequestDispatcher("/WEB-INF/views/service/tourServiceReservation.jsp").forward(request, response);
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
