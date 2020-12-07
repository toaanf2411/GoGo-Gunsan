<%@page import="tour_staff.model.vo.Staff"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<Staff> list = (List<Staff>) request.getAttribute("list");
	String srchType = request.getParameter("searchType");
	String srchKeyword = request.getParameter("searchKeyword");
%>
<%@ include file="/WEB-INF/views/admin/common/adminHeader.jsp"%>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/admin/memberListMain.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/admin/searchbox.css" />

<style>
div#search-container {
	margin: 0 0 10px 0;
	padding: 3px;
	text-align: center;
}

div#search-staffEmail {
	display: <%="staffEmail".equals(srchType) ? "inline-block" : "none"%>;
}

div#search-staffNo {
	display: <%="staffNo".equals(srchType) ? "inline-block" : "none"%>;
}

div#search-staffName {
	display: <%="staffName".equals(srchType) ? "inline-block" : "none"%>;
}
</style>
<script>
	$(function() {
		let $staffEmail = $("#search-staffEmail");
		let $staffName = $("#search-staffName");
		let $staffNo = $("#search-staffNo");
		console.log($staffName);
		console.log($staffNo);
		$("#searchType").change(function() {
			$staffEmail.hide();
			$staffName.hide();
			$staffNo.hide();

			let selected = $(this).val();
			console.log(selected);
			$("#search-" + selected).css("display", "inline-block");
		});
	});
</script>
<div class="dashboard-wrapper">
	<div id="search-container">
		검색타입 : <select id="searchType">
			<option value="staffEmail"
				<%="staffEmail".equals(srchType) ? "selected" : ""%>>이메일</option>
			<option value="staffNo" <%="staffNo".equals(srchType) ? "selected" : ""%>>스태프번호</option>
			<option value="staffName" <%="staffName".equals(srchType) ? "selected" : ""%>>스태프명</option>
		</select>
		<div id="search-staffEmail">
			<form action="<%=request.getContextPath()%>/gogo-admin/staffFinder">
				<input type="hidden" name="searchType" value="staffEmail" />
				<div class="search__container">
					<input type="text" class="search__input" name="searchKeyword"
						placeholder="검색할 이메일 주소를 입력하세요."
						value="<%="staffEmail".equals(srchType) ? srchKeyword : ""%>">
				</div>
			</form>
		</div>
		<div id="search-staffNo">
			<form action="<%=request.getContextPath()%>/gogo-admin/staffFinder">
				<input type="hidden" name="searchType" value="staffNo" />
				<div class="search__container">
					<input type="text" class="search__input" name="searchKeyword"
						placeholder="검색할 스태프번호를 입력하세요."
						value="<%="staffNo".equals(srchType) ? srchKeyword : ""%>">
				</div>
			</form>
		</div>
		<div id="search-staffName">
			<form action="<%=request.getContextPath()%>/gogo-admin/staffFinder">
				<input type="hidden" name="searchType" value="staffName" />
				<div class="search__container">
					<input type="text" class="search__input" name="searchKeyword"
						placeholder="검색할 스태프명을 입력하세요."
						value="<%="staffName".equals(srchType) ? srchKeyword : ""%>">
				</div>
			</form>
		</div>
	</div>
	<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">

				<div class="table100 ver2 m-b-110">
					<div class="table100-head">
						<table>
							<thead>
								<tr class="row100 head">
									<th class="cell100 column0">No.</th>
									<th class="cell100 column1">스태프번호</th>
									<th class="cell100 column2">이메일</th>
									<th class="cell100 column3">이름</th>
									<th class="cell100 column4">전화번호</th>
									<th class="cell100 column5">가입일</th>
									<th class="cell100 column6">관광지아이디</th>
									<th class="cell100 column7">정보수정</th>
								</tr>
							</thead>
						</table>
					</div>

					<div class="table100-body js-pscroll">
						<table>
							<tbody>
								<%
									if (list == null || list.isEmpty()) {
								%>
								<tr>
									<td colspan="10" align="center">검색 결과가 없습니다.</td>
								</tr>
								<%
									} else {
										int i = 0;
										for (Staff s : list) {
											i++;
								%>
								<tr class="row100 body">
									<td class="cell100 column0"><%=i%></td>
									<td class="cell100 column1"><%=s.getStaffNo()%></td>
									<td class="cell100 column2"><%=s.getStaffEmail()%></td>
									<td class="cell100 column3"><%=s.getName()%></td>
									<td class="cell100 column4"><%=s.getPhone()%></td>
									<td class="cell100 column5"><%=s.getEnrollDate()%></td>
									<td class="cell100 column6"><%=s.getTourInfoId()%></td>
									<td class="cell100 column7">
										<form
											action="<%=request.getContextPath()%>/gogo-admin/staffUpdate"
											method="POST" onsubmit="">
											<input type="hidden" name="staffEmail"
												value="<%=s.getStaffEmail()%>" /> <input type="submit"
												class="update-button" value="수정" tabindex="3" />
										</form>
										<form
											action="<%=request.getContextPath()%>/gogo-admin/staffDelete"
											method="POST" onsubmit="">
											<input type="hidden" name="staffEmail"
												value="<%=s.getStaffEmail()%>" /> <input type="submit"
												class="update-button" value="삭제" tabindex="3" />
										</form>
									</td>
								</tr>
								<%
									}
									}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/admin/common/adminFooter.jsp"%>
