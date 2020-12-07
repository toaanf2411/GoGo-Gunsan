package tour_staff.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import board.staff_board.model.vo.Staff_Board;
import reservation.model.vo.ReservationView;
import tour_staff.model.dao.StaffDAO;
import tour_staff.model.vo.Staff;

public class StaffService {
	public Staff selectOne(String staffEmail) {

		Connection conn = getConnection();
		Staff staff = new StaffDAO().selectOne(conn, staffEmail);
		close(conn);
		return staff;
	}

	public List<Staff> selectStaffList(int cPage, int numPerPage) {
		// 1.Connection객체생성
		Connection conn = getConnection();
		// 2.DAO업무요청
		List<Staff> list = new StaffDAO().selectStaffList(conn, cPage, numPerPage);
		// 3.자원반납
		close(conn);

		return list;
	}

	public int selectTotalContents() {
		Connection conn = getConnection();
		int totalContents = new StaffDAO().selectTotalContents(conn);

		close(conn);
		return totalContents;
	}

	public int updateStaff(Staff staff) {
		Connection conn = getConnection();

		int result = new StaffDAO().updateStaff(conn, staff);

		return result;
	}

	public int deleteStaff(String staffEmail) {
		Connection conn = getConnection();

		int result = new StaffDAO().deleteStaff(conn, staffEmail);

		return result;
	}

	public List<Staff> findStaff(String searchType, String searchKeyword) {
		Connection conn = getConnection();
		List<Staff> list = new StaffDAO().findStaff(conn, searchType, searchKeyword);
		close(conn);
		return list;
	}

	public List<ReservationView> selectReservation(String staffNo) {
		Connection conn = getConnection();
		List<ReservationView> list = new StaffDAO().selectReservation(conn, staffNo);
		close(conn);
		return list;
	}
	

	public String selectStaffNo(String tourInfoId) {
		Connection conn = getConnection();
		String tourStaffNo = new StaffDAO().selectStaffNo(conn, tourInfoId);
		close(conn);
		return tourStaffNo;
	}
	
	public List<Staff_Board> selectBoardList(int cPage, int numPerPage,String  staffNo) {
		Connection conn = getConnection();
		List<Staff_Board> boardList = new StaffDAO().selectBoardList(cPage,numPerPage,staffNo,conn);
		close(conn);
		return boardList;
	}

}
