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
					href="<%=request.getContextPath()%>/intro/GunsInfoNature"
					style="background: #ee8342;">자연</a></li>
				<li><a class="menuLink"
					href="<%=request.getContextPath()%>/intro/GunsInfoPark">공원</a></li>
				<li><a class="menuLink"
					href="<%=request.getContextPath()%>/intro/GunsInfoTown">마을</a></li>
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
		<a href="<%=request.getContextPath()%>/intro/nature/wolmyeongLake">
			<div class="card shadow-2dp">
				<div id="pic-container">
					<img
						src="<%=request.getContextPath()%>/images/tour_image/자연/월명호수.jpg"
						alt="" />
					<p id="title"></p>
				</div>
				<div id="caption">

					<p id="description">월명호수</p>

					<div class="description-info">
						<div>
							<i class="fa fa-map-marker" style="font-size: 16px"></i> 전북 군산시
							소룡동 1071-3 (소룡동)
						</div>
						<div>
							<i class="fa fa-mobile-phone" style="font-size: 16px"></i>
							063-453-4986
						</div>
					</div>

				</div>
			</div>
		</a> <a href="<%=request.getContextPath()%>/intro/nature/csMountain">
			<div class="card shadow-2dp">
				<div id="pic-container">
					<img
						src="<%=request.getContextPath()%>/images/tour_image/자연/축성산.jpg"
						alt="" />
					<p id="title"></p>
				</div>
				<div id="caption">

					<p id="description">축성산</p>

					<div class="description-info">
						<div>
							<i class="fa fa-map-marker" style="font-size: 16px"></i> 전북 군산시
							나포면 부곡리
						</div>
						<div>
							<i class="fa fa-mobile-phone" style="font-size: 16px"></i>
						</div>
					</div>

				</div>
			</div>
		</a> <a href="<%=request.getContextPath()%>/intro/nature/seaCave">
			<div class="card shadow-2dp">
				<div id="pic-container">
					<img
						src="<%=request.getContextPath()%>/images/tour_image/자연/해망굴.jpg"
						alt="" />
					<p id="title"></p>
				</div>
				<div id="caption">

					<p id="description">해망굴</p>

					<div class="description-info">
						<div>
							<i class="fa fa-map-marker" style="font-size: 16px"></i> 전북 군산시
							해망동
						</div>
						<div>
							<i class="fa fa-mobile-phone" style="font-size: 16px"></i>
							063-454-3337
						</div>
					</div>

				</div>
			</div>
		</a> <a href="<%=request.getContextPath()%>/intro/nature/reservoir">
			<div class="card shadow-2dp">
				<div id="pic-container">
					<img
						src="<%=request.getContextPath()%>/images/tour_image/자연/옥구저수지.jpg"
						alt="" />
					<p id="title"></p>
				</div>
				<div id="caption">

					<p id="description">옥구저수지</p>

					<div class="description-info">
						<div>
							<i class="fa fa-map-marker" style="font-size: 16px"></i> 전북 군산시
							옥구읍 어은리
						</div>
						<div>
							<i class="fa fa-mobile-phone" style="font-size: 16px"></i>
						</div>
					</div>

				</div>
			</div>
		</a>
	</div>

	<div class="intro-container">
		<a href="<%=request.getContextPath()%>/intro/nature/mhMountain">
			<div class="card shadow-2dp">
				<div id="pic-container">
					<img
						src="<%=request.getContextPath()%>/images/tour_image/자연/망해산.jpg"
						alt="" />
					<p id="title"></p>
				</div>
				<div id="caption">

					<p id="description">망해산</p>

					<div class="description-info">
						<div>
							<i class="fa fa-map-marker" style="font-size: 16px"></i> 전북 군산
							나포면 옥곤리
						</div>
						<div>
							<i class="fa fa-mobile-phone" style="font-size: 16px"></i>
						</div>
					</div>

				</div>
			</div>
		</a> <a href="<%=request.getContextPath()%>/intro/nature/seonyudo">
			<div class="card shadow-2dp">
				<div id="pic-container">
					<img
						src="<%=request.getContextPath()%>/images/tour_image/자연/선유도.jpg"
						alt="" />
					<p id="title"></p>
				</div>
				<div id="caption">

					<p id="description">선유도</p>

					<div class="description-info">
						<div>
							<i class="fa fa-map-marker" style="font-size: 16px"></i> 전북 군산
							옥도면 선유남길 34-22
						</div>
						<div>
							<i class="fa fa-mobile-phone" style="font-size: 16px"></i>
							063-465-5166
						</div>
					</div>

				</div>
			</div>
		</a>

	</div>

</div>



<!-- 풋터 선언!!-->
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
