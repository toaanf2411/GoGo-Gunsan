<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/main/main.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/intro/intro.css">
<!-- 헤더 선언!!-->
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!-- 사이드메뉴 선언!  -->
<%@ include file="/WEB-INF/views/common/intro_sidebar.jsp"%>

<div class="gunsan-wrapper">
	<div class="gunsan-page-title">
		<nav id="topMenu">
			<ul>
				<li><a class="menuLink"
					href="<%=request.getContextPath()%>/intro/GunsInfoGo">전체</a></li>
				<li><a class="menuLink"
					href="<%=request.getContextPath()%>/intro/GunsInfoNature">자연</a></li>
				<li><a class="menuLink"
					href="<%=request.getContextPath()%>/intro/GunsInfoPark">공원</a></li>
				<li><a class="menuLink"
					href="<%=request.getContextPath()%>/intro/GunsInfoTown"
					style="background: #ee8342;">마을</a></li>
				<li><a class="menuLink"
					href="<%=request.getContextPath()%>/intro/GunsInfoMuseum">박물관/전시관</a></li>
				<li><a class="menuLink"
					href="<%=request.getContextPath()%>/intro/GunsInfoRuins">문화유적</a></li>
				<li><a class="menuLink"
					href="<%=request.getContextPath()%>/intro/GunsInfoLeisure">레저/체험</a></li>
			</ul>
		</nav>
	</div>
	<div class="intro-container">
		<a href="<%=request.getContextPath()%>/intro/town/tropicalVillage">
			<div class="card shadow-2dp">
				<div id="pic-container">
					<img
						src="<%=request.getContextPath()%>/images/tour_image/마을/열대자마을.jpg"
						alt="" />
					<p id="title"></p>
				</div>
				<div id="caption">

					<p id="description">열대자 마을</p>

					<div class="description-info">
						<div>
							<i class="fa fa-map-marker" style="font-size: 16px"></i> 전북 군산
							미성동
						</div>
						<div>
							<i class="fa fa-mobile-phone" style="font-size: 16px"></i>
						</div>
					</div>

				</div>
			</div>
		</a> <a href="<%=request.getContextPath()%>/intro/town/railroadVillage">
			<div class="card shadow-2dp">
				<div id="pic-container">
					<img
						src="<%=request.getContextPath()%>/images/tour_image/마을/경암동철길마을.jpg"
						alt="" />
					<p id="title"></p>
				</div>
				<div id="caption">

					<p id="description">경암동 철길마을</p>

					<div class="description-info">
						<div>
							<i class="fa fa-map-marker" style="font-size: 16px"></i> 전북 군산
							경촌4길 14
						</div>
						<div>
							<i class="fa fa-mobile-phone" style="font-size: 16px"></i>
							063-453-4986
						</div>
					</div>

				</div>
			</div>
		</a>



	</div>

</div>



<!-- 풋터 선언!!-->
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
