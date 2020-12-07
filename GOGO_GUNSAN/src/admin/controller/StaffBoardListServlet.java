package admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.staff_board.model.service.Staff_BoardSerivce;
import board.staff_board.model.vo.Staff_Board;



/**
 * Servlet implementation class StaffBoardManagerServlet
 */
@WebServlet("/gogo-admin/staffBoardList")
public class StaffBoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Staff_BoardSerivce staff_BoardService = new Staff_BoardSerivce();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StaffBoardListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		final int numPerPage = 5;
		int cPage =1;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			
		}
		
		//2.업무로직
		List<Staff_Board> list = staff_BoardService.selectBoardList(cPage, numPerPage);
		
		
		//3.뷰단 처리
		int totalContents = staff_BoardService.selectTotalContents();
		
		int totalPage = (int)Math.ceil(((double)totalContents/numPerPage));
		
		
		final int pageBarSize = 5;
		
		final int pageStart = ((cPage-1)/pageBarSize)*pageBarSize+1;
		final int pageEnd = pageStart+pageBarSize-1;
		int pageNo = pageStart;
		
		String pageBar = "";
		
		////////////////////////////////////////////이해 할것!///////////////////////////
		//[이전]
		//이전페이지버튼을 비활성하는 경우
		if(pageNo ==1) {
			
			pageBar += "<i class='far fa-caret-square-left' style='font-size:24px'></i>";
		}
		else {
			pageBar += "<a href='staff_BoardList?cPage="+(pageNo-1)+"'><i class='fas fa-caret-square-left' style='font-size:24px'></i></a>";
		}
		
		//[pageNo]
		while(pageNo <= pageEnd && pageNo <= totalPage) {
			if(pageNo == cPage) {
				pageBar += "<span class='cPage'><button class='w3-btn w3-white w3-border' disabled>"+pageNo+"</button></span>";
			}
			else {
				pageBar += "<a href='staff_BoardList?cPage="+pageNo+"'><button class='w3-btn w3-white w3-border'>"+pageNo+"</button></a>";
			}	
			pageNo++;
		}
		
		//[다음]
		if(pageNo > totalPage) {
			pageBar += "<i class='far fa-caret-square-right' style='font-size:24px'></i>";
			System.out.println("pageNo="+pageNo);
			System.out.println("totalPage="+totalPage);
		}else {
			pageBar += "<a href='staff_BoardList?cPage="+pageNo+"'><i class='fas fa-caret-square-right' style='font-size:24px'></i></a>";
		}	
		
		
		//작성자 이름 찾기
		
		
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("list", list);
		request.setAttribute("cPage", cPage);
		request.getRequestDispatcher("/WEB-INF/views/admin/staffBoardList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
