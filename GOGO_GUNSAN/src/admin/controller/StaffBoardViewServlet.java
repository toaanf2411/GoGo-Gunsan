package admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import board.staff_board.model.service.Staff_BoardSerivce;
import board.staff_board.model.vo.Staff_Board;
import board.staff_board.model.vo.Staff_BoardComment;

/**
 * Servlet implementation class staff_BoardViewServlet
 */
@WebServlet("/gogo-admin/staffBoardView")
public class StaffBoardViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StaffBoardViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		int cPage = Integer.parseInt(request.getParameter("cPage"));
		
		//조회수 처리를 위한 쿠키
		Cookie[] cookies = request.getCookies();
		String boardCookieVal ="";
		boolean hasRead = false;
		
		
		//사이트첫 방문 아무런 쿠기도 가지고 있지 않아 cookies = null 이다.
		if(cookies != null) {
			for(Cookie c : cookies) {
				String name = c.getName();
				String value = c.getValue();
				
				if("StaffboardCookie".equals(name)) {
					boardCookieVal = value;
					if(value.contains("|"+boardNo+"|")) {
						hasRead = true;
						break;
					}
				}
			}
			
		}
			
		//쿠기 생성
		if(hasRead == false) {
			boardCookieVal = boardCookieVal + "|" + boardNo + "|";
			Cookie boardCookie = new Cookie("StaffboardCookie",boardCookieVal);
			boardCookie.setMaxAge(365*24*60*60); //영속쿠기
			boardCookie.setPath(request.getContextPath()+"/gogo-admin/staffBoardView");
			response.addCookie(boardCookie);
		}
		
		//2.업무로직
		Staff_Board b = new Staff_BoardSerivce().selectBoard(boardNo, hasRead);
		

		//댓글 가져오기
	
		String msg ="";
		String loc = "";
		
		if(b ==null) {
			msg="해당하는 게시글이 없습니다";
			loc="/board/staff_board/staff_BoardList";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		}else {
			request.setAttribute("cPage", cPage);
			request.setAttribute("board", b);
			request.getRequestDispatcher("/WEB-INF/views/admin/staffBoardView.jsp").forward(request, response);
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
