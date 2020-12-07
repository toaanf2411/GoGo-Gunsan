<%@page import="tour_staff.model.vo.Staff"%>
<%@page import="member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//로그인 확인 
	Staff staffLoggedIn = (Staff)session.getAttribute("staffLoggedIn");
	// /mvc/index.jsp => memberLoggeIn =null;
	// /mvc/member/login => memberLoggIn = member객체
			
	//쿠키확인
	Cookie[] cookies = request.getCookies();
	boolean saveIdChecked = false;
	String saveStaffEmail = "";
	
	if(cookies != null){
		//System.out.println("cookies@header.jsp");
		//System.out.println("===================================");
		for(Cookie c : cookies){
			String name = c.getName();
			String value = c.getValue();
			//System.out.println(name+" = "+ value);
			
			if("saveStaffEmail".equals(name)){  
				saveIdChecked = true;
				saveStaffEmail = value;
			}
		}
		//System.out.println("===================================");
	}
%>
<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/admin/adminDashboard.css" />
<script src="<%=request.getContextPath() %>/js/jquery-3.4.1.js"></script>

<title>admin dashboard</title>
<style>
.logout-link{
  display: block;
  position: relative;
  padding: 20px;
  float: right;
  text-decoration: none;
  color: #0b0b0b;

}
</style>
</head>

<body>
	<!-- ============================================================== -->
	<!-- main wrapper -->
	<!-- ============================================================== -->
	<div class="dashboard-main-wrapper">
		<!-- ============================================================== -->
		<!-- navbar -->
		<!-- ============================================================== -->
		<div class="dashboard-header">
			<nav class="navbar navbar-expand-lg bg-white fixed-top">
				<a class="navbar-brand" href="<%=request.getContextPath()%>/gogo-admin/adminLoginEnd">
					<img src="<%=request.getContextPath() %>/images/logo/gogo_gunsan.png" width="160px" style="color: aliceblue"alt="">
				</a>
				<a class="logout-link" href="<%=request.getContextPath()%>/gogo-admin/adminLogout">로그아웃</a>
				<a class="logout-link"href="<%=request.getContextPath()%>/">GOGO GUNSAN</a>
			</nav>
		</div>
		<!-- ============================================================== -->
		<!-- end navbar -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- left sidebar -->
		<!-- ============================================================== -->
		<div class="nav-left-sidebar sidebar-dark">
			<section class="app">
				<aside class="sidebar">
					<nav class="sidebar-nav">

						<ul>
							<%--게시판관리 메뉴 시작 --%>
							<li><a href="#"><svg xmlns="http://www.w3.org/2000/svg"
										x="0px" y="0px" width="23" viewBox="0 0 172 172"
										style="fill: #000000;">
                                        <g fill="none"
											fill-rule="nonzero" stroke="none" stroke-width="1"
											stroke-linecap="butt" stroke-linejoin="miter"
											stroke-miterlimit="10" stroke-dasharray=""
											stroke-dashoffset="0" font-family="none" font-weight="none"
											font-size="none" text-anchor="none"
											style="mix-blend-mode: normal">
                                            <path
											d="M0,172v-172h172v172z" fill="none"></path>
                                            <g fill="#ffffff">
                                                <path
											d="M118.45673,0c-2.14483,0 -4.36719,0.85276 -5.99519,2.48077l-9.50962,9.50962l23.77404,23.98077l9.71635,-9.71635c3.28185,-3.25601 3.30769,-8.5018 0,-11.78365l-11.99038,-11.99038c-1.65385,-1.65385 -3.85036,-2.48077 -5.99519,-2.48077zM94.26923,19.22596l-38.65865,38.86538c-0.49099,0.4393 -1.05949,0.98197 -1.24038,1.65385l-8.26923,28.32212c-0.10337,0.33594 -0.20673,0.69772 -0.20673,1.03365c0,0.93029 0.36178,1.8089 1.03365,2.48077c0.90445,0.90445 2.27404,1.18871 3.51442,0.82692l28.52885,-8.26923c0.69772,-0.20673 1.21454,-0.72356 1.65385,-1.24038l38.65865,-38.65865zM6.61538,39.69231c-3.64363,0 -6.61538,2.97176 -6.61538,6.61538v79.38462c0,3.64363 2.97176,6.61538 6.61538,6.61538h158.76923c3.64363,0 6.61538,-2.97176 6.61538,-6.61538v-79.38462c0,-3.64363 -2.97176,-6.61538 -6.61538,-6.61538h-27.70192l-13.23077,13.23077h34.31731v66.15385h-145.53846v-66.15385h33.07692l13.23077,-13.23077zM60.77885,63.25962l12.19712,2.48077l2.48077,11.99038l-16.125,4.75481l-3.30769,-3.30769z">
                                                </path>
                                    </svg> <span class="menu-name">관광지게시판
										관리</span> </a>
								<ul class="nav-flyout">
									<li><a href="<%=request.getContextPath()%>/gogo-admin/staff/staffBoardList?staffNo=<%=staffLoggedIn.getStaffNo()%>"><i class="ion-ios-color-filter-outline"></i>내가쓴글보기</a></li>
									</li>
						
								</ul></li>
							<%--게시판관리 메뉴 끝 --%>
							<%--예약현황관리 메뉴 시작 --%>
							<li><a href="#"><svg xmlns="http://www.w3.org/2000/svg"
										x="0px" y="0px" width="32" height="32" viewBox="0 0 172 172"
										style="fill: #000000;">
                                        <g fill="none"
											fill-rule="nonzero" stroke="none" stroke-width="1"
											stroke-linecap="butt" stroke-linejoin="miter"
											stroke-miterlimit="10" stroke-dasharray=""
											stroke-dashoffset="0" font-family="none" font-weight="none"
											font-size="none" text-anchor="none"
											style="mix-blend-mode: normal">
                                            <path
											d="M0,172v-172h172v172z" fill="none"></path>
                                            <g fill="#ffffff">
                                                <path
											d="M59.125,21.5c-8.84171,0 -16.125,7.28329 -16.125,16.125v80.625h-21.5v16.125c0,8.83193 7.29307,16.125 16.125,16.125h75.25c8.84171,0 16.125,-7.28329 16.125,-16.125v-75.25h21.5v-21.5c0,-8.83193 -7.29307,-16.125 -16.125,-16.125zM59.125,32.25h60.13281c-0.61099,1.69195 -1.00781,3.48594 -1.00781,5.375v96.75c0,3.03704 -2.33796,5.375 -5.375,5.375c-3.34782,0 -5.375,-2.02718 -5.375,-5.375v-16.125h-53.75v-80.625c0,-3.03704 2.33796,-5.375 5.375,-5.375zM134.375,32.25c3.34782,0 5.375,2.02718 5.375,5.375v10.75h-10.75v-10.75c0,-3.34782 2.02718,-5.375 5.375,-5.375zM64.5,48.375v10.75h43v-10.75zM64.5,69.875v10.75h43v-10.75zM64.5,91.375v10.75h26.875v-10.75zM32.25,129h64.5v5.375c0,2.08746 1.50773,3.53544 2.24658,5.375h-61.37158c-3.34782,0 -5.375,-2.02718 -5.375,-5.375z">
                                                </path>
                                            </g>
                                        </g>
                                    </svg> <span class="menu-name">예약현황</span> </a>
								<ul class="nav-flyout">
									<li><a href="<%=request.getContextPath() %>/gogo-admin/adminStaffReservation"><i
											class="ion-ios-color-filter-outline"></i>예약현황보기</a></li>
									<li><li><i class="ion-ios-clock-outline"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
								</ul>
							</li>
							<%--예약현황관리 메뉴 끝 --%>

						</ul>
					</nav>
				</aside>
			</section>
		</div>
		<!-- ============================================================== -->
		<!-- end left sidebar -->
		<!-- ============================================================== -->