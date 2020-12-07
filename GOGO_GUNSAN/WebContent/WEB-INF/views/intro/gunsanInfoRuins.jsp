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
					href="<%=request.getContextPath()%>/intro/GunsInfoTown">마을</a></li>
				<li><a class="menuLink"
					href="<%=request.getContextPath()%>/intro/GunsInfoMuseum">박물관/전시관</a></li>
				<li><a class="menuLink"
					href="<%=request.getContextPath()%>/intro/GunsInfoRuins"
					style="background: #ee8342;">문화유적</a></li>
				<li><a class="menuLink"
					href="<%=request.getContextPath()%>/intro/GunsInfoLeisure">레저/체험</a></li>
			</ul>
		</nav>
	</div>

	<div class="intro-container">

		<a href="<%=request.getContextPath()%>/intro/ruins/temple">
			<div class="card shadow-2dp">
				<div id="pic-container">
					<img
						src="<%=request.getContextPath()%>/images/tour_image/문화유적/동국사.jpg"
						alt="" />
					<p id="title"></p>
				</div>
				<div id="caption">

					<p id="description">동국사</p>

					<div class="description-info">
						<div>
							<i class="fa fa-map-marker" style="font-size: 16px"></i> 전북 군산
							동국사길 16 동국사
						</div>
						<div>
							<i class="fa fa-mobile-phone" style="font-size: 16px"></i>
							063-462-5366
						</div>
					</div>

				</div>
			</div>
		</a> <a href="<%=request.getContextPath()%>/intro/ruins/japaneseHouse">
			<div class="card shadow-2dp">
				<div id="pic-container">
					<img
						src="<%=request.getContextPath()%>/images/tour_image/문화유적/히로쓰가옥.jpg"
						alt="" />
					<p id="title"></p>
				</div>
				<div id="caption">

					<p id="description">신흥동일본식가옥</p>

					<div class="description-info">
						<div>
							<i class="fa fa-map-marker" style="font-size: 16px"></i> 전북 군산
							신흥동
						</div>
						<div>
							<i class="fa fa-mobile-phone" style="font-size: 16px"></i>
							063-454-3313
						</div>
					</div>

				</div>
			</div>
		</a> <a href="<%=request.getContextPath()%>/intro/ruins/leeYoungChun">
			<div class="card shadow-2dp">
				<div id="pic-container">
					<img
						src="<%=request.getContextPath()%>/images/tour_image/문화유적/이영춘가옥.jpg"
						alt="" />
					<p id="title"></p>
				</div>
				<div id="caption">

					<p id="description">이영춘 가옥</p>

					<div class="description-info">
						<div>
							<i class="fa fa-map-marker" style="font-size: 16px"></i> 전북 군산
							개정동
						</div>
						<div>
							<i class="fa fa-mobile-phone" style="font-size: 16px"></i>
							063-452-8884
						</div>
					</div>

				</div>
			</div>
		</a> <a href="<%=request.getContextPath()%>/intro/ruins/bujangyo">
			<div class="card shadow-2dp">
				<div id="pic-container">
					<img
						src="<%=request.getContextPath()%>/images/tour_image/문화유적/부잔교.jpg"
						alt="" />
					<p id="title"></p>
				</div>
				<div id="caption">

					<p id="description">부잔교</p>

					<div class="description-info">
						<div>
							<i class="fa fa-map-marker" style="font-size: 16px"></i> 전북 군산
							장미동
						</div>
						<div>
							<i class="fa fa-mobile-phone" style="font-size: 16px"></i>
						</div>
					</div>

				</div>
			</div>

		</a>

	</div>

</div>



<!-- 풋터 선언!!-->
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
