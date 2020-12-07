package board.admin_board.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class AdminBoard implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int adminBoardNo;
	private String adminBoardTitle;
	private String adminBoardWriter;
	private String adminBoardContent;
	private String adminOriginalFileName;
	private String adminRenamedFileName;
	private Date adminBoardDate;
	private int adminReadCount;
	
	public AdminBoard() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AdminBoard(int adminBoardNo, String adminBoardTitle, String adminBoardWriter, String adminBoardContent,
			String adminOriginalFileName, String adminRenamedFileName, Date adminBoardDate, int adminReadCount) {
		super();
		this.adminBoardNo = adminBoardNo;
		this.adminBoardTitle = adminBoardTitle;
		this.adminBoardWriter = adminBoardWriter;
		this.adminBoardContent = adminBoardContent;
		this.adminOriginalFileName = adminOriginalFileName;
		this.adminRenamedFileName = adminRenamedFileName;
		this.adminBoardDate = adminBoardDate;
		this.adminReadCount = adminReadCount;
	}

	public int getAdminBoardNo() {
		return adminBoardNo;
	}

	public void setAdminBoardNo(int adminBoardNo) {
		this.adminBoardNo = adminBoardNo;
	}

	public String getAdminBoardTitle() {
		return adminBoardTitle;
	}

	public void setAdminBoardTitle(String adminBoardTitle) {
		this.adminBoardTitle = adminBoardTitle;
	}

	public String getAdminBoardWriter() {
		return adminBoardWriter;
	}

	public void setAdminBoardWriter(String adminBoardWriter) {
		this.adminBoardWriter = adminBoardWriter;
	}

	public String getAdminBoardContent() {
		return adminBoardContent;
	}

	public void setAdminBoardContent(String adminBoardContent) {
		this.adminBoardContent = adminBoardContent;
	}

	public String getAdminOriginalFileName() {
		return adminOriginalFileName;
	}

	public void setAdminOriginalFileName(String adminOriginalFileName) {
		this.adminOriginalFileName = adminOriginalFileName;
	}

	public String getAdminRenamedFileName() {
		return adminRenamedFileName;
	}

	public void setAdminRenamedFileName(String adminRenamedFileName) {
		this.adminRenamedFileName = adminRenamedFileName;
	}

	public Date getAdminBoardDate() {
		return adminBoardDate;
	}

	public void setAdminBoardDate(Date adminBoardDate) {
		this.adminBoardDate = adminBoardDate;
	}

	public int getAdminReadCount() {
		return adminReadCount;
	}

	public void setAdminReadCount(int adminReadCount) {
		this.adminReadCount = adminReadCount;
	}

	@Override
	public String toString() {
		return "AdminBoard [adminBoardNo=" + adminBoardNo + ", adminBoardTitle=" + adminBoardTitle
				+ ", adminBoardWriter=" + adminBoardWriter + ", adminBoardContent=" + adminBoardContent
				+ ", adminOriginalFileName=" + adminOriginalFileName + ", adminRenamedFileName=" + adminRenamedFileName
				+ ", adminBoardDate=" + adminBoardDate + ", adminReadCount=" + adminReadCount + "]";
	}
	
	
	
}
