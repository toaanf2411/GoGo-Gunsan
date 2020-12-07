package reservation.model.service;

import static common.JDBCTemplate.*;



import java.sql.Connection;
import java.util.List;

import reservation.model.dao.ReservationDAO;
import reservation.model.vo.Reservation;

public class ReservationService {

		public int insertReservation(Reservation r) {
			//DAO에 전달할 업무로직
			Connection conn = getConnection();
			int result = new ReservationDAO().insertReservation(conn, r);
			
			//커밋&롤백 처리
			if(result>0) commit(conn);
			else rollback(conn);
			
			close(conn);
			return result;
		}
		
		public List<String> selectTourDateTimeList(String tourInfoId) {
			Connection conn = getConnection();
			List<String> tourDateTimeList = new ReservationDAO().selectTourDateTimeList(conn, tourInfoId);
			
			close(conn);
			return tourDateTimeList;
		}

		public List<Reservation> selectRservationList(String tourInfoId) {
			Connection conn = getConnection();
			List<Reservation> selectRservationList = new ReservationDAO().selectRservationList(conn, tourInfoId);
			close(conn);
			return selectRservationList;
		}
		
		//맞춤서비스
		public int insertReservation(List<Reservation> rList) {
			Connection conn = getConnection();
			int result = new ReservationDAO().insertReservation(conn, rList);
			
			//커밋&롤백 처리
			if(result>0) commit(conn);
			else rollback(conn);
			close(conn);
			return result;
		}

		public Reservation selectOne(String memberNo, String tourDateTime, String tourInfoId) {
			Connection conn = getConnection();
			Reservation reservationSeq = new ReservationDAO().selectOne(conn, memberNo, tourDateTime,tourInfoId);
			close(conn);
			return reservationSeq;
		}

		public List<Reservation> selectRservationListAll() {
			Connection conn = getConnection();
			List<Reservation> reservationListAll = new ReservationDAO().selectRservationListAll(conn);
			close(conn);
			return reservationListAll;
		}

		public Reservation selectReservationOne(String tourInfoId) {
			Connection conn = getConnection();
			Reservation reservationOne = new ReservationDAO().selectReservationOne(conn, tourInfoId);
			close(conn);
			return reservationOne;
		}
}
