package member.model.service;

import member.model.dao.MemberDAO;
import member.model.vo.Member;
import reservation.model.vo.ReservationView;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

public class MemberService {
	
	//회원가입 
	public int insertMember(Member m) {
		//DAO에 전달할 업무로직
		Connection conn = getConnection();
		int result = new MemberDAO().insertMember(conn, m);
		
		//커밋&롤백 처리
		if(result>0) commit(conn);
		else rollback(conn);
		
		return result;
	}
	
	//아이디 중복검사
	public int selectIdChk(String email) {
		//DAO에 전달할 업무로직
		Connection conn = getConnection();
		int result = new MemberDAO().selectIdChk(conn,email);
		
		close(conn);
		
		return result;
	}
	
	//로그인
	public Member selectOne(String memberEmail) {
		
		Connection conn = getConnection();
		Member m = new MemberDAO().selectOne(conn, memberEmail);
		close(conn);
		
		
		return m;
	}
	
	//아이디 찾기 service
	public Member idFind(String findName) {
		Connection conn = getConnection();
		Member m = new MemberDAO().idFind(conn, findName);
		close(conn);
		
		return m;
	}
	
	//패스워드 찾기 service
	public Member passwordFind(String fpEmail) {
		Connection conn = getConnection();
		Member m = new MemberDAO().passwordFind(conn, fpEmail);
		close(conn);
		return m;
	}

	public int memberUpdate(Member m) {
		Connection conn = getConnection();
		int result = new MemberDAO().memberUpdate(conn,m);
		close(conn);
		return result;
	}
	
	public int DeleteMember(String memberNo) {
		int result = 0;
		Connection conn = getConnection();
		result = new MemberDAO().deleteMember(conn, memberNo);
		close(conn);
		return result;
	}

	public List<ReservationView> selectReservation(String memberNo) {
		Connection conn = getConnection();
		List<ReservationView> list = new MemberDAO().selectReservation(conn, memberNo);
		close(conn);
		return list;
	}

}
