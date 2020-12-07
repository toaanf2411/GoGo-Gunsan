package admin.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import member.model.vo.Member;
import reservation.model.vo.ReservationView;

public class AdminDAO {
	private Properties prop = new Properties();
	public AdminDAO() {
		
		String fileName = AdminDAO.class.getResource("/sql/admin/admin-query.properties").getPath();
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
	//회원정보보기
	public List<Member> selectMemberList(Connection conn, int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Member> list = null;
		String query = prop.getProperty("selectMemberList");
		try {
			//1.PreparedStatement객체 생성 , 미완성쿼리 값대입
			pstmt = conn.prepareStatement(query);
			//npp=10, cp=1 : 1~10
			//npp=10, cp=2 : 11~20
			//npp=10, cp=3 : 21~30
			int startRownum= (numPerPage*cPage)-9;
			int endRownum= cPage*numPerPage;
			pstmt.setInt(1, startRownum);
			pstmt.setInt(2, endRownum);
			//2.실행결과 => ResultSet
			rset = pstmt.executeQuery();
			//3.ResultSet => List<Member>
			list = new ArrayList<Member>();
			
			while(rset.next()) {
				Member m = new Member();

				m.setMemberNo(rset.getString("member_no"));
				m.setMemberEmail(rset.getString("member_email"));
				m.setPassword(rset.getString("member_password"));
				m.setMemberName(rset.getString("member_name"));
				m.setBirthDay(rset.getDate("member_birth"));
				m.setPhone(rset.getString("member_phone"));
				m.setEnrollDate(rset.getDate("member_enrolldate"));
				m.setGrade(rset.getString("grade"));
				
				list.add(m);
			}
		} catch (Exception e) {
			e.printStackTrace();
		
		} finally {
			//4.자원반납: ResultSet, PreparedStatement
			close(rset);
			close(pstmt);
		}
	
		return list;
	}
	//전체게시글수
	public int selectTotalContents(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int totalContents = 0;
		String query = prop.getProperty("selectTotalContents");
		
		try {
			//1.미완성쿼리를 가진 pstmt생성
			pstmt = conn.prepareStatement(query);
			//2.pstmt실행 => rset
			rset = pstmt.executeQuery();
			//3.rset => int
			//한 행이므로 if 가능 여려행 while
			if(rset.next()) {
				totalContents = rset.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
 		return totalContents;
	}
	
	public List<Member> findMember(Connection conn, String searchType, String searchKeyword) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Member> list = null;
		
		//where memberid like '%abc%'
		//where membername like '%abc%'
		//where gender = 'M'
		
		String query = prop.getProperty("findMemberBy_"+searchType);
		
		System.out.println("query@dao="+query);
		
		try {
			//1.PreparedStatement객체 생성 , 미완성쿼리 값대입
			pstmt = conn.prepareStatement(query);
			
			switch(searchType) {
			case "memberEmail": 
			case "memberNo": pstmt.setString(1, "%"+searchKeyword+"%"); break;
			case "memberName": pstmt.setString(1, "%"+searchKeyword+"%"); 
		
			}
			//2.실행결과 => ResultSet
			rset = pstmt.executeQuery();
			//3.ResultSet => List<Member>
			list = new ArrayList<Member>();
			
			while(rset.next()) {
				Member m = new Member();
				m.setMemberNo(rset.getString("member_no"));
				m.setMemberEmail(rset.getString("member_email"));
				m.setPassword(rset.getString("member_password"));
				m.setMemberName(rset.getString("member_name"));
				m.setBirthDay(rset.getDate("member_birth"));
				m.setPhone(rset.getString("member_phone"));
				m.setEnrollDate(rset.getDate("member_enrolldate"));
				m.setGrade(rset.getString("grade"));
				
				list.add(m);
			}
		} catch (Exception e) {
			e.printStackTrace();
		
		} finally {
			//4.자원반납: ResultSet, PreparedStatement
			close(rset);
			close(pstmt);
		}
	
		return list;
	}
	
	public Member selectAdminOne(Connection conn, String email) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;	
		Member m = null;
		String query = prop.getProperty("selectAdminOne");
		System.out.println("query@="+query);
		
		
		try {
			//미완성쿼리객체 생성
			pstmt = conn.prepareStatement(query);
			
			//미완서쿼리 값 대입
			pstmt.setString(1, email);
			
			//쿼리문 실행
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				m = new Member();
				m.setMemberNo(rset.getString("member_no"));
				m.setMemberEmail(rset.getString("member_email"));
				m.setPassword(rset.getString("member_password"));
				m.setMemberName(rset.getString("member_name"));
				m.setBirthDay(rset.getDate("member_birth"));
				m.setPhone(rset.getString("member_phone"));
				m.setEnrollDate(rset.getDate("member_enrolldate"));
				m.setGrade(rset.getString("grade"));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		System.out.println("admin객체@dao="+m);
		return m;
	}
	public int updateMember(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateMember"); 
		try {

			//1.PreparedStatement객체생성 및 미완성쿼리 값대입
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getPassword());
			 pstmt.setString(2, member.getMemberName());
			pstmt.setDate(3, member.getBirthDay());
			pstmt.setString(4, member.getPhone());
			pstmt.setString(5, member.getGrade());
			pstmt.setString(6, member.getMemberEmail());

			//2.실행 => int반환값 처리
			result = pstmt.executeUpdate();
			if(result>0) conn.commit();
			else conn.rollback();
			  
		} catch (Exception e) {
			e.printStackTrace();
			
		}finally{
			//3.자원반납
			close(pstmt);
		}
		return result;
	}
	public int deleteMember(Connection conn, String memberEmail) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("deleteMember"); 
		try {

			//1.PreparedStatement객체생성 및 미완성쿼리 값대입
			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, memberEmail);
			System.out.println(memberEmail+"DAO");

			//2.실행 => int반환값 처리
			result = pstmt.executeUpdate();
			
			if(result>0) conn.commit();
			else conn.rollback();
			  
		} catch (Exception e) {
			e.printStackTrace();
			
		}finally{
			//3.자원반납
			close(pstmt);
		}
		return result;
	}
	public List<ReservationView> selectReservation(Connection conn) {
		DecimalFormat format = new DecimalFormat("###,###");
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<ReservationView> list = new ArrayList<ReservationView>();
		ReservationView rv = null;
		String query = prop.getProperty("selectReservation");
		
		try {
			pstmt = conn.prepareStatement(query);
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

}
