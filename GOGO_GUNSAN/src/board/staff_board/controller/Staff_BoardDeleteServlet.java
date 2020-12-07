package board.staff_board.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import board.staff_board.model.service.Staff_BoardSerivce;

/**
 * Servlet implementation class staff_BoardDeleteServlet
 */
@WebServlet("/board/staff_board/staff_BoardDelete")
public class Staff_BoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Staff_BoardDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardNo = Integer.parseInt(request.getParameter("boardNo")) ;
		String rName = request.getParameter("rName");
		
		int result = new Staff_BoardSerivce().deleteBoard(boardNo);
		
		String msg ="";
		String loc ="/board/staff_board/staff_BoardList";
		
		String filePath = getServletContext().getRealPath("/upload/board/staff_board")+"/"+rName;
		
		File file = new File(filePath);
		
		if(result > 0 && file.exists()==true) {
			file.delete();
			msg="삭제 되었습니다.";
		}else {
			msg = "오류가 발생했습니다.";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
