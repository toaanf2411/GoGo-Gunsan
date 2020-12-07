<%@page import="member.model.vo.Member"%>
<%@page import="board.admin_board.model.vo.AdminBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	AdminBoard board = (AdminBoard) request.getAttribute("board");
	Integer cPage = (Integer) request.getAttribute("cPage");
%>


<script>
	//목록 이동 스크립트
	function list(){
		location.href = "<%=request.getContextPath()%>/gogo-admin/adminBoardList?cPage=<%=cPage%>";
	};




function updateBoard(){
	location.href = "<%=request.getContextPath()%>/board/admin_boardCommon/adminBoardUpdateCommon?boardNo=<%=board.getAdminBoardNo()%>&cPage=<%=cPage%>";
	
}
function deleteBoard(){
	if(!confirm("정말로 삭제하시겠습니까?"))
		return;
	
	$("[name=boardDelFrm]").submit();
	
}
function fileDownload(oName, rName){
	oName = encodeURIComponent(oName);
	console.log(oName);
	
	location.href = "<%=request.getContextPath()%>/board/admin_board/adminBoardFileDownload"
				+ "?oName=" + oName + "&rName=" + rName;

	}
</script>


<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board/boardView.css" />
<div class="gunsan-wrapper">
	<div class="contents-main-container">
		<div class="sub-contents-inner">
			<div class="board-inner">
				<section id="title-element">
					<h1>공지사항</h1>
				</section>
				<section class="board-list-element">
					<div>
						<table id="boardButton">
							<tr>

								
								<td><input type="button" value="수정하기"
									onclick="updateBoard();" /></td>
								<td><input type="button" value="삭제하기"
									onclick="deleteBoard();" /></td>
							
							</tr>
						</table>
					</div>
					<div class="board-view-element">
						<div class="board-view-top">
							<table>
								<tr>
									<th>
										<div class="board-view-subject">
											<%=board.getAdminBoardTitle()%>
										</div>
									</th>
								</tr>
							</table>
							<table class="baord-writer-date">
								<tr>
									<th>작성자</th>
									<td><%=board.getAdminBoardWriter()%></td>
									<th>작성일</th>
									<td><%=board.getAdminBoardDate()%></td>
									<th>조회수</th>
									<td><%=board.getAdminReadCount()%></td>
								</tr>
							</table>
						</div>
						<div class="board-view-body">
							<div class="board-file">
								<table>
									<tr>
										<th>첨부파일</th>
										<td>
											<%
												if (board.getAdminOriginalFileName() != null) {
											%> <!-- 첨부파일이 있을경우만, 이미지와 함께 original파일명 표시 -->
											<a
											href="javascript:fileDownload('<%=board.getAdminOriginalFileName()%>','<%=board.getAdminRenamedFileName()%>');">
												<img alt="첨부파일"
												src="<%=request.getContextPath()%>/images/board/file.png"
												width=16px><%=board.getAdminOriginalFileName()%>
										</a> <% } %>
										</td>
									</tr>
								</table>
							</div>
							<div class="board-content">

								<%=board.getAdminBoardContent()%>

							</div>
						</div>
						<div class="board-view-back">
							<button class="w3-button w3-border w3-round-small"
								id="btn-insert" onclick="list();">목록</button>
						</div>
						<div class="board-view-footer"></div>
					</div>
				</section>

			</div>
		</div>
	</div>
	<%--게시판 뷰 끝 --%>
<!-- 게시물 삭제폼 -->
<form
	action="<%=request.getContextPath()%>/board/admin_boardCommon/adminBoardDeleteCommon"
	method="POST" name="boardDelFrm">
	<input type="hidden" name="boardNo"
		value="<%=board.getAdminBoardNo()%>" /> <input type="hidden"
		name="rName"
		value="<%=board.getAdminRenamedFileName() != null ? board.getAdminRenamedFileName() : ""%>" />
</form>
</div>



