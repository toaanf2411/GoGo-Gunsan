<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/main/main.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/intro/intro.css">
<!-- 헤더 선언!!-->
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!-- 사이드메뉴 선언!  -->
<%@ include file="/WEB-INF/views/common/intro_sidebar.jsp" %>
<style>
img{

	width: 70%;
}
</style>  
<div class="gunsan-wrapper">
	<img src="<%=request.getContextPath() %>/images/intro/gunsanIntro.png" alt="" />
</div>
<!-- 풋터 선언!!-->
<%@ include file="/WEB-INF/views/common/footer.jsp"%>	