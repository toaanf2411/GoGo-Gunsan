package admin.controller.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.channels.FileChannel;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import board.admin_board.model.service.AdminBoardSerivce;

/**
 * Servlet implementation class adminBoardDeleteServlet
 */
@WebServlet("/board/admin_boardCommon/adminBoardDeleteCommon")
public class AdminBoardDeleteCommonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminBoardDeleteCommonServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.전송값 꺼내서 변수에 기록하기.
				//String javax.servlet.ServletRequest.getParameter(String arg0)
				int boardNo = Integer.parseInt(request.getParameter("boardNo"));
				String renamedFileName = request.getParameter("rName");
				//renamedFileName의 값은 "" 또는 파일명임.
				System.out.println("renamedFileName="+renamedFileName);
				
				//2.서비스로직호출
				int result = new AdminBoardSerivce().deleteBoard(boardNo);
				//파일 삭제
				if(result>0 && !"".equals(renamedFileName)){
					//현재 웹 컨테이너에서 구동중인 웹 어플리케이션의 루트 절대경로 알아내기
					//session객체 -> servlet context객체 -> 절대경로
					String root = request.getSession().getServletContext().getRealPath("/");
					String savePath = root + "upload/board/admin_board";
					
					File deleteFile=new File(savePath+"/"+ renamedFileName);
					//파일객체의 toString은 파일경로로 오버라이딩 되어있음.
					System.out.println(deleteFile);
					
//					boolean bool = deleteFile.delete();
//					System.out.println(bool?"파일삭제성공!":"파일삭제실패!");

					//(심화)파일을 삭제하지 않고, 삭제폴더로 이동시키는 경우
					//1.(파일이동) 파일객체의 delete메소드 사용하지 않고, renameTo메소드를 사용함.
					File newFile = new File(root+"deleteFiles/board/"+renamedFileName);
//					deleteFile.renameTo(newFile);

		            
		            //기존파일 삭제
		            deleteFile.delete();
					
				}
				
				
				//3. 받은 결과에 따라 뷰페이지 내보내기
				String view = "/WEB-INF/views/common/msg.jsp";
				String msg = "";
				//javascript/html에서 사용할 url은 contextPath를 포함한다.
				String loc = "/gogo-admin/adminBoardList";

				if(result>0)
					msg = "게시글 삭제 성공!";
					
				else 
					msg = "게시글 삭제 실패!";	
				
				request.setAttribute("msg", msg);
				request.setAttribute("loc", loc);
				
				RequestDispatcher reqDispatcher = request.getRequestDispatcher(view);
				reqDispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
