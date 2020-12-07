package board.staff_board.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Staff_BoardComment implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int staff_BoardCommentNo;
	private int staff_BoardCommentLevel;
	private String staff_BoardCommentWriter;
	private String staff_BoardCommentContent;
	private int staff_BoardRef;
	private int staff_BoardCommentRef;
	private Date staff_BoardCommentDate;
	public Staff_BoardComment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Staff_BoardComment(int staff_BoardCommentNo, int staff_BoardCommentLevel, String staff_BoardCommentWriter,
			String staff_BoardCommentContent, int staff_BoardRef, int staff_BoardCommentRef, Date staff_BoardCommentDate) {
		super();
		this.staff_BoardCommentNo = staff_BoardCommentNo;
		this.staff_BoardCommentLevel = staff_BoardCommentLevel;
		this.staff_BoardCommentWriter = staff_BoardCommentWriter;
		this.staff_BoardCommentContent = staff_BoardCommentContent;
		this.staff_BoardRef = staff_BoardRef;
		this.staff_BoardCommentRef = staff_BoardCommentRef;
		this.staff_BoardCommentDate = staff_BoardCommentDate;
	}
	public int getStaff_BoardCommentNo() {
		return staff_BoardCommentNo;
	}
	public void setStaff_BoardCommentNo(int staff_BoardCommentNo) {
		this.staff_BoardCommentNo = staff_BoardCommentNo;
	}
	public int getStaff_BoardCommentLevel() {
		return staff_BoardCommentLevel;
	}
	public void setStaff_BoardCommentLevel(int staff_BoardCommentLevel) {
		this.staff_BoardCommentLevel = staff_BoardCommentLevel;
	}
	public String getStaff_BoardCommentWriter() {
		return staff_BoardCommentWriter;
	}
	public void setStaff_BoardCommentWriter(String staff_BoardCommentWriter) {
		this.staff_BoardCommentWriter = staff_BoardCommentWriter;
	}
	public String getStaff_BoardCommentContent() {
		return staff_BoardCommentContent;
	}
	public void setStaff_BoardCommentContent(String staff_BoardCommentContent) {
		this.staff_BoardCommentContent = staff_BoardCommentContent;
	}
	public int getStaff_BoardRef() {
		return staff_BoardRef;
	}
	public void setStaff_BoardRef(int staff_BoardRef) {
		this.staff_BoardRef = staff_BoardRef;
	}
	public int getStaff_BoardCommentRef() {
		return staff_BoardCommentRef;
	}
	public void setStaff_BoardCommentRef(int staff_BoardCommentRef) {
		this.staff_BoardCommentRef = staff_BoardCommentRef;
	}
	public Date getStaff_BoardCommentDate() {
		return staff_BoardCommentDate;
	}
	public void setStaff_BoardCommentDate(Date staff_BoardCommentDate) {
		this.staff_BoardCommentDate = staff_BoardCommentDate;
	}
	@Override
	public String toString() {
		return "Staff_BoardComment [staff_BoardCommentNo=" + staff_BoardCommentNo + ", staff_BoardCommentLevel="
				+ staff_BoardCommentLevel + ", staff_BoardCommentWriter=" + staff_BoardCommentWriter
				+ ", staff_BoardCommentContent=" + staff_BoardCommentContent + ", staff_BoardRef=" + staff_BoardRef
				+ ", staff_BoardCommentRef=" + staff_BoardCommentRef + ", staff_BoardCommentDate="
				+ staff_BoardCommentDate + "]";
	}
	
	
	

}
