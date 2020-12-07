<%@page import="board.free_board.model.vo.FreeBoardComment"%>
<%@page import="board.free_board.model.vo.FreeBoard"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/board_sidebar.jsp"%>
<% 
	List<FreeBoardComment> commentList = (List)request.getAttribute("list");
	FreeBoard board = (FreeBoard)request.getAttribute("board");
	Integer cPage = (Integer)request.getAttribute("cPage");

	

%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/board/boardView.css" />
<div class="gunsan-wrapper">
	<section id="boardView">

		<div class="contents-main-container">
			<div class="sub-contents-inner">
				<div class="board-inner">
					<section id="title-element">
						<h1>자유게시판</h1>
					</section>
					<section class="board-list-element">
						<div>
							<table id="boardButton">
								<tr>

									<!-- 작성자와 관리자만 마지막행 수정/삭제버튼이 보일수 있게 할 것 -->
									<%if(memberLoggedIn!=null && (board.getFreeBoardWriter().equals(memberLoggedIn.getMemberName())||"A".equals(memberLoggedIn.getGrade()))){ %>
									<td><input type="button" value="수정하기"
										onclick="updateBoard();" /></td>
									<td><input type="button" value="삭제하기"
										onclick="deleteBoard();" /></td>
									<%} %>
								</tr>
							</table>
						</div>
						<div class="board-view-element">
							<div class="board-view-top">
								<table>
									<tr>
										<th>
											<div class="board-view-subject">
												<%=board.getFreeBoardTitle()%>
											</div>
										</th>
									</tr>
								</table>
								<table class="baord-writer-date">
									<tr>
										<th>작성자</th>
										<td><%=board.getFreeBoardWriter()%></td>
										<th>작성일</th>
										<td><%=board.getFreeBoardDate()%></td>
										<th>조회수</th>
										<td><%=board.getFreeReadCount()%></td>
									</tr>
								</table>
							</div>
							<div class="board-view-body">
								<div class="board-file">
									<table>
										<tr>
											<th>첨부파일</th>
											<td>
												<% if(board.getFreeOriginalFileName()!=null) { %> <!-- 첨부파일이 있을경우만, 이미지와 함께 original파일명 표시 -->
												<a
												href="javascript:fileDownload('<%=board.getFreeOriginalFileName()%>','<%=board.getFreeRenamedFileName()%>');">
													<img alt="첨부파일"
													src="<%=request.getContextPath() %>/images/board/file.png"
													width=16px><%=board.getFreeOriginalFileName() %>
											</a> <%} %>
											</td>
										</tr>
									</table>
								</div>
								<div class="board-content">

									<%=board.getFreeBoardContent()%>

								</div>
							</div>
							<div class="board-view-back">
								<button class="w3-button w3-border w3-round-small"
									id="btn-insert" onclick="list();">목록</button>
							</div>
							<div class="board-view-footer">
								<div class="comment-container">
									<%-- text-area 포커스, 등록버튼을 누른 경우 로그인여부를 검사해서 경고창을 띄어줌. --%>
									<div class="comment-editor">
										<form
											action="<%=request.getContextPath()%>/board/free_board/freeBoardCommentInsert"
											method="post" name="boardCommentFrm">
											<input type="hidden" name="boardRef"
												value="<%=board.getFreeBoardNo() %>" /> <input
												type="hidden" name="boardCommentWriter"
												value="<%=memberLoggedIn!=null?memberLoggedIn.getMemberNo():""%>" />
											<input type="hidden" name="boardCommentLevel" value="1" /> <input
												type="hidden" name="boardCommentRef" value="0" />
											<!-- 현재 페이지 정보를 보내야한다. -->
											<input type="hidden" name="cPage" value="<%=cPage %>" />
											<!-- DB는 null로 들어가야한다. -->
											<textarea name="boardCommentContent" cols="60" rows="3"></textarea>
											<button class="w3-button w3-border w3-round-large"
												id="btn-insert">등록</button>
										</form>
									</div>
								</div>

							</div>
						</div>
					</section>

				</div>
			</div>
		</div>

		<%--게시판 뷰 끝 --%>


		<!-- 댓글 목록 테이블 -->
		<table id="tbl-comment">
			<%
	if(commentList != null){
		for(FreeBoardComment bc : commentList){
			if(bc.getFreeBoardCommentLevel() ==1){
	%>
			<tr class="level1">
				<td><sub class="comment-writer"><%=bc.getFreeBoardCommentWriter() %></sub>
					<sub class="comment-date"><%=bc.getFreeBoardCommentDate() %></sub>
					<br /> <%=bc.getFreeBoardCommentContent() %></td>
				<td>
					<button class="btn-reply" value="<%=bc.getFreeBoardCommentNo()%>">답글</button>
					<% if(memberLoggedIn!=null && (board.getFreeBoardWriter().equals(memberLoggedIn.getMemberName())||"A".equals(memberLoggedIn.getGrade()))){%>
					<button class="btn-delete" value="<%=bc.getFreeBoardCommentNo()%>">삭제</button>

					<%} %>
				</td>
			</tr>
			<%
			}else{	
	%>
			<tr class="level2">
				<td><sub class="comment-writer"><%=bc.getFreeBoardCommentWriter() %></sub>
					<sub class="comment-date"><%=bc.getFreeBoardCommentDate() %></sub>
					<br /> <%=bc.getFreeBoardCommentContent() %></td>
				<td>
					<% if(memberLoggedIn != null &&(bc.getFreeBoardCommentWriter().equals(memberLoggedIn.getMemberEmail())|| "A".equals(memberLoggedIn.getGrade()))){ %>
					<button class="btn-delete" value="<%=bc.getFreeBoardCommentNo()%>">삭제</button>


					<%} %>
				</td>
			</tr>

			<%
			}//end of if(level)
		
		}//end of for
	
	}//end of if(commentList)
	%>
		</table>
		<!-- 게시물 삭제폼 -->
		<form
			action="<%=request.getContextPath()%>/board/free_board/freeBoardDelete"
			method="POST" name="boardDelFrm">
			<input type="hidden" name="boardNo"
				value="<%=board.getFreeBoardNo() %>" /> <input type="hidden"
				name="rName"
				value="<%=board.getFreeRenamedFileName()!=null?board.getFreeRenamedFileName():""%>" />
		</form>

	</section>
</div>
<script>
	//목록 이동 스크립트
	function list(){
		location.href = "<%=request.getContextPath()%>/board/free_board/freeBoardList?cPage=<%=cPage%>";
	};


	$(function(){
		$("[name=boardCommentContent]").click(function(){
			if(<%=memberLoggedIn == null%>){
				loginAlert();
			}
		});
		
		$("[name=boardCommentFrm]").submit(function(e){
			//로그인 여부 검사
			if(<%=memberLoggedIn == null%>){
				loginAlert();
				return false;
			}
			
			//내용검사
			var content = $("[name=boardCommentContent]").val().trim();
			if(content.length == 0){
				return false;				
			}
			return true;
		});
	});
	function loginAlert(){
		alert("로그인후 이용하실 수 있습니다.");
		$("#login-memberId").focus();
	};
	
//삭제 버튼클릭시, 댓글 삭제후에 현재페이지로 돌아오기
$(".btn-delete").click(function(){
	if(!confirm("정말 삭제하시겠습니까?"))
		return;
	
	location.href = "<%=request.getContextPath()%>/board/free_board/freeBoardCommentDelete?boardNo=<%=board.getFreeBoardNo()%>&cPage=<%=cPage%>&delNo="+$(this).val();
	
});
$(".btn-reply").click(function(){
	<% if(memberLoggedIn!=null){%>
		//현재댓글 번호
		var boardCommentNo = $(this).val();
		//답글작성폼 생성
		var tr = $("<tr></tr>");
		var td = $("<td style = 'display:none; text-align:left;' colspan='2'></td>")
		var form = $("<form action='<%=request.getContextPath()%>/board/free_board/freeBoardCommentInsert' method='POST'></form>");
		form.append("<input type='hidden' name='boardRef' value='<%=board.getFreeBoardNo()%>'/>");
		form.append("<input type='hidden' name='boardCommentWriter' value='<%=memberLoggedIn!=null?memberLoggedIn.getMemberNo():""%>'/>");
		form.append("<input type='hidden' name='boardCommentLevel' value='2'/>");
		form.append("<input type='hidden' name='boardCommentRef' value='"+boardCommentNo+"'/>");
		form.append("<input type='hidden' name='cPage' value='<%=cPage%>'/>");
		form.append("<textarea name = 'boardCommentContent' cols='60' rows='1'></textarea>");
		form.append("<button type='submit' class='btn-insert2'>등록</button>");
		td.html(form);
		tr.html(td);
		//노드 추가하는 메소드
		//tr>td.btn-reply
		tr.insertAfter($(this).parent().parent()).children("td").slideDown(800).children("form")
			.submit(function(e){
				let content = $(this).children("textarea").val().trim();
				if(content.length ==0)
					e.preventDefault();
				})
				.find("textarea").focus();
		//클릭이벤트 한번 실행후에는 핸들러 제거
		//this는 버튼 가리킴 .btn-reply
		$(this).off('click');
	<%} else {%>
		loginAlert();
	<%}%>
	});

function updateBoard(){
	location.href = "<%=request.getContextPath()%>/board/free_board/freeBoardUpdate?boardNo=<%=board.getFreeBoardNo()%>&cPage=<%=cPage%>";
	
}
function deleteBoard(){
	if(!confirm("정말로 삭제하시겠습니까?"))
		return;
	
	$("[name=boardDelFrm]").submit();
	
}
function fileDownload(oName, rName){
	oName = encodeURIComponent(oName);
	console.log(oName);
	
	location.href = "<%=request.getContextPath()%>/board/free_board/freeBoardFileDownload"+ "?oName=" + oName + "&rName=" + rName;

	}
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
