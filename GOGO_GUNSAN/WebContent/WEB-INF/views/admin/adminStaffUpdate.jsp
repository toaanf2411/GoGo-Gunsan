<%@page import="tour_staff.model.vo.Staff"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Staff updatedStaff = (Staff)request.getAttribute("updateStaff");
	String pageBar = (String) request.getAttribute("pageBar");
%>
<%@ include file="/WEB-INF/views/admin/common/adminHeader.jsp"%>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/admin/searchbox.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/admin/memberUpdate.css" />

<style>
div#search-container {
	margin: 0 0 10px 0;
	padding: 3px;
	text-align: center;
}

div#search-staffEmail {
	display: inline-block;
}

div#search-staffName {
	display: none;
}

div#search-staffNo {
	display: none;
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
<!-- ============================================================== -->
<!-- wrapper  -->
<!-- ============================================================== -->
<div class="dashboard-wrapper">
	
	<%--테이블 시작 --%>
	<div class="update-container" id="update-container">
		<div class="update-form-container member-update-container">
			<form action="<%=request.getContextPath()%>/gogo-admin/staffUpdateEnd" class="member-form" >
				<h1>스태프 정보수정</h1>
				<table>
					<tr>
						<th>스태프번호</th>
						<td><input class="update-input-box" type="text"
							name="staffNo" id="staffNo" style="background-color: white;"
							value="<%=updatedStaff.getStaffNo()%>" readonly /></td>
					</tr>
					<tr>
						<th>관광지아이디</th>
						<td><input type="text" class="update-input-box"
							name="tourInfoId" id="tourInfoId" style="background-color: white;"
							value="<%=updatedStaff.getTourInfoId()%>" readonly /></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input class="update-input-box" type="email"
							name="staffEmail" id="staffEmail"
							style="background-color: white;"
							value="<%=updatedStaff.getStaffEmail()%>" readonly /></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input class="update-input-box" type="text"
							name="password" id="staffPassword"
							value="" required /></td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td><input class="update-input-box" type="text"
							name="password" id="staffPassword_2" required /></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input class="update-input-box" type="text"
							name="name" value="<%=updatedStaff.getName()%>"
							required /></td>
					</tr>
					<tr>
						<th>휴대폰</th>
						<td><input type="tel" class="update-input-box" name="phone"
							id="phone" maxlength="11" value="<%=updatedStaff.getPhone()%>"
							required></td>
					</tr>	
			

				</table>
				<input type="submit" class="update-button" value="수정하기" />
			</form>
		</div>
	</div>
	<%--테이블 끝 --%>

</div>
<%@ include file="/WEB-INF/views/admin/common/adminFooter.jsp"%>