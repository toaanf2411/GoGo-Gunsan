package board.staff_board.model.dao;

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

import board.staff_board.model.vo.Staff_Board;
import board.staff_board.model.vo.Staff_BoardComment;


public class Staff_BoardDAO {
	
	private Properties prop = new Properties();
	
	public Staff_BoardDAO() {
		//sql member prorperties 불러오기
				String fileName = Staff_BoardDAO.class.getResource("/sql/board/staff_board/staff_Board-query.properties").getPath();
				
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
	
	public List<Staff_Board> selectBoardList(Connection conn, int cPage, int numPerPage) {
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        List<Staff_Board> list = new ArrayList<Staff_Board>();
        Staff_Board b = null;
        String query = prop.getProperty("selectBoardList");
        
        try {
            pstmt = conn.prepareStatement(query);
            int startRownum = (numPerPage*cPage)-(numPerPage-1);
            int endRownum = numPerPage*cPage;
            
            pstmt.setInt(1, startRownum);
            pstmt.setInt(2, endRownum);
            rset = pstmt.executeQuery();
            while(rset.next()) {
                b = new Staff_Board();
                b.setStaff_BoardNo(rset.getInt("Staff_board_no"));
                b.setStaff_BoardTitle(rset.getString("Staff_board_title"));
                b.setStaff_BoardWriter(rset.getString("tour_staff_name"));
                b.setStaff_BoardContent(rset.getString("Staff_board_content"));
                b.setStaff_OriginalFileName(rset.getString("Staff_board_original_filename"));
                b.setStaff_RenamedFileName(rset.getString("Staff_board_renamed_filename"));
                b.setStaff_BoardDate(rset.getDate("Staff_board_date"));
                b.setStaff_ReadCount(rset.getInt("Staff_board_readcount"));
                
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
//선택한 게시글
    public Staff_Board selectBoard(Connection conn, int boardNo) {
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        Staff_Board b = null;
        String query = prop.getProperty("selectBoard");
        
        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, boardNo);
            rset = pstmt.executeQuery();
            
            if(rset.next()) {
                b = new Staff_Board();
                b.setStaff_BoardNo(rset.getInt("Staff_board_no"));
                b.setStaff_BoardTitle(rset.getString("Staff_board_title"));
                b.setStaff_BoardWriter(rset.getString("tour_staff_name"));
                b.setStaff_BoardContent(rset.getString("Staff_board_content"));
                b.setStaff_OriginalFileName(rset.getString("Staff_board_original_filename"));
                b.setStaff_RenamedFileName(rset.getString("Staff_board_renamed_filename"));
                b.setStaff_BoardDate(rset.getDate("Staff_board_date"));
                b.setStaff_ReadCount(rset.getInt("Staff_board_readcount"));
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

	public int insertBoard(Connection conn, Staff_Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertBoard");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, b.getStaff_BoardTitle());
			pstmt.setString(2, b.getStaff_BoardWriter());
			pstmt.setString(3, b.getStaff_BoardContent());
			pstmt.setString(4, b.getStaff_OriginalFileName());
			pstmt.setString(5, b.getStaff_RenamedFileName());
			
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

	public int updateBoard(Connection conn, Staff_Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateBoard");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, b.getStaff_BoardTitle());
			pstmt.setString(2, b.getStaff_BoardContent());
			pstmt.setString(3, b.getStaff_OriginalFileName());
			pstmt.setString(4, b.getStaff_RenamedFileName());
			pstmt.setInt(5, b.getStaff_BoardNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	//list에서 보여질 회원 이름
	public List<String> selectName(Connection conn, String writer) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<String> name = new ArrayList<String>();
		String query = prop.getProperty("selectName");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, writer);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				name.add(rset.getString("member_name"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return name;
	}
	
	//view에서 보여질 회원이름
	public String selectName(Connection conn, Staff_Board b) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String name = "";
		String query = prop.getProperty("selectName");
		
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, b.getStaff_BoardWriter());
			rset = pstmt.executeQuery();
			if(rset.next()) {
				name = rset.getString("member_name");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return name;
	}
}
