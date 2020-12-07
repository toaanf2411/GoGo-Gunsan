package board.staff_board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.staff_board.model.service.Staff_BoardSerivce;
import board.staff_board.model.vo.Staff_Board;

/**
 * Servlet implementation class staff_BoardUpdateServlet
 */
@WebServlet("/board/staff_board/staff_BoardUpdate")
public class Staff_BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Staff_BoardUpdateServlet() {
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
		Staff_Board b = new Staff_BoardSerivce().selectBoard(boardNo);
		
		request.setAttribute("board", b);
		request.setAttribute("cPage", cPage);
		request.getRequestDispatcher("/WEB-INF/views/board/staff_board/staff_BoardUpdate.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
