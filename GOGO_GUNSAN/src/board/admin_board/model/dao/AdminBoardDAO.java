package board.admin_board.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;


import static common.JDBCTemplate.*;

import board.admin_board.model.vo.AdminBoard;

public class AdminBoardDAO {
	
	private Properties prop = new Properties();
	
	public AdminBoardDAO() {
		//sql member prorperties 불러오기
				String fileName = AdminBoardDAO.class.getResource("/sql/board/admin_board/adminBoard-query.properties").getPath();
				
				try {
					prop.load(new FileReader(fileName));
				} catch (FileNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	}
	
	//게시물 표현
	public List<AdminBoard> selectBoardList(Connection conn, int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<AdminBoard> list = new ArrayList<AdminBoard>();
		AdminBoard b = null;
		String query = prop.getProperty("selectBoardList");
		
		try {
			pstmt = conn.prepareStatement(query);
			int startRownum = (numPerPage*cPage)-(numPerPage-1);
			int endRownum = numPerPage*cPage;
			
			pstmt.setInt(1, startRownum);
			pstmt.setInt(2, endRownum);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				b = new AdminBoard();
				b.setAdminBoardNo(rset.getInt("admin_board_no"));
				b.setAdminBoardTitle(rset.getString("admin_board_title"));
				b.setAdminBoardWriter(rset.getString("member_name"));
				b.setAdminBoardContent(rset.getString("admin_board_content"));
				b.setAdminOriginalFileName(rset.getString("admin_board_original_filename"));
				b.setAdminRenamedFileName(rset.getString("admin_board_renamed_filename"));
				b.setAdminBoardDate(rset.getDate("admin_board_date"));
				b.setAdminReadCount(rset.getInt("admin_board_readcount"));
				
				list.add(b);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}
	
	//총 게시물 갯수
	public int selectTotalContents(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int totalContents = 0;
		String query = prop.getProperty("selectTotalContents");
		
		try {
			//미완성 쿼리 값 대입
			pstmt= conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				totalContents = rset.getInt("cnt");
			}
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}
		
		return totalContents;
	}
	//선택한 게시글
	public AdminBoard selectBoard(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		AdminBoard b = null;
		String query = prop.getProperty("selectBoard");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new AdminBoard();
				b.setAdminBoardNo(rset.getInt("admin_board_no"));
				b.setAdminBoardTitle(rset.getString("admin_board_title"));
				b.setAdminBoardWriter(rset.getString("member_name"));
				b.setAdminBoardContent(rset.getString("admin_board_content"));
				b.setAdminOriginalFileName(rset.getString("admin_board_original_filename"));
				b.setAdminRenamedFileName(rset.getString("admin_board_renamed_filename"));
				b.setAdminBoardDate(rset.getDate("admin_board_date"));
				b.setAdminReadCount(rset.getInt("admin_board_readcount"));
			}
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		return b;
	}
	
	//조회수
	public int increaseReadCount(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;
		int result =0;
		String query = prop.getProperty("increaseReadCount");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	
	//게시물 삭제
	public int deleteBoard(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("deleteBoard");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		
		return result;
	}

	public int insertBoard(Connection conn, AdminBoard b) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertBoard");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, b.getAdminBoardTitle());
			pstmt.setString(2, b.getAdminBoardWriter());
			pstmt.setString(3, b.getAdminBoardContent());
			pstmt.setString(4, b.getAdminOriginalFileName());
			pstmt.setString(5, b.getAdminRenamedFileName());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}

	public int selectLastSeq(Connection conn) {
		int boardNo = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectLastSeq");
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			if(rset.next())
				boardNo = rset.getInt("boardno");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return boardNo;
	}

	public int updateBoard(Connection conn, AdminBoard b) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateBoard");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, b.getAdminBoardTitle());
			pstmt.setString(2, b.getAdminBoardContent());
			pstmt.setString(3, b.getAdminOriginalFileName());
			pstmt.setString(4, b.getAdminRenamedFileName());
			pstmt.setInt(5, b.getAdminBoardNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

}
