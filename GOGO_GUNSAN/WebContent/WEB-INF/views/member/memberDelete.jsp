<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- mypage css -->
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="gunsan-wrapper">
	<h1>회원탈퇴</h1>
<form action="<%=request.getContextPath()%>/member/memberDelete" method="post">
<h3>회원 탈퇴 하시겠습니까?</h3>
<input type="submit" value="회원탈퇴"><br>
<input type="hidden" name="memberNo" value="<%=memberLoggedIn.getMemberNo()%>">
</form>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>