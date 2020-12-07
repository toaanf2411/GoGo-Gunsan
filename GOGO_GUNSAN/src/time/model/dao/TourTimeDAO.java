package time.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;


import time.model.vo.TourTime;

public class TourTimeDAO {
	private Properties prop = new Properties();
	public TourTimeDAO() {
		String fileName = TourTimeDAO.class.getResource("/sql/tour_time/tourTime-query.properties").getPath();
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

	public TourTime selectOne(Connection conn, String tourInfoId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		TourTime tourTime  = null;
		String query = prop.getProperty("selectOne");
		System.out.println("qeury@tourTime="+query);
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, tourInfoId);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				
				tourTime = new TourTime();

				tourTime.setTourInfoId(rset.getString("tour_info_id"));
				tourTime.setRemainingTicket(rset.getString("remaining_ticket"));
				tourTime.setStartTime(rset.getString("start_time"));
				
				System.out.println("tourInfoId="+rset.getString("tour_info_id"));
				System.out.println("remaining_ticket="+rset.getString("remaining_ticket"));
				System.out.println("start_time="+rset.getString("start_time"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return tourTime;
	}
}
