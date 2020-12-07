package board.free_board.model.service;

import java.sql.Connection;
import java.util.List;
import static common.JDBCTemplate.*;


import board.free_board.model.dao.FreeBoardDAO;
import board.free_board.model.vo.FreeBoard;
import board.free_board.model.vo.FreeBoardComment;

public class FreeBoardSerivce {

	public List<FreeBoard> selectBoardList(int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<FreeBoard> list = new FreeBoardDAO().selectBoardList(conn, cPage, numPerPage);
		close(conn);
		return list;
	}

	public int selectTotalContents() {
		Connection conn = getConnection();
		int totalContents = new FreeBoardDAO().selectTotalContents(conn);
		close(conn);
		return totalContents;
	}

	public FreeBoard selectBoard(int boardNo, boolean hasRead) {
		Connection conn = getConnection();
		int result = 0;
		// 조회수 증가
		if (hasRead == false) {
			result = new FreeBoardDAO().increaseReadCount(conn, boardNo);
		}

		// 클릭한 게시물 찾기
		FreeBoard b = new FreeBoardDAO().selectBoard(conn, boardNo);

		if (result > 0)
			commit(conn);
		else
			rollback(conn);

		close(conn);

		return b;
	}
	
	public FreeBoard selectBoard(int boardNo) {
		Connection conn = getConnection();
		
		// 클릭한 게시물 찾기
		FreeBoard b = new FreeBoardDAO().selectBoard(conn, boardNo);

		close(conn);

		return b;
	}

	// 댓글 출력
	public List<FreeBoardComment> selectCommentList(int boardNo) {
		Connection conn = getConnection();
		List<FreeBoardComment> list = new FreeBoardDAO().selectCommentList(conn, boardNo);
		close(conn);
		return list;
	}

	// 댓글 입력
	public int insertBoardComment(FreeBoardComment bc) {
		Connection conn = getConnection();
		int result = new FreeBoardDAO().insertBoardComment(conn, bc);

		if (result > 0)
			commit(conn);
		else
			rollback(conn);

		close(conn);
		return result;
	}

	// 댓글 삭제
	public int deleteComment(int delNo) {
		Connection conn = getConnection();
		int result = new FreeBoardDAO().deleteComment(conn, delNo);
		if (result > 0)
			commit(conn);
		else
			rollback(conn);

		close(conn);
		return result;
	}

	// 게시물 삭제
	public int deleteBoard(int boardNo) {
		Connection conn = getConnection();
		int result = new FreeBoardDAO().deleteBoard(conn, boardNo);

		if (result > 0)
			commit(conn);
		else
			rollback(conn);

		close(conn);
		return result;
	}

	// 게시물 등록
	public int insertBoard(FreeBoard b) {
		Connection conn = getConnection();
		int result = new FreeBoardDAO().insertBoard(conn, b);

		int boardNo = new FreeBoardDAO().selectLastSeq(conn);
		b.setFreeBoardNo(boardNo);

		// 트랜잭션 처리
		if (result > 0)
			commit(conn);
		else
			rollback(conn);

		close(conn);
		return result;
	}

	public int updateBoard(FreeBoard b) {
		Connection conn = getConnection();

		int result = new FreeBoardDAO().updateBoard(conn, b);

		// 트랜잭션 처리
		if (result > 0)
			commit(conn);
		else
			rollback(conn);

		close(conn);
		return result;
	}
	

}
