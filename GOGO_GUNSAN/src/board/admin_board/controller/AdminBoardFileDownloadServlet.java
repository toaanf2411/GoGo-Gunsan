package board.admin_board.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class adminBoardFileDownloadServlet
 */
@WebServlet("/board/admin_board/adminBoardFileDownload")
public class AdminBoardFileDownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminBoardFileDownloadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.파라미터 핸들링
		String rName = request.getParameter("rName");
		String oName = request.getParameter("oName");
		
		//2.입출력 스트림
		String saveDirectory = getServletContext().getRealPath("/upload/board/admin_board");
		
		//입력
		BufferedInputStream bis = new BufferedInputStream(new FileInputStream(saveDirectory+'/'+rName));
		
		//출력
		ServletOutputStream sos = response.getOutputStream();
		BufferedOutputStream bos = new BufferedOutputStream(sos);
		
		//3. response header작성
		String resFileName = "";
		String userAgent = request.getHeader("user-agent"); //브라우저 정보
		
		//IE 브라우져
		boolean isMSIE = userAgent.indexOf("MSIE") != -1 || userAgent.indexOf("Trident") != -1;
		
		if(isMSIE) {
			//유니코드 퍼센트 문자 변환
			resFileName = URLEncoder.encode(oName,"utf-8");
			//공백 + => %20를 나타낸다
			resFileName = resFileName.replace("\\+", "%20");
		}else {
			//String(utf-8) => byte[](utf-8) => String(iso-8859-1)  : 인코딩을 다르게 해주기 위해서
			resFileName = new String(oName.getBytes("utf-8"),"iso-8859-1");
			
		}
		
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment;filename="+resFileName);
		
		//파일 입출력 & 자원 반납
		int read = -1; //읽어올 값없음 -1
		while((read=bis.read()) !=-1) {
			bos.write(read);
		}
		
		bos.close();
		bis.close();
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
