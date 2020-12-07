package board.admin_board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.admin_board.model.service.AdminBoardSerivce;
import board.admin_board.model.vo.AdminBoard;

/**
 * Servlet implementation class adminBoardUpdateServlet
 */
@WebServlet("/board/admin_board/adminBoardUpdate")
public class AdminBoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminBoardUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.파라미터
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		int cPage = Integer.parseInt(request.getParameter("cPage"));
		//2.업무로직
		AdminBoard b = new AdminBoardSerivce().selectBoard(boardNo);
		
		request.setAttribute("board", b);
		request.setAttribute("cPage", cPage);
		request.getRequestDispatcher("/WEB-INF/views/board/admin_board/adminBoardUpdate.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
