package reservation.model.dao;

import static common.JDBCTemplate.close;

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


import reservation.model.vo.Reservation;

public class ReservationDAO {
private Properties prop = new Properties();
	
	public ReservationDAO(){
		//sql member prorperties 불러오기
		String fileName = Reservation.class.getResource("/sql/reservation/reservation-query.properties").getPath();
		
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
	
	//회원가입
	public int insertReservation(Connection conn, Reservation r) {
		//DB연결
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertReservation");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, r.getTourInfoId());
			pstmt.setString(2, r.getTourStaffNo());
			pstmt.setString(3, r.getMemberNo());
			pstmt.setInt(4, r.getAdultAmount());
			pstmt.setInt(5, r.getChildAmount());
			pstmt.setString(6, r.getTotalPrice());
			pstmt.setString(7, r.getTourDateTime());
			pstmt.setString(8, r.getPay());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			//연결 끊기
			close(conn);
		}
		
		
		return result;
	}
	
	public List<String> selectTourDateTimeList(Connection conn, String tourInfoId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<String> tourDateTimeList = new ArrayList<String>();
		String query = prop.getProperty("selectTourDateTimeList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, tourInfoId);
			String tourDateTime = "";
			rset = pstmt.executeQuery();
			while(rset.next()) {
				tourDateTime = rset.getString("tour_date_time");
	
				tourDateTimeList.add(tourDateTime);
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		return tourDateTimeList;
	}

	public List<Reservation> selectRservationList(Connection conn, String tourInfoId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Reservation> selectRservationList = new ArrayList<Reservation>();
		String query = prop.getProperty("selectReservationList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, tourInfoId);
			rset = pstmt.executeQuery();
			Reservation reservation = null;
			while(rset.next()) {
				reservation = new Reservation();

				reservation.setReservationId(rset.getString("reservation_id"));
				reservation.setTourInfoId(rset.getString("tour_info_id"));
				reservation.setTourStaffNo(rset.getString("tour_staff_no"));
				reservation.setMemberNo(rset.getString("member_no"));
				reservation.setAdultAmount(rset.getInt("adult_amount"));
				reservation.setChildAmount(rset.getInt("children_amount"));
				reservation.setTotalPrice(rset.getString("total_price"));
				reservation.setTourDateTime(rset.getString("tour_date_time"));
				reservation.setReservationDate(rset.getDate("reservation_date"));
				reservation.setPay(rset.getString("pay"));
				selectRservationList.add(reservation);	
			
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		return selectRservationList;
	}

	public int insertReservation(Connection conn, List<Reservation> rList) {
		
		//DB연결
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertReservation");
		
			
			try {
				pstmt = conn.prepareStatement(query);
 				for(int i=0; i<rList.size(); i++) {
				pstmt.setString(1, rList.get(i).getTourInfoId());
				pstmt.setString(2, rList.get(i).getTourStaffNo());
				pstmt.setString(3, rList.get(i).getMemberNo());
				pstmt.setInt(4, rList.get(i).getAdultAmount());
				pstmt.setInt(5, rList.get(i).getChildAmount());
				pstmt.setString(6, rList.get(i).getTotalPrice());
				pstmt.setString(7, rList.get(i).getTourDateTime());
				pstmt.setString(8, rList.get(i).getPay());
				
				result = pstmt.executeUpdate();
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				//연결 끊기
				close(conn);
			}
		
		
		return result;
	}

	public Reservation selectOne(Connection conn, String memberNo, String tourDateTime, String tourInfoId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Reservation reservationSeq = new Reservation();;
		String query = prop.getProperty("selectOne");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberNo);
			pstmt.setString(2, tourDateTime);
			pstmt.setString(3, tourInfoId);
			rset = pstmt.executeQuery();
			
			if(rset .next()) {	 	
				reservationSeq.setReservationId(rset.getString("reservation_id"));
				reservationSeq.setTourInfoId(rset.getString("tour_info_id"));
				reservationSeq.setTourStaffNo(rset.getString("tour_staff_no"));
				reservationSeq.setMemberNo(rset.getString("member_no"));
				reservationSeq.setAdultAmount(rset.getInt("adult_amount"));
				reservationSeq.setChildAmount(rset.getInt("children_amount"));
				reservationSeq.setTotalPrice(rset.getString("total_price"));
				reservationSeq.setTourDateTime(rset.getString("tour_date_time"));
				reservationSeq.setReservationDate(rset.getDate("reservation_date"));
				reservationSeq.setPay(rset.getString("pay"));
			    
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return reservationSeq;
	}

	public List<Reservation> selectRservationListAll(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Reservation> reservationListAll = new ArrayList<Reservation>();
		String query = prop.getProperty("selectReservationListAll");
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			Reservation reservation = null;
			while(rset.next()) {
				reservation = new Reservation();

				reservation.setReservationId(rset.getString("reservation_id"));
				reservation.setTourInfoId(rset.getString("tour_info_id"));
				reservation.setTourStaffNo(rset.getString("tour_staff_no"));
				reservation.setMemberNo(rset.getString("member_no"));
				reservation.setAdultAmount(rset.getInt("adult_amount"));
				reservation.setChildAmount(rset.getInt("children_amount"));
				reservation.setTotalPrice(rset.getString("total_price"));
				reservation.setTourDateTime(rset.getString("tour_date_time"));
				reservation.setReservationDate(rset.getDate("reservation_date"));
				reservation.setPay(rset.getString("pay"));
				reservationListAll.add(reservation);	
			
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		return reservationListAll;
	}

	 public Reservation selectReservationOne(Connection conn, String tourInfoId) {
		 PreparedStatement pstmt = null;
			ResultSet rset = null;
			Reservation reservationOne = new Reservation();;
			String query = prop.getProperty("selectReservationList");
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, tourInfoId);
				rset = pstmt.executeQuery();
				
				if(rset .next()) {	 	
					reservationOne.setReservationId(rset.getString("reservation_id"));
					reservationOne.setTourInfoId(rset.getString("tour_info_id"));
					reservationOne.setTourStaffNo(rset.getString("tour_staff_no"));
					reservationOne.setMemberNo(rset.getString("member_no"));
					reservationOne.setAdultAmount(rset.getInt("adult_amount"));
					reservationOne.setChildAmount(rset.getInt("children_amount"));
					reservationOne.setTotalPrice(rset.getString("total_price"));
					reservationOne.setTourDateTime(rset.getString("tour_date_time"));
					reservationOne.setReservationDate(rset.getDate("reservation_date"));
					reservationOne.setPay(rset.getString("pay"));
				    
				}
			} catch (SQLException e) {

				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
			return reservationOne;
	}

}
