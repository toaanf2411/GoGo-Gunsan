<%@page import="board.staff_board.model.vo.Staff_Board"%>
<%@page import="board.staff_board.model.vo.Staff_BoardComment"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="/WEB-INF/views/admin/common/adminHeader.jsp" %>
<% 

	Integer cPage = (Integer)request.getAttribute("cPage");
	Staff_Board board = (Staff_Board) request.getAttribute("board");


%>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/board/boardView.css" />
	<div class="dashboard-wrapper">
<div class="gunsan-wrapper">
	<section id="boardView">

		<div class="contents-main-container">
			<div class="sub-contents-inner">
				<div class="board-inner">
					<section id="title-element">
						<h1>관광지 공지사항</h1>
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
												<%=board.getStaff_BoardTitle()%>
											</div>
										</th>
									</tr>
								</table>
								<table class="baord-writer-date">
									<tr>
										<th>작성자</th>
										<td><%=board.getStaff_BoardWriter() %></td>
										<th>작성일</th>
										<td><%=board.getStaff_BoardDate()%></td>
										<th>조회수</th>
										<td><%=board.getStaff_ReadCount()%></td>
									</tr>
								</table>
							</div>
							<div class="board-view-body">
								<div class="board-file">
									<table>
										<tr>
											<th>첨부파일</th>
											<td>
												<% if(board.getStaff_OriginalFileName()!=null) { %> <!-- 첨부파일이 있을경우만, 이미지와 함께 original파일명 표시 -->
												<a
												href="javascript:fileDownload('<%=board.getStaff_OriginalFileName()%>','<%=board.getStaff_RenamedFileName()%>');">
													<img alt="첨부파일"
													src="<%=request.getContextPath() %>/images/board/file.png"
													width=16px><%=board.getStaff_OriginalFileName() %>
											</a> <%} %>
											</td>
										</tr>
									</table>
								</div>
								<div class="board-content">

									<%=board.getStaff_BoardContent()%>

								</div>
							</div>
							<div class="board-view-back">
								<button class="w3-button w3-border w3-round-small"
									id="btn-insert" onclick="list();">목록</button>
							</div>
							<div class="board-view-footer">
							
							</div>
						</div>
					</section>

				</div>
			</div>
		</div>

		<%--게시판 뷰 끝 --%>

		<!-- 게시물 삭제폼 -->
		<form
			action="<%=request.getContextPath()%>/gogo-admin/staffBoardDelete"
			method="POST" name="boardDelFrm">
			<input type="hidden" name="boardNo"
				value="<%=board.getStaff_BoardNo() %>" /> <input type="hidden"
				name="rName"
				value="<%=board.getStaff_RenamedFileName()!=null?board.getStaff_RenamedFileName():""%>" />
		</form>

	</section>
</div>
</div>
<script>
	//목록 이동 스크립트
	function list(){
		location.href = "<%=request.getContextPath()%>/gogo-admin/staffBoardList?cPage=<%=cPage%>";
	};



	function loginAlert(){
		alert("로그인후 이용하실 수 있습니다.");
		$("#login-memberId").focus();
	};
	


function updateBoard(){
	location.href = "<%=request.getContextPath()%>/gogo-admin/staffBoardUpdate?boardNo=<%=board.getStaff_BoardNo()%>&cPage=<%=cPage%>";
	
}
function deleteBoard(){
	if(!confirm("정말로 삭제하시겠습니까?"))
		return;
	
	$("[name=boardDelFrm]").submit();
	
}
function fileDownload(oName, rName){
	oName = encodeURIComponent(oName);
	console.log(oName);
	location.href = "<%=request.getContextPath()%>/board/staff_board/staff_BoardFileDownload"+ "?oName=" + oName + "&rName=" + rName;

	}
</script>
<%@ include file="/WEB-INF/views/admin/common/adminFooter.jsp" %>
	