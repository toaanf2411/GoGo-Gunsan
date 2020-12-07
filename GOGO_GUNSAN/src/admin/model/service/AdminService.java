package admin.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

import admin.model.dao.AdminDAO;
import member.model.dao.MemberDAO;
import member.model.vo.Member;
import reservation.model.vo.ReservationView;
import tour_staff.model.vo.Staff;

public class AdminService {
	
	public List<Member> selectMemberList(int cPage, int numPerPage) {
		// 1.Connection객체생성
		Connection conn = getConnection();
		// 2.DAO업무요청
		List<Member> list = new AdminDAO().selectMemberList(conn, cPage, numPerPage);
		// 3.자원반납
		close(conn);

		return list;
	}
	public int selectTotalContents() {
		Connection conn = getConnection();
		int totalContents = new AdminDAO().selectTotalContents(conn);

		close(conn);
		return totalContents;
	}
	public List<Member> findMember(String searchType, String searchKeyword) {
		Connection conn = getConnection();
		List <Member> list = new AdminDAO().findMember(conn, searchType, searchKeyword);
		close(conn);
		return list;
	}
	
	public Member selectAdminOne(String email) {
		Connection conn = getConnection();
		Member m = new AdminDAO().selectAdminOne(conn, email);
		close(conn);
		
		return m;
	}
	public int updateMember(Member member) {
		Connection conn = getConnection();

		int result = new AdminDAO().updateMember(conn, member);
		close(conn);
		return result;
	}
	public int deleteMember(String memberEmail) {
		Connection conn = getConnection();

		int result = new AdminDAO().deleteMember(conn, memberEmail);
		close(conn);
		return result;
	}
	public List<ReservationView> selectReservation() {
		Connection conn = getConnection();
		List<ReservationView> list = new AdminDAO().selectReservation(conn);
		close(conn);
		
		return list;
	}
	
}
