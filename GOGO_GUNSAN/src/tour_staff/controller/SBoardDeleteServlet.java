package tour_staff.controller;

import java.io.File;
import java.io.IOException;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import board.staff_board.model.service.Staff_BoardSerivce;

/**
 * Servlet implementation class staff_BoardDeleteServlet
 */
@WebServlet("/gogo-admin/staff/staffBoardDelete")
public class SBoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SBoardDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int boardNo = Integer.parseInt(request.getParameter("boardNo")) ;
		String rName = request.getParameter("rName");
		String staffNo = request.getParameter("staffNo");
		
		int result = new Staff_BoardSerivce().deleteBoard(boardNo);
		String msg ="";
		String loc ="/gogo-admin/staff/staffBoardList?staffNo="+staffNo;
		
		//파일삭제
		if(result>0 && !"".equals(rName)) {
			//현재 웹 컨테이너에서 구동중인 웹어플리 케이션의 루트절대경로 알아내기 
			String root= request.getSession().getServletContext().getRealPath("/");
			String savePath = root+"upload/board/staff_board";
			
			File deleteFile = new File(savePath+"/"+rName);
				deleteFile.delete();
		}
		msg="삭제 되었습니다.";

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
