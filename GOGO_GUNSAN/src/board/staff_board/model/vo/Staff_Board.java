package board.staff_board.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Staff_Board implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private int staff_BoardNo;
	private String staff_BoardTitle;
	private String staff_BoardWriter;
	private String staff_BoardContent;
	private String staff_OriginalFileName;
	private String staff_RenamedFileName;
	private Date staff_BoardDate;
	private int staff_ReadCount;
	public Staff_Board() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Staff_Board(int staff_BoardNo, String staff_BoardTitle, String staff_BoardWriter, String staff_BoardContent,
			String staff_OriginalFileName, String staff_RenamedFileName, Date staff_BoardDate, int staff_ReadCount) {
		super();
		this.staff_BoardNo = staff_BoardNo;
		this.staff_BoardTitle = staff_BoardTitle;
		this.staff_BoardWriter = staff_BoardWriter;
		this.staff_BoardContent = staff_BoardContent;
		this.staff_OriginalFileName = staff_OriginalFileName;
		this.staff_RenamedFileName = staff_RenamedFileName;
		this.staff_BoardDate = staff_BoardDate;
		this.staff_ReadCount = staff_ReadCount;
	}
	public int getStaff_BoardNo() {
		return staff_BoardNo;
	}
	public void setStaff_BoardNo(int staff_BoardNo) {
		this.staff_BoardNo = staff_BoardNo;
	}
	public String getStaff_BoardTitle() {
		return staff_BoardTitle;
	}
	public void setStaff_BoardTitle(String staff_BoardTitle) {
		this.staff_BoardTitle = staff_BoardTitle;
	}
	public String getStaff_BoardWriter() {
		return staff_BoardWriter;
	}
	public void setStaff_BoardWriter(String staff_BoardWriter) {
		this.staff_BoardWriter = staff_BoardWriter;
	}
	public String getStaff_BoardContent() {
		return staff_BoardContent;
	}
	public void setStaff_BoardContent(String staff_BoardContent) {
		this.staff_BoardContent = staff_BoardContent;
	}
	public String getStaff_OriginalFileName() {
		return staff_OriginalFileName;
	}
	public void setStaff_OriginalFileName(String staff_OriginalFileName) {
		this.staff_OriginalFileName = staff_OriginalFileName;
	}
	public String getStaff_RenamedFileName() {
		return staff_RenamedFileName;
	}
	public void setStaff_RenamedFileName(String staff_RenamedFileName) {
		this.staff_RenamedFileName = staff_RenamedFileName;
	}
	public Date getStaff_BoardDate() {
		return staff_BoardDate;
	}
	public void setStaff_BoardDate(Date staff_BoardDate) {
		this.staff_BoardDate = staff_BoardDate;
	}
	public int getStaff_ReadCount() {
		return staff_ReadCount;
	}
	public void setStaff_ReadCount(int staff_ReadCount) {
		this.staff_ReadCount = staff_ReadCount;
	}
	@Override
	public String toString() {
		return "Staff_Board [staff_BoardNo=" + staff_BoardNo + ", staff_BoardTitle=" + staff_BoardTitle
				+ ", staff_BoardWriter=" + staff_BoardWriter + ", staff_BoardContent=" + staff_BoardContent
				+ ", staff_OriginalFileName=" + staff_OriginalFileName + ", staff_RenamedFileName="
				+ staff_RenamedFileName + ", staff_BoardDate=" + staff_BoardDate + ", staff_ReadCount="
				+ staff_ReadCount + "]";
	}
	

}
