package board.staff_board.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import board.staff_board.model.service.Staff_BoardSerivce;
import board.staff_board.model.vo.Staff_Board;
import common.MvcFileRenamePolicy;

/**
 * Servlet implementation class staff_BoardFormEndServlet
 */
@WebServlet("/board/staff_board/staff_BoardUpdateEnd")
public class Staff_BoardUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Staff_BoardUpdateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
				
				//1. saveDirectory : 업로드한 파일의  절대경로
				String saveDirectory = getServletContext().getRealPath("/upload/board/staff_board");
				//2. maxPostSize : 업로드한 파일 최대크기 10MB 1kb*1024*10
				int maxPostSize = 1024 * 1024 * 10;
				//3. encoding : UTF-8
				String encoding = "utf-8";
				//4. fileRenamePolicy : 중복파일 리네임 정책 DefaultFileRenamePolicy a.txt, a1.txt, a2.txt, ....
				FileRenamePolicy fileRenamePolicy 
//								= new DefaultFileRenamePolicy();
								=new MvcFileRenamePolicy();
				
				
				MultipartRequest multiReq 
								= new MultipartRequest(request, 
													saveDirectory,
													maxPostSize, 
													encoding,
													fileRenamePolicy);
				
					//1. parameter
					//MultipartRequest를 사용한 경우, 기존 HttpServletRequset에서는 사용자 입력값을 가져올 수 없다.
					int boardNo = Integer.parseInt(multiReq.getParameter("boardNo"));	
					String boardTitle = multiReq.getParameter("boardTitle");
					String boardWriter = multiReq.getParameter("boardWriter");
					String boardContent = multiReq.getParameter("boardContent");
					
					//cPage 파라미터 핸들링
					int cPage = Integer.parseInt(multiReq.getParameter("cPage"));
					//XSS공격대비 태그기호 치환
					//개행문자 \n => <br>
					boardContent = boardContent.replaceAll("<", "&lt;").replaceAll(">", "&gt;")
												.replaceAll("\\n", "<br>");
					//사용자가 업로드한 파일명
					String originalFileName = multiReq.getOriginalFileName("upFile");
					//실제 저장된 파일명
					String renamedFileName = multiReq.getFilesystemName("upFile");
					
					Staff_Board b =new Staff_Board(boardNo, boardTitle, boardWriter, boardContent, originalFileName, renamedFileName, null, 0);
					
					//기존 첨부파일 정보
					String oldOriginalFileName = multiReq.getParameter("oldOriginalFileName");
					String oldRenamedFileName = multiReq.getParameter("oldRenamedFileName");
					
					//기존 첨부파일이 존재하고, 새로 파일을 첨부하지 않은 경우
					if(!"".equals(oldOriginalFileName)) {
						//업로드한 파일 객체
						File f = multiReq.getFile("upFile");
						if(f == null) {
							b.setStaff_OriginalFileName(oldOriginalFileName);
							b.setStaff_RenamedFileName(oldRenamedFileName);
							
						}
					}
					
					
					//2. 업무로직
					int result = new Staff_BoardSerivce().updateBoard(b);

					//3. 뷰단 처리
					String msg = result>0?"게시글 수정 성공!":"게시글 수정 실패!";
					String loc = "/board/staff_board/staff_BoardView?boardNo="+b.getStaff_BoardNo()+"&cPage="+cPage;
					
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
