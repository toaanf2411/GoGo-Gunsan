package service.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tour_info.model.service.TourInfoService;
import tour_info.model.vo.TourInfo;

/**
 * Servlet implementation class TourServiceRecommendJsonServlet
 */
@WebServlet("/service/tourRecommend.do")
public class TourServiceRecommendJsonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TourServiceRecommendJsonServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//세션의 정보 가져오기
		HttpSession session = request.getSession();
		
		int cnt = (Integer)session.getAttribute("cnt");
		String type = (String)session.getAttribute("type");
		String startDay = (String)session.getAttribute("startDay");

		//재추천을 받기 위해 새로운 예약 리스트를 만든다.
		List<TourInfo> result = new ArrayList<TourInfo>();
		
		List<TourInfo> listY = new TourInfoService().selectServiceY(type);
		List<TourInfo> listN = new TourInfoService().selectServiceN(type);


		Random rnd = new Random();
		
		for(int i=0; i<cnt/2; i++) {
			
			int y = rnd.nextInt(listY.size());
			int n = rnd.nextInt(listN.size());
			
			result.add(listY.remove(y));
			result.add(listN.remove(n));

		}
		
		//새로 만든 추천 정보를 session에 저장한다.
		session.setAttribute("result", result);
		session.setAttribute("type", type);
		session.setAttribute("startDay", startDay);
		session.setAttribute("cnt", cnt);

		
		

		request.getRequestDispatcher("/WEB-INF/views/service/tourServiceRnd.jsp").forward(request, response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
