package admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.free_board.model.service.FreeBoardSerivce;

/**
 * Servlet implementation class AdminFreeBoardCommentDeleteServlet
 */
@WebServlet("/gogo-admin/adminFreeBoardCommentDelete")
public class AdminFreeBoardCommentDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminFreeBoardCommentDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int delNo = Integer.parseInt(request.getParameter("delNo"));
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		int cPage = Integer.parseInt(request.getParameter("cPage"));
		
		int result = new FreeBoardSerivce().deleteComment(delNo);
		
		String msg = "";
		String loc = "/gogo-admin/adminFreeBoardView?boardNo="+boardNo+"&cPage="+cPage;
		if(result > 0) {
			msg = "댓글이 삭제 되었습니다.";
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
