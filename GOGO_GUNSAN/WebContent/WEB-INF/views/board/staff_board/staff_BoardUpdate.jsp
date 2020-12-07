<%@page import="board.staff_board.model.vo.Staff_BoardComment"%>
<%@page import="board.staff_board.model.vo.Staff_Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Staff_Board b = (Staff_Board) request.getAttribute("board");
	Integer cPage = (Integer) request.getAttribute("cPage");
%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<script>
	function boardValidate() {
		var content = $("[name=content]").val();
		//console.log(content.length)
		if (content.trim().length == 0) {
			alert("내용을 입력하세요");
			return false;
		}
		return true;
	}
	function boardView() {
		history.go(-1);
	}
</script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/board/boardForm.css">
<section id="boardUpdate">
	<div id="board-view">
		<form
			action="<%=request.getContextPath()%>/board/staff_board/staff_BoardUpdateEnd"
			method="post" enctype="multipart/form-data">
			<!-- 반드시 선언해야 입출력이 가능하다.  -->
			<input type="hidden" name="boardNo" value="<%=b.getStaff_BoardNo() %>"/>
			<input type="hidden" name="cPage" value="<%=cPage%>" />
			<table id="tbl-board-view">
				<tr>
					<td colspan="2" id="title">게시물수정</td>
				</tr>
				<tr>
					<td>
						<table id="tbl-board-content">
							<tr>
								<th>제 목</th>
								<td><input type="text" name="boardTitle" id="boardTitle"
									value="<%=b.getStaff_BoardTitle()%>" required></td>
							</tr>
							<tr>
								<th>작성자</th>
								<td><input type="text" name="boardWriterView"
									value="<%=b.getStaff_BoardWriter()%>" readonly /></td>
							</tr>
							<tr>
								<th>첨부파일</th>
								<td><input type="file" name="upFile"> <span
									id="fname"><%=b.getStaff_OriginalFileName() != null ? b.getStaff_OriginalFileName() : ""%></span>
									<%-- 기존첨부파일 유지를 위해 기존 파일명을 hidden으로 전송한다. --%> <input
									type="hidden" name="oldOriginalFileName"
									value="<%=b.getStaff_OriginalFileName() != null ? b.getStaff_OriginalFileName() : ""%>" />
									<input type="hidden" name="oldRenamedFileName"
									value="<%=b.getStaff_RenamedFileName() != null ? b.getStaff_RenamedFileName() : ""%>" />
								</td>
							</tr>
							<tr>
								<th>내 용</th>
								<td><textarea rows="5" cols="50" name="boardContent"
										id="boardContent"><%=b.getStaff_BoardContent()%></textarea></td>
							</tr>
						</table>


					</td>
				</tr>
				<tr>
					<th colspan="2" id="footer"><input type="submit" value="수정하기"
						onclick="return boardValidate();"> <input type="button"
						value="취소" onclick="boardView();"></th>
				</tr>

			</table>
		</form>
	</div>
	<script>
		$(function() {
			$("[name=upFile]").change(function() {
				let fname = $(this).val();
				//첨부파일이 있는 경우
				if (fname != "") {
					$("#fname").hide();
				}
				//첨부파일이 없는 경우
				else {
					$("#fname").show();
				}
			});
		});
	</script>
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
