package board.free_board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.free_board.model.service.FreeBoardSerivce;
import board.free_board.model.vo.FreeBoard;

/**
 * Servlet implementation class FreeBoardUpdateServlet
 */
@WebServlet("/board/free_board/freeBoardUpdate")
public class FreeBoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeBoardUpdateServlet() {
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
		FreeBoard b = new FreeBoardSerivce().selectBoard(boardNo);
		
		request.setAttribute("board", b);
		request.setAttribute("cPage", cPage);
		request.getRequestDispatcher("/WEB-INF/views/board/free_board/freeBoardUpdate.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
