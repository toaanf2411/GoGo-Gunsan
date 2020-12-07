package tour_info.model.service;

import static common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.List;

import tour_info.model.dao.TourInfoDAO;
import tour_info.model.vo.TourInfo;


public class TourInfoService {
	
	public TourInfo selectOne(String tourInfoId) {

		Connection conn = getConnection();
		TourInfo tourInfo = new TourInfoDAO().selectOne(conn, tourInfoId);
		close(conn);
		return tourInfo;

	}


	public List<TourInfo> selectServiceY(String type) {
		Connection conn = getConnection();
		List<TourInfo> list = new TourInfoDAO().selectServiceY(conn, type);
		close(conn);
		return list;
	}


	public List<TourInfo> selectServiceN(String type) {
		Connection conn = getConnection();
		List<TourInfo> list = new TourInfoDAO().selectServiceN(conn, type);
		close(conn);
		return list;
	}
	
	public List<TourInfo> findInfo(String searchKeyword) {
		Connection conn = getConnection();
		List<TourInfo> list = new TourInfoDAO().findInfo(conn, searchKeyword);
		close(conn);
		return list;
	}


	public List<TourInfo> seletTourInfoHasTicket() {
		Connection conn = getConnection();
		List<TourInfo> list = new TourInfoDAO().seletTourInfoHasTicket(conn);
		close(conn);
		return list;
	}





}
