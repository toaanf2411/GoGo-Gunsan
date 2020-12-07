package board.admin_board.model.service;

import java.sql.Connection;
import java.util.List;
import static common.JDBCTemplate.*;

import board.admin_board.model.dao.AdminBoardDAO;
import board.admin_board.model.vo.AdminBoard;



public class AdminBoardSerivce {

	public List<AdminBoard> selectBoardList(int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<AdminBoard> list = new AdminBoardDAO().selectBoardList(conn, cPage, numPerPage);
		close(conn);
		return list;
	}

	public int selectTotalContents() {
		Connection conn = getConnection();
		int totalContents = new AdminBoardDAO().selectTotalContents(conn);
		close(conn);
		return totalContents;
	}

	public AdminBoard selectBoard(int boardNo, boolean hasRead) {
		Connection conn = getConnection();
		int result = 0;
		// 조회수 증가
		if (hasRead == false) {
			result = new AdminBoardDAO().increaseReadCount(conn, boardNo);
		}

		// 클릭한 게시물 찾기
		AdminBoard b = new AdminBoardDAO().selectBoard(conn, boardNo);

		if (result > 0)
			commit(conn);
		else
			rollback(conn);

		close(conn);

		return b;
	}
	
	public AdminBoard selectBoard(int boardNo) {
		Connection conn = getConnection();
		
		// 클릭한 게시물 찾기
		AdminBoard b = new AdminBoardDAO().selectBoard(conn, boardNo);

		close(conn);

		return b;
	}

	// 게시물 삭제
	public int deleteBoard(int boardNo) {
		Connection conn = getConnection();
		int result = new AdminBoardDAO().deleteBoard(conn, boardNo);

		if (result > 0)
			commit(conn);
		else
			rollback(conn);

		close(conn);
		return result;
	}

	// 게시물 등록
	public int insertBoard(AdminBoard b) {
		Connection conn = getConnection();
		int result = new AdminBoardDAO().insertBoard(conn, b);

		int boardNo = new AdminBoardDAO().selectLastSeq(conn);
		b.setAdminBoardNo(boardNo);

		// 트랜잭션 처리
		if (result > 0)
			commit(conn);
		else
			rollback(conn);

		close(conn);
		return result;
	}

	public int updateBoard(AdminBoard b) {
		Connection conn = getConnection();

		int result = new AdminBoardDAO().updateBoard(conn, b);

		// 트랜잭션 처리
		if (result > 0)
			commit(conn);
		else
			rollback(conn);

		close(conn);
		return result;
	}

}
