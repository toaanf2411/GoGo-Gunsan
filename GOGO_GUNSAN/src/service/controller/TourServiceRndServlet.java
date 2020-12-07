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
 * Servlet implementation class TourServiceCorse
 */
@WebServlet("/service/tourServiceRnd")
public class TourServiceRndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TourServiceRndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//값 불러오기
		int cnt = Integer.parseInt(request.getParameter("period"));
		String startDay = request.getParameter("startDay");
		String type = request.getParameter("thema");
		
		System.out.println(cnt);
		System.out.println(startDay);
		System.out.println(type);
		
		//추천서비스에 대한 관광지 정보를 담아둔다.
		List<TourInfo> result = new ArrayList<TourInfo>();
		
		//테마별
		//has_ticket이 있으면 Y 없으면 N
		List<TourInfo> listY = new TourInfoService().selectServiceY(type);
		List<TourInfo> listN = new TourInfoService().selectServiceN(type);

		
		//랜덤을 통해 관광지 선택
		Random rnd = new Random();
		
		for(int i=0; i<cnt/2; i++) {
			
			int y = rnd.nextInt(listY.size());
			int n = rnd.nextInt(listN.size());
			
			//선택된 값을 리스트에 넣으면서 제거하므로 중복을 없앤다.
			result.add(listY.remove(y));
			result.add(listN.remove(n));

			
		}
	
		
		//세션을 이용하여 코스예약 정보를 저장한다.
		HttpSession session = request.getSession();
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
