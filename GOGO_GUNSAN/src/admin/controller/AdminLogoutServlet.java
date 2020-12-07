package admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AdminLogoutServlet
 */
@WebServlet("/gogo-admin/adminLogout")
public class AdminLogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminLogoutServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 로그아웃 해당세션객체를 무효화하 것

		// 해당 세션 존재하면, 그 세션을 리턴한고, 존재하지 않으면 null을 리턴
		// HttpSession javax.servlet.http.HttpServletRequest.getSession(boolean )
		// 무효화가 되면 새로 만들지 말아라
		HttpSession session = request.getSession(false);

		// 세션이 존재하는 경우, 무효화처리.
		// 세션에 속성으로 담김값도 무효화됨.
		if (session != null)
			session.invalidate();
		request.getRequestDispatcher("/WEB-INF/views/admin/adminLogin.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
