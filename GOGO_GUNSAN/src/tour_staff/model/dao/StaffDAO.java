package tour_staff.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import admin.model.dao.AdminDAO;
import board.staff_board.model.vo.Staff_Board;
import member.model.vo.Member;
import reservation.model.vo.ReservationView;
import tour_staff.model.vo.Staff;

public class StaffDAO {
	private Properties prop = new Properties();

	public StaffDAO() {

		String fileName = AdminDAO.class.getResource("/sql/staff/staff-query.properties").getPath();
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

	public Staff selectOne(Connection conn, String staffEmail) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Staff staff = null;
		String query = prop.getProperty("selectOne");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, staffEmail);
			System.out.println("memberDAO" + query);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				staff = new Staff();

				staff.setStaffNo(rset.getString("tour_staff_no"));
				staff.setStaffEmail(rset.getString("tour_staff_email"));
				staff.setPassword(rset.getString("tour_staff_password"));
				staff.setName(rset.getString("tour_staff_name"));
				staff.setPhone(rset.getString("tour_staff_phone"));
				staff.setEnrollDate(rset.getDate("tour_staff_enrolldate"));
				staff.setTourInfoId(rset.getString("tour_info_id"));

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return staff;
	}

	public List<Staff> selectStaffList(Connection conn, int cPage, int numPerPage) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Staff> list = null;
		String query = prop.getProperty("selectStaffList");
		try {
			// 1.PreparedStatement객체 생성 , 미완성쿼리 값대입
			pstmt = conn.prepareStatement(query);
			// npp=10, cp=1 : 1~10
			// npp=10, cp=2 : 11~20
			// npp=10, cp=3 : 21~30
			int startRownum = (numPerPage * cPage) - 9;
			int endRownum = cPage * numPerPage;
			pstmt.setInt(1, startRownum);
			pstmt.setInt(2, endRownum);
			// 2.실행결과 => ResultSet
			rset = pstmt.executeQuery();
			// 3.ResultSet => List<Staff>
			list = new ArrayList<Staff>();

			while (rset.next()) {
				Staff s = new Staff();

				s.setStaffNo(rset.getString("tour_staff_no"));
				s.setStaffEmail(rset.getString("tour_staff_email"));
				s.setName(rset.getString("tour_staff_name"));
				s.setPassword(rset.getString("tour_staff_password"));
				s.setPhone(rset.getString("tour_staff_phone"));
				s.setEnrollDate(rset.getDate("tour_staff_enrolldate"));
				s.setTourInfoId(rset.getString("tour_info_id"));

				list.add(s);
			}
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			// 4.자원반납: ResultSet, PreparedStatement
			close(rset);
			close(pstmt);
		}

		return list;
	}

	public int selectTotalContents(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int totalContents = 0;
		String query = prop.getProperty("selectTotalContents");

		try {
			// 1.미완성쿼리를 가진 pstmt생성
			pstmt = conn.prepareStatement(query);
			// 2.pstmt실행 => rset
			rset = pstmt.executeQuery();
			// 3.rset => int
			// 한 행이므로 if 가능 여러행 while
			if (rset.next()) {
				totalContents = rset.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return totalContents;
	}

	public int updateStaff(Connection conn, Staff staff) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateStaff");
		try {

			// 1.PreparedStatement객체생성 및 미완성쿼리 값대입
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, staff.getPassword());
			pstmt.setString(2, staff.getName());
			pstmt.setString(3, staff.getPhone());
			pstmt.setString(4, staff.getStaffEmail());

			// 2.실행 => int반환값 처리
			result = pstmt.executeUpdate();
			if (result > 0)
				conn.commit();
			else
				conn.rollback();

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			// 3.자원반납
			close(pstmt);
		}
		return result;
	}

	public int deleteStaff(Connection conn, String staffEmail) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("deleteStaff");
		try {

			// 1.PreparedStatement객체생성 및 미완성쿼리 값대입
			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, staffEmail);

			// 2.실행 => int반환값 처리
			result = pstmt.executeUpdate();
			if (result > 0)
				conn.commit();
			else
				conn.rollback();

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			// 3.자원반납
			close(pstmt);
		}
		return result;
	}

	public List<Staff> findStaff(Connection conn, String searchType, String searchKeyword) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Staff> list = null;

		String query = prop.getProperty("findStaffBy_" + searchType);

		System.out.println("query@dao=" + query);

		try {
			// 1.PreparedStatement객체 생성 , 미완성쿼리 값대입
			pstmt = conn.prepareStatement(query);

			switch (searchType) {
			case "staffEmail":
			case "staffNo":
				pstmt.setString(1, "%" + searchKeyword + "%");
				break;
			case "staffName":
				pstmt.setString(1, "%" + searchKeyword + "%");

			}
			// 2.실행결과 => ResultSet
			rset = pstmt.executeQuery();
			// 3.ResultSet => List<Member>
			list = new ArrayList<Staff>();

			while (rset.next()) {
				Staff s = new Staff();
				s.setStaffNo(rset.getString("tour_staff_no"));
				s.setStaffEmail(rset.getString("tour_staff_email"));
				s.setName(rset.getString("tour_staff_name"));
				s.setPassword(rset.getString("tour_staff_password"));
				s.setPhone(rset.getString("tour_staff_phone"));
				s.setEnrollDate(rset.getDate("tour_staff_enrolldate"));
				s.setTourInfoId(rset.getString("tour_info_id"));

				list.add(s);
			}
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			// 4.자원반납: ResultSet, PreparedStatement
			close(rset);
			close(pstmt);
		}

		return list;
	}

	public List<ReservationView> selectReservation(Connection conn, String staffNo) {
		DecimalFormat format = new DecimalFormat("###,###");
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<ReservationView> list = new ArrayList<ReservationView>();
		String query = prop.getProperty("selectReservation");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, staffNo);
			ReservationView rv = null;
			rset = pstmt.executeQuery();
			while(rset.next()) {
				rv = new ReservationView();

				rv.setReservationId(rset.getString("reservation_id"));
				rv.setTourInfoId(rset.getString("tour_info_id"));
				rv.setTourInfoName(rset.getString("tour_info_name"));
				rv.setTourStaffNo(rset.getString("tour_staff_no"));
				rv.setMemberNo(rset.getString("member_no"));
				rv.setMemberName(rset.getString("member_name"));
				rv.setMemberPhone(rset.getString("member_phone").replaceFirst("(^02|[0-9]{3})([0-9]{3,4})([0-9]{4})$", "$1-$2-$3"));
				rv.setAdultAmount(rset.getInt("adult_amount"));
				rv.setChildAmount(rset.getInt("children_amount"));
				rv.setTotalPrice(format.format(Integer.parseInt(rset.getString("total_price"))));
				rv.setTourDateTime(rset.getString("tour_date_time"));
				rv.setReservationDate(rset.getDate("reservation_date"));
				rv.setPay(rset.getString("pay"));
				list.add(rv);
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
	
	public String selectStaffNo(Connection conn, String tourInfoId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String tourStaffNo = "";
		String query = prop.getProperty("selectStaffNo");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, tourInfoId);

			rset = pstmt.executeQuery();
			while (rset.next()) {
				tourStaffNo = rset.getString("tour_staff_no");


			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return tourStaffNo;
	}
	
	public List<Staff_Board> selectBoardList(int cPage, int numPerPage, String staffNo,Connection conn) {
		PreparedStatement prmt = null;
		ResultSet  rset = null;
		String query = prop.getProperty("selectStaffBoard");
		List<Staff_Board> list = new ArrayList<Staff_Board>();
		Staff_Board sb = null;
		
		
		try {
			prmt  = conn.prepareStatement(query);
			int startRownum = (numPerPage*cPage)-(numPerPage-1);
			int endRownum = numPerPage*cPage;
			
			prmt.setString(1, staffNo);
			prmt.setInt(2, startRownum);
			prmt.setInt(3, endRownum);
			
			rset = prmt.executeQuery();
			
			while(rset.next()) {
				sb = new Staff_Board();
				sb.setStaff_BoardNo(rset.getInt("staff_board_no"));
				sb.setStaff_BoardTitle(rset.getString("staff_board_title"));
				sb.setStaff_BoardWriter(rset.getString("staff_board_writer"));
				sb.setStaff_BoardContent(rset.getString("staff_board_content"));
				sb.setStaff_OriginalFileName(rset.getString("staff_board_original_filename"));
				sb.setStaff_RenamedFileName(rset.getString("staff_board_renamed_filename"));
				sb.setStaff_BoardDate(rset.getDate("staff_board_date"));
				sb.setStaff_ReadCount(rset.getInt("staff_board_readcount"));
				
				list.add(sb);
				
				
			}
			
			System.out.println("BoardList="+list);
		} catch (SQLException e) {
		}finally {
			close(rset);
			close(prmt);
		}
		return list;
	}
	

}
