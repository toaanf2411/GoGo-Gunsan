package tour_info.model.dao;

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
import static common.JDBCTemplate.*;

import tour_info.model.vo.TourInfo;


public class TourInfoDAO {
	private Properties prop = new Properties();
	public TourInfoDAO() {
		String fileName = TourInfoDAO.class.getResource("/sql/tour_info/tour_info-query.properties").getPath();
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
	public TourInfo selectOne(Connection conn, String tourInfoId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		TourInfo  tourInfo = null;
		String query = prop.getProperty("selectOne");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, tourInfoId);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				tourInfo = new TourInfo();
				tourInfo.setTourInfoId(rset.getString("tour_info_id"));
				tourInfo.setTourInfoName(rset.getString("tour_info_name"));
				tourInfo.setCategoryId(rset.getString("category_id"));
				tourInfo.setServiceType(rset.getString("service_type"));
				tourInfo.setHasTicket(rset.getString("has_ticket").charAt(0));
				tourInfo.setAdultPrice(rset.getString("adult_price"));
				tourInfo.setChildPrice(rset.getString("child_price"));
				tourInfo.setLat(rset.getDouble("lat"));
				tourInfo.setLongitude(rset.getDouble("longitude"));
				tourInfo.setImgServiceOriginalFileName(rset.getString("img_service_original_filename"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return tourInfo;
	}
	
	//티켓여부 Y
	public List<TourInfo> selectServiceY(Connection conn, String type) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<TourInfo> list = new ArrayList<TourInfo>();
		TourInfo info = null;
		String query = prop.getProperty("selectServiceY");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%"+type+"%");
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				info = new TourInfo();
				info.setTourInfoId(rset.getString("tour_info_id"));
				info.setTourInfoName(rset.getString("tour_info_name"));
				info.setCategoryId(rset.getString("category_id"));
				info.setServiceType(rset.getString("service_type"));
				info.setHasTicket(rset.getString("has_ticket").charAt(0));
				info.setAdultPrice(rset.getString("adult_price"));
				info.setChildPrice(rset.getString("child_price"));
			    info.setLat(rset.getDouble("lat"));
				info.setLongitude(rset.getDouble("longitude"));
				info.setImgServiceOriginalFileName(rset.getString("img_service_original_filename"));
				list.add(info);
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
	
	//티켓여부 N
	public List<TourInfo> selectServiceN(Connection conn, String type) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<TourInfo> list = new ArrayList<TourInfo>();
		TourInfo info = null;
		String query = prop.getProperty("selectServiceN");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%"+type+"%");
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				info = new TourInfo();
				info.setTourInfoId(rset.getString("tour_info_id"));
				info.setTourInfoName(rset.getString("tour_info_name"));
				info.setCategoryId(rset.getString("category_id"));
				info.setServiceType(rset.getString("service_type"));
				info.setHasTicket(rset.getString("has_ticket").charAt(0));
				info.setAdultPrice(rset.getString("adult_price"));
				info.setChildPrice(rset.getString("child_price"));
				info.setLat(rset.getDouble("lat"));
				info.setLongitude(rset.getDouble("longitude"));
				info.setImgServiceOriginalFileName(rset.getString("img_service_original_filename"));
				list.add(info);
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
	
	public List<TourInfo> findInfo(Connection conn, String searchKeyword) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<TourInfo> list = null;
		
		String query = prop.getProperty("findInfo");
		
		System.out.println("TourInfoQuery@dao=" + query);
		
		
		try {
			// 1.PreparedStatement객체 생성 , 미완성쿼리 값대입
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%"+searchKeyword+"%");
		
			//2. 실행결과 => ResultSet
			rset = pstmt.executeQuery();
			//3. ResultSet => List<TourInfo>
			list = new ArrayList<TourInfo>();
			
			while(rset.next()) {
				TourInfo t = new TourInfo();
				
				t.setTourInfoId(rset.getString("tour_info_id"));
				t.setTourInfoName(rset.getString("tour_info_name"));
				t.setCategoryId(rset.getString("category_id"));
				t.setServiceType(rset.getString("service_type"));
				t.setHasTicket(rset.getString("has_ticket").charAt(0));
				t.setAdultPrice(rset.getString("adult_price"));
				t.setChildPrice(rset.getString("child_price"));
				t.setLat(rset.getDouble("lat"));
				t.setLongitude(rset.getDouble("longitude"));
				t.setImgServiceOriginalFileName(rset.getString("img_service_original_filename"));
				
				list.add(t);
				System.out.println("list@DAO="+list);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			//4. 자원반납
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	public List<TourInfo> seletTourInfoHasTicket(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<TourInfo> list = null;
		
		String query = prop.getProperty("seletTourInfoHasTicket");
	
		
		
		try {
			// 1.PreparedStatement객체 생성 , 미완성쿼리 값대입
			pstmt = conn.prepareStatement(query);
		
			//2. 실행결과 => ResultSet
			rset = pstmt.executeQuery();
			//3. ResultSet => List<TourInfo>
			list = new ArrayList<TourInfo>();
			
			while(rset.next()) {
				TourInfo t = new TourInfo();
				
				t.setTourInfoId(rset.getString("tour_info_id"));
				t.setTourInfoName(rset.getString("tour_info_name"));
				t.setCategoryId(rset.getString("category_id"));
				t.setServiceType(rset.getString("service_type"));
				t.setHasTicket(rset.getString("has_ticket").charAt(0));
				t.setAdultPrice(rset.getString("adult_price"));
				t.setChildPrice(rset.getString("child_price"));
				t.setLat(rset.getDouble("lat"));
				t.setLongitude(rset.getDouble("longitude"));
				t.setImgServiceOriginalFileName(rset.getString("img_service_original_filename"));
				
				list.add(t);
				System.out.println("list@DAO="+list);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			//4. 자원반납
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

}
