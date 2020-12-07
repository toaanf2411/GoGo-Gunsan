package board.admin_board.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class AdminBoardComment implements Serializable{
	

	private static final long serialVersionUID = 1L;
	
	private int boardCommentNo;
	private int boardCommentLevel;
	private String boardCommentWriter;
	private String boardCommentContent;
	private int boardRef;
	private int boardCommentRef;
	private Date boardCommentDate;

}
