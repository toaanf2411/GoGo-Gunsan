package admin.controller.common;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.admin_board.model.service.AdminBoardSerivce;
import board.admin_board.model.vo.AdminBoard;


/**
 * Servlet implementation class adminBoardViewServlet
 */
@WebServlet("/board/admin_boardCommon/adminBoardViewCommon")
public class AdminBoardViewCommonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminBoardViewCommonServlet() {
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
				
				if("AdminCommonboardCookie".equals(name)) {
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
			Cookie boardCookie = new Cookie("AdminCommonboardCookie",boardCookieVal);
			boardCookie.setMaxAge(365*24*60*60); //영속쿠기
			boardCookie.setPath(request.getContextPath()+"/board/admin_boardCommon");
			response.addCookie(boardCookie);
		}	
		
		System.out.println(boardCookieVal+"CCC");
		
		//2.업무로직
		AdminBoard b = new AdminBoardSerivce().selectBoard(boardNo, hasRead);
		
		String msg ="";
		String loc = "";
		
		if(b ==null) {
			msg="해당하는 게시글이 없습니다";
			loc="/board/admin_board/adminBoardList";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		}else {
			request.setAttribute("cPage", cPage);
			request.setAttribute("board", b);
			request.getRequestDispatcher("/WEB-INF/views/admin/manager/adminBoardViewManager.jsp").forward(request, response);
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
