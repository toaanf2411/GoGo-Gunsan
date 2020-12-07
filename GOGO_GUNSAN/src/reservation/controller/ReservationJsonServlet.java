package reservation.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import member.model.vo.Member;
import reservation.model.service.ReservationService;
import reservation.model.vo.Reservation;
import time.model.service.TourTimeService;
import time.model.vo.TourTime;
import tour_info.model.service.TourInfoService;
import tour_info.model.vo.TourInfo;

/**
 * Servlet implementation class ReservationJsonServlet
 */
@WebServlet("/reservation/json/reservationGo.do")
public class ReservationJsonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationJsonServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		/*선택한 날짜와 선택한 관광지의 아이디값 불러오기*/
		String date = request.getParameter("date");
		String tourInfoId = request.getParameter("tourInfoId");
	
		/*선택한 관광지아이디의 회차시간과 시간에 따른 수량 불러오기*/
		TourTime tourTime = new TourTimeService().selectOne(tourInfoId); 
		
		/*선택한 관광지의 회차시간들 배열에 하나씩 담기*/
		/*ex) tourTime.getStartTime(): 20,20,15,20,30,20 */
		String[] startTimeArray = tourTime.getStartTime().split(",");
		/*선택한 관광지의 시간에 따른 수량 배열에 하나씩 담기*/
		/*ex) tourTime.getRemainingTicket(): 10:00,11:00,13:00,14:00,15:00,16:00 */
		String[] remaingTicket = tourTime.getRemainingTicket().split(",");
		
		/*해당 날짜에 예약된 티켓의 날짜시간과  선택한 날짜의 회차들과 비교하기 위해 
		 *불러온 날짜를 회차 시간과 합쳐서  예약정보에 저장된 같은 형식으로 만든다.
		 *(선택한 날짜와 시간이 "날짜"-"회차시간"형식으로 저장되어 있다. ex) 2020/2/20-10:00 */
		String[] selectDateTime = new String[startTimeArray.length];
		
		for(int i =0; i< startTimeArray.length;i++) {
			selectDateTime[i] = date+ "-" +startTimeArray[i];	
		}
		
		List<Reservation> reservationList = new ReservationService().selectRservationList(tourInfoId);
		List<Reservation> reservationed = new ArrayList<>();
		System.out.println("reservation@json"+reservationList);
		
		int totalAmount=0;
		int cnt = 0;
		String reservationedDateTime ="";
		for(Reservation r : reservationList) {
			for(int i=0; i< selectDateTime.length;i++) {
				if(r.getTourDateTime().equals(selectDateTime[i])){
					reservationed.add(r);
					reservationedDateTime = selectDateTime[i];
					cnt = i;
				}
			}
		}
		System.out.println("cnt="+cnt);
		System.out.println("reservationed="+reservationed);

		for(Reservation r : reservationed) {
			totalAmount += r.getAdultAmount()+r.getChildAmount();
		}
		System.out.println("totlaAmount="+totalAmount);
		

		int remain = 0;
				
		if( selectDateTime[cnt].equals(reservationedDateTime)) {
				remain = Integer.parseInt(remaingTicket[cnt]) - totalAmount; 
		}else {
			remain = Integer.parseInt(remaingTicket[cnt]);
		}
		
		
		System.out.println("remain="+remain);
		remaingTicket[cnt] = Integer.toString(remain);
	

		//list => jsonarray
		JSONArray jsonArr = new JSONArray();
		for(int i=0; i<remaingTicket.length;i++) {
			JSONObject jsonRemain = new JSONObject();
				jsonRemain.put("remain", remaingTicket[i]);
				jsonRemain.put("time", startTimeArray[i]);
				jsonArr.add(jsonRemain);
		}
	
//			
			
		// 4.view: json문자열을 응답에 쓰기
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.write(jsonArr.toJSONString());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
