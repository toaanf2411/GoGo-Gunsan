package admin.controller;

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
@WebServlet("/gogo-admin/staffBoardDelete")
public class StaffBoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StaffBoardDeleteServlet() {
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
		
		//파일 삭제
		if(result>0 && !"".equals(rName)){
			//현재 웹 컨테이너에서 구동중인 웹 어플리케이션의 루트 절대경로 알아내기
			//session객체 -> servlet context객체 -> 절대경로
			String root = request.getSession().getServletContext().getRealPath("/");
			String savePath = root + "upload/board/staff_board";
			
			File deleteFile=new File(savePath+"/"+ rName);
			//파일객체의 toString은 파일경로로 오버라이딩 되어있음.
			System.out.println(deleteFile);
			
//			boolean bool = deleteFile.delete();
//			System.out.println(bool?"파일삭제성공!":"파일삭제실패!");

			//(심화)파일을 삭제하지 않고, 삭제폴더로 이동시키는 경우
			//1.(파일이동) 파일객체의 delete메소드 사용하지 않고, renameTo메소드를 사용함.
			File newFile = new File(root+"deleteFiles/board/"+rName);
//			deleteFile.renameTo(newFile);

            
            //기존파일 삭제
            deleteFile.delete();
			
		}
		
		String msg ="";
		String loc ="/gogo-admin/staffBoardList";
		
		//파일삭제
		if(result > 0 ) {
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
