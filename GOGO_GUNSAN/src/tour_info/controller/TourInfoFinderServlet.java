package tour_info.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tour_info.model.service.TourInfoService;
import tour_info.model.vo.TourInfo;


/**
 * Servlet implementation class TourInfoFinderServlet
 */
@WebServlet("/reservation/findInfo")
public class TourInfoFinderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TourInfoFinderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				// 1.파라미터 핸들링
				String searchKeyword = request.getParameter("searchKeyword");

				// 2.업무로직
				List<TourInfo> list = new TourInfoService().findInfo(searchKeyword);
	
				// 3.view단 처리
				request.setAttribute("list", list);
				request.getRequestDispatcher("/WEB-INF/views/reservation/findInfo.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
