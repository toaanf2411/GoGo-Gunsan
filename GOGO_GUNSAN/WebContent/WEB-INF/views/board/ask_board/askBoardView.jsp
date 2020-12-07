<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board/board.css" />
<%@ include file="/WEB-INF/views/common/board_sidebar.jsp"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<style>
#ask1 {
	font-size: 16px;
}

#ask2 {
	font-size: 16px;
}

#ask3 {
	font-size: 16px;
}

#ask4 {
	font-size: 16px;
}

#ask5 {
	font-size: 16px;
}

.answer1 {
	position: relative;
	display: none;
	font-size: 16px;
	/* margin-left: auto;
                margin-right: auto;     */
}

.answer2 {
	position: relative;
	display: none;
	font-size: 16px;
	/* margin-left: auto;
                margin-right: auto;     */
}

.answer3 {
	position: relative;
	display: none;
	font-size: 16px;
	/* margin-left: auto;
                margin-right: auto;     */
}

.answer4 {
	position: relative;
	display: none;
	font-size: 16px;
	/* margin-left: auto;
                margin-right: auto;     */
}

.answer5 {
	position: relative;
	display: none;
	font-size: 16px;
	/* margin-left: auto;
                margin-right: auto;     */
}
</style>

<!-- 아코디언 -->
<script>
	$(function() {

		$("#ask1").click(function() {
			//$("#river1").toggle();
			$(".answer1").toggle(500, "linear", function() {
			});
		});

		$("#ask2").click(function() {
			//$("#river1").toggle();
			$(".answer1").hide(500, "linear", function() {
				$(".answer2").toggle(500, "linear", function() {

				});
			});
		});
		$("#ask3").click(function() {
			//$("#river1").toggle();
			$(".answer2").hide(500, "linear", function() {
				$(".answer3").toggle(500, "linear", function() {

				});
			});
		});

		$("#ask4").click(function() {
			//$("#river1").toggle();
			$(".answer3").hide(500, "linear", function() {
				$(".answer4").toggle(500, "linear", function() {

				});
			});
		});
		$("#ask5").click(function() {
			//$("#river1").toggle();
			$(".answer4").hide(500, "linear", function() {
				$(".answer5").toggle(500, "linear", function() {

				});
			});
		});
	});
</script>

<div class="gunsan-wrapper">
	<section id="board-container">
		<h1>자주 묻는 질문</h1>
		<table id="tbl-list">
			<tr id="tbl-th-list">
				<th id="board-no">글번호</th>
				<th id="board-title">제목</th>
				<th id="board-file">첨부</th>
				<th id="board-writer">작성자</th>
				<th id="board-date">작성일</th>
				<th id="board-readCount">조회수</th>
			</tr>

			<tr>
				<td colspan="10" align="left" id="ask1">Q. 군산 관광지를 가기 위해서는 어떻게
					가야하나요?</td>
				<br>
				<br>
			</tr>
			<tr>
				<td colspan="10" align="left" class="answer1">A. 버스타고 오시면 됩니다</td>
			</tr>
			<tr>
				<td><br></td>
			</tr>
			<tr>
				<td colspan="10" align="left" id="ask2">Q. 관광에 궁금한 사항이 있으면 어디로
					문의하면 되나요?</td>
			</tr>
			<tr>
				<td colspan="10" align="left" class="answer2">A. 9494로 전화하시면 질의
					응답을 해드리겠습니다</td>
			</tr>
			<tr>
				<td><br></td>
			</tr>
			<tr>
				<td colspan="10" align="left" id="ask3">Q. 군산 관광지 요금은 얼마인가요?</td>
			</tr>

			<tr>
				<td colspan="10" align="left" class="answer3">A. 예약 시스템에 들어가면
					있습니다.</td>
			</tr>
			<tr>
				<td><br></td>
			</tr>
			<tr>
				<td colspan="10" align="left" id="ask4">Q. 군산 관광지를 처음 방문하려고
					합니다. 가볼만한 곳을 추천해주세요</td>
			</tr>

			<tr>
				<td colspan="10" align="left" class="answer4">A. 추천 시스템이 있으니 추천
					시스템을 이용해보시길 바립니다.</td>
			</tr>
			<tr>
				<td><br></td>
			</tr>
			<tr>
				<td colspan="10" align="left" id="ask5">Q. 군산시를 대표하는 음식이 무엇이
					있나요?</td>
			</tr>

			<tr>
				<td colspan="10" align="left" class="answer5">A. 잘 찾아보세요</td>
			</tr>

		</table>

	</section>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>