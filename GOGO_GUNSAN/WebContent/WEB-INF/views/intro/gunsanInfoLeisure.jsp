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
					href="<%=request.getContextPath()%>/intro/GunsInfoRuins">문화유적</a></li>
				<li><a class="menuLink"
					href="<%=request.getContextPath()%>/intro/GunsInfoLeisure"
					style="background: #ee8342;">레저/체험</a></li>
			</ul>
		</nav>
	</div>

	<div class="intro-container">

		<a href="<%=request.getContextPath()%>/intro/leisure/zipLine">
			<div class="card shadow-2dp">
				<div id="pic-container">
					<img
						src="<%=request.getContextPath()%>/images/tour_image/레저체험/짚라인.jpg"
						alt="" />
					<p id="title"></p>
				</div>
				<div id="caption">

					<p id="description">선유스카이 SUN라인</p>

					<div class="description-info">
						<div>
							<i class="fa fa-map-marker" style="font-size: 16px"></i> 전북 군산
							옥도면 선유도리 산56-36
						</div>
						<div>
							<i class="fa fa-mobile-phone" style="font-size: 16px"></i>
							063-463-8602
						</div>
					</div>
				</div>
			</div>
		</a> <a href="<%=request.getContextPath()%>/intro/leisure/clam">
			<div class="card shadow-2dp">
				<div id="pic-container">
					<img
						src="<%=request.getContextPath()%>/images/tour_image/레저체험/바지락캐기.jpg"
						alt="" />
					<p id="title"></p>
				</div>
				<div id="caption">

					<p id="description">신시도(바지락캐기)</p>

					<div class="description-info">
						<div>
							<i class="fa fa-map-marker" style="font-size: 16px"></i> 전북 군산
							옥도면 신시도리 120
						</div>
						<div>
							<i class="fa fa-mobile-phone" style="font-size: 16px"></i>
							063-463-7088
						</div>
					</div>

				</div>
			</div>
		</a> <a href="<%=request.getContextPath()%>/intro/leisure/fishing">
			<div class="card shadow-2dp">
				<div id="pic-container">
					<img
						src="<%=request.getContextPath()%>/images/tour_image/레저체험/낚시체험.jpg"
						alt="" />
					<p id="title"></p>
				</div>
				<div id="caption">

					<p id="description">신시도(낚시 체험)</p>

					<div class="description-info">
						<div>
							<i class="fa fa-map-marker" style="font-size: 16px"></i> 전북 군산
							옥도면 신시도리 120
						</div>
						<div>
							<i class="fa fa-mobile-phone" style="font-size: 16px"></i>
							063-463-7088
						</div>
					</div>

				</div>
			</div>
		</a> <a href="<%=request.getContextPath()%>/intro/leisure/lotus">
			<div class="card shadow-2dp">
				<div id="pic-container">
					<img
						src="<%=request.getContextPath()%>/images/tour_image/레저체험/연꽃재배.jpg"
						alt="" />
					<p id="title"></p>
				</div>
				<div id="caption">

					<p id="description">오산마을(연꽃재배)</p>

					<div class="description-info">
						<div>
							<i class="fa fa-map-marker" style="font-size: 16px"></i> 전북 군산
							옥구읍 선제리
						</div>
						<div>
							<i class="fa fa-mobile-phone" style="font-size: 16px"></i>
							063-464-8587
						</div>
					</div>
				</div>
			</div>
		</a>
	</div>
	<div class="intro-container">


		<a href="<%=request.getContextPath()%>/intro/leisure/native">
			<div class="card shadow-2dp">
				<div id="pic-container">
					<img
						src="<%=request.getContextPath()%>/images/tour_image/레저체험/토속음식체험.jpg"
						alt="" />
					<p id="title"></p>
				</div>
				<div id="caption">

					<p id="description">오산마을(토속체험)</p>

					<div class="description-info">
						<div>
							<i class="fa fa-map-marker" style="font-size: 16px"></i> 전북 군산
							옥구읍 선제리
						</div>
						<div>
							<i class="fa fa-mobile-phone" style="font-size: 16px"></i>
							063-464-8587
						</div>
					</div>

				</div>
			</div>
		</a> <a href="<%=request.getContextPath()%>/intro/leisure/riding">
			<div class="card shadow-2dp">
				<div id="pic-container">
					<img
						src="<%=request.getContextPath()%>/images/tour_image/레저체험/승마체험.jpg"
						alt="" />
					<p id="title"></p>
				</div>
				<div id="caption">

					<p id="description">승마체험</p>

					<div class="description-info">
						<div>
							<i class="fa fa-map-marker" style="font-size: 16px"></i> 전북 군산
							성산면 고봉리 147-1
						</div>
						<div>
							<i class="fa fa-mobile-phone" style="font-size: 16px"></i>
							063-453-9971
						</div>
					</div>

				</div>
			</div>
		</a> <a href="<%=request.getContextPath()%>/intro/leisure/paragliding">
			<div class="card shadow-2dp">
				<div id="pic-container">
					<img
						src="<%=request.getContextPath()%>/images/tour_image/레저체험/패러글라이딩.jpg"
						alt="" />
					<p id="title"></p>
				</div>
				<div id="caption">

					<p id="description">패러글라이딩</p>

					<div class="description-info">
						<div>
							<i class="fa fa-map-marker" style="font-size: 16px"></i> 전북 군산
							성산면 십자들로 43
						</div>
						<div>
							<i class="fa fa-mobile-phone" style="font-size: 16px"></i>
							063-451-9848
						</div>
					</div>

				</div>
			</div>
		</a>

	</div>

</div>



<!-- 풋터 선언!!-->
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
