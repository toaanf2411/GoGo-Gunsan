<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//쿠키확인
	Cookie[] cookies = request.getCookies();
	boolean adminSaveIdChecked = false;
	boolean staffSaveIdChecked = false;
	String saveAdminEmail = "";
	String saveStaffEmail ="";
	if (cookies != null) {
		//System.out.println("cookies@header.jsp");
		//System.out.println("===================================");
		for (Cookie c : cookies) {
			String name = c.getName();
			String value = c.getValue();
			//System.out.println(name+" = "+ value);

			if ("saveAdminEmail".equals(name)) {
				adminSaveIdChecked = true;
				staffSaveIdChecked = false;
				saveAdminEmail = value;
			}
			if("saveStaffEmail".equals(name)){
				staffSaveIdChecked = true;
				adminSaveIdChecked = false;
				saveStaffEmail = value;
			}
		}
		//System.out.println("===================================");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/admin/adminlogin.css" />
<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.js"></script>
<script>
	function loginValidate() {

		let $email = $("#login-memberEmail").val();
		let $password = $("#login-password").val();
		var regExp1 = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;

		console.log($email);
		console.log($password);
<%--if(!regExp1.test($email)){
		alert("올바를 이메일주소를 입력해주세요.")
		return;
	}--%>
	if ($password.length < 4) {
			alert("올바른 비밀번호를 입력해주세요.");
			return;
		}

	};
</script>
</head>
<body>
	<div class="container" id="container">
		<div class="form-container sign-in-container">
			<%--버튼 클릭시 /src/admin/controller/AdminLoginEnd.java 로 간다.  --%>
			<form action="<%=request.getContextPath()%>/gogo-admin/adminLoginEnd"
				id="adminLoginFrm" method="POST" onsubmit="return loginValidate();">
				<h1>로그인</h1>

				<span>관리자 or 관광지 스태프</span> 
				<input class="input-form" type="email" name="email" placeholder="Email" value='<% if(adminSaveIdChecked) { %> <%=saveAdminEmail %>
																									<% }else if(staffSaveIdChecked){ %> <%=saveStaffEmail %> <% }else{ %> <% }%> '/> 
				<input class="input-form" type="password" name="password" placeholder="Password" />
				<table>
					<tr>
						<td>
						<input type="checkbox" style="float: left;" name="saveAdminEmail"id="saveAdminEmail" <%=adminSaveIdChecked||staffSaveIdChecked ? "checked" : ""%> /> 
						<label for="saveId" style="font-size: 11px; float: left;">아이디 저장</label>
						</td>
					</tr>
				</table>
				<%--관리자 or 관광지 로그인 버튼  --%>
				<div class="login-button-container">
					<input type="submit" class="login-button" value="로그인" tabindex="3" />
				</div>
		</form>
	</div>

	</div>




</body>
</html>