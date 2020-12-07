<%@page import="member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
 <%
 	//로그인 확인 
	Member memberLoggedIn = (Member)session.getAttribute("memberLoggedIn");
	// /mvc/index.jsp => memberLoggeIn =null;
	// /mvc/member/login => memberLoggIn = member객체
			
	//쿠키확인
	Cookie[] cookies = request.getCookies();
	boolean saveIdChecked = false;
	String memberId = "";
	
	if(cookies != null){
		//System.out.println("cookies@header.jsp");
		//System.out.println("===================================");
		for(Cookie c : cookies){
			String name = c.getName();
			String value = c.getValue();
			//System.out.println(name+" = "+ value);
			
			if("saveId".equals(name)){  
				saveIdChecked = true;
				memberId = value;
			}
		}
		//System.out.println("===================================");
	}
			
%>
<html>
<head>
	<title>고고군산 메인</title>
	<!-- 제이쿼 -->
	<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.js"></script>


	<!--  fontawesome cdn-->
	<script src="https://kit.fontawesome.com/226b55f414.js" crossorigin="anonymous"></script>
	
	<!-- 나눔고딕글 -->
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&display=swap&subset=korean" rel="stylesheet">
	
	<!--헤더 css -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/common/header.css">
	
	<!--  w3 css  -->
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
	<header>
		<div class="head_center">
			<a href="<%=request.getContextPath()%>/"><img class ="header_logo" src="<%=request.getContextPath()%>/images/main/GOGO_GUNSAN_LOGO.png" alt="고고군산 로고" ></a>
			
			<% if(memberLoggedIn != null){ 
				System.out.println(memberLoggedIn);
			%>
			<%--로그인한 경우 --%>
			 
				<table class="login_table">
					<tr>
						<td>
						<div class="search-box">
       						<input type="text" placeholder=" "/>
       						<span></span>
   				 		</div>
						</td>
						<td>
							<i class="fas fa-sign-out-alt"></i>
							<a href ="<%=request.getContextPath()%>/member/memberLogout">  로그아웃 </a>
						</td>
						<td>
						<i class="fas fa-user-circle"></i>
							<a href ="<%=request.getContextPath()%>/member/memberViewGo">  마이페이지</a>
						</td>
					</tr>
				</table>
			<%}else{ %>
				<%--로그인을 안한경우 --%>
				<table class="login_table">
					<tr>
						<td>
							<div class="search-box">
       						 <input type="text" placeholder=" "/>
       						 <span></span>
   							 </div>
						</td>
						<td>
							<i class="fas fa-user"></i>
							<a href ="<%=request.getContextPath()%>/member/memberLoginGo">  로그인</a>
						</td>	
					</tr>
				</table>
			<%}%>   
				<nav class="header_menu">
					<a href="<%=request.getContextPath()%>/intro/GunsanManinIntroGo">관광지 소개</a>
					<a href="<%=request.getContextPath()%>/course/museumCourseGo">추천코스</a>
					<a href="<%=request.getContextPath()%>/reservation/AllReservationGo">통합예약</a>
					<a href="<%=request.getContextPath()%>/service/TourServiceGo">맞춤서비스</a>
					<a href="<%=request.getContextPath()%>/board/admin_board/adminBoardList">군산이야기</a>
				</nav>
			</div>
	</header>

	