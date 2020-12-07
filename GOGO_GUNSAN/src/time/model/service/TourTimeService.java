package time.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;

import time.model.dao.TourTimeDAO;

import time.model.vo.TourTime;

public class TourTimeService {

	public TourTime selectOne(String tourInfoId) {
		Connection conn = getConnection();
		
		TourTime tourTime = new TourTimeDAO().selectOne(conn, tourInfoId);
		close(conn);
		
		return tourTime;
	}

}
