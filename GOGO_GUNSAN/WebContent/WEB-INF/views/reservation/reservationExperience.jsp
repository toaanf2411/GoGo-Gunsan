<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/main/main.css">

<!-- 헤더 선언!!-->
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!-- 사이드메뉴 선언!  -->
<%@ include file="/WEB-INF/views/common/reservation_sidebar.jsp"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/common/searchbox.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/reservation/reservation.css" />

<script>
function reservation(){
	//로그인 여부 검사
	if(<%=memberLoggedIn == null%>){
		alert("로그인후 이용하실 수 있습니다.");
		return false;
	}
	return true;
};

function riding(){
	let url = "<%=request.getContextPath()%>/reservation/resInfo/riding";
	window.open(url, '승마체험', 'width=900, height=800');
};

function paragliding(){
	let url = "<%=request.getContextPath()%>/reservation/resInfo/paragliding";
	window.open(url, '패러글라이딩', 'width=900, height=800');
};

function zipline(){
	let url = "<%=request.getContextPath()%>/reservation/resInfo/zipline";
	window.open(url, '선유스카이 SUN라인', 'width=900, height=800');
};

function clam(){
	let url = "<%=request.getContextPath()%>/reservation/resInfo/clam";
	window.open(url, '바지락캐기 체험', 'width=900, height=800');
};

function fishing(){
	let url = "<%=request.getContextPath()%>/reservation/resInfo/fishing";
	window.open(url, '낚시체험', 'width=900, height=800');
};

function lotus(){
	let url = "<%=request.getContextPath()%>/reservation/resInfo/lotus";
	window.open(url, '연꽃재배', 'width=900, height=800');
};

function nativeFood(){
	let url = "<%=request.getContextPath()%>/reservation/resInfo/nativeFood";
	window.open(url, '토속음식체험', 'width=900, height=800');
};
	
</script>
<div class="gunsan-wrapper">

		<div class="gunsan-page-title">
			<h1>레저/체험</h1>
		<form action="<%=request.getContextPath()%>/reservation/findInfo">
					<input type="hidden" name="searchType" value="findInfo" />
				<div class="search__container">
					<input type="text" class="search__input" name="searchKeyword"  placeholder="검색할 관광지명을 입력하세요.">
				</div>
			</form>
		</div>

		<div class="booking-container">
			<div class="card shadow-2dp">
				<div id="pic-container">
					<img
						src="<%=request.getContextPath()%>/images/tour_image/레저체험/승마체험.jpg"
						alt="" />
					<p id="title"></p>
				</div>
				<div id="caption">

					<p id="description">승마체험</p>

					<div class="booking-buttons">
						<form id="reservationFrm" method="POST"
							action="<%=request.getContextPath()%>/reservation/reservationGo"
							onsubmit="return reservation();">
							<button class="blob-btn" >
								예약하기 <span class="blob-btn__inner"> <span
									class="blob-btn__blobs"> <span class="blob-btn__blob"></span>
										<span class="blob-btn__blob"></span> <span
										class="blob-btn__blob"></span> <span class="blob-btn__blob"></span>
								</span>
								</span>
							</button>
							<input type="hidden" name="tour_id" value="TA60005" />
						</form>

							<button class="blob-btn" onclick="riding();">
								상세보기 <span class="blob-btn__inner"> <span
									class="blob-btn__blobs"> <span class="blob-btn__blob"></span>
										<span class="blob-btn__blob"></span> <span
										class="blob-btn__blob"></span> <span class="blob-btn__blob"></span>
								</span>
								</span>
							</button>
					</div>

				</div>
			</div>
			<div class="card shadow-2dp">
				<div id="pic-container">
					<img
						src="<%=request.getContextPath()%>/images/tour_image/레저체험/패러글라이딩.jpg"
						alt="" />
					<p id="title"></p>
				</div>
				<div id="caption">

					<p id="description">패러글라이딩</p>

					<div class="booking-buttons">
						<form id="reservationFrm" method="POST"
							action="<%=request.getContextPath()%>/reservation/reservationGo"
							onsubmit="return reservation();">

							<button class="blob-btn">
								예약하기 <span class="blob-btn__inner"> <span
									class="blob-btn__blobs"> <span class="blob-btn__blob"></span>
										<span class="blob-btn__blob"></span> <span
										class="blob-btn__blob"></span> <span class="blob-btn__blob"></span>
								</span>
								</span>
							</button>
							<input type="hidden" name="tour_id" value="TA60006" />
						</form>
							<button class="blob-btn" onclick="paragliding();">
								상세보기 <span class="blob-btn__inner"> <span
									class="blob-btn__blobs"> <span class="blob-btn__blob"></span>
										<span class="blob-btn__blob"></span> <span
										class="blob-btn__blob"></span> <span class="blob-btn__blob"></span>
								</span>
								</span>
							</button>
					</div>

				</div>
			</div>
			<div class="card shadow-2dp">
				<div id="pic-container">
					<img
						src="<%=request.getContextPath()%>/images/tour_image/레저체험/짚라인.jpg"
						alt="" />
					<p id="title"></p>
				</div>
				<div id="caption">

					<p id="description">선유스카이 SUN라인</p>
					<div class="booking-buttons">
					<form id="reservationFrm" method="POST"
							action="<%=request.getContextPath()%>/reservation/reservationGo"
							onsubmit="return reservation();">

							<button class="blob-btn btn-res" onclick="">
								예약하기 <span class="blob-btn__inner"> <span
									class="blob-btn__blobs"> <span class="blob-btn__blob"></span>
										<span class="blob-btn__blob"></span> <span
										class="blob-btn__blob"></span> <span class="blob-btn__blob"></span>
								</span>
								</span>
							</button>
							<input type="hidden" name="tour_id" value="TA60007" />
						</form>

							<button class="blob-btn" onclick="zipline();">
								상세보기 <span class="blob-btn__inner"> <span
									class="blob-btn__blobs"> <span class="blob-btn__blob"></span>
										<span class="blob-btn__blob"></span> <span
										class="blob-btn__blob"></span> <span class="blob-btn__blob"></span>
								</span>
								</span>
							</button>
					</div>

				</div>
			</div>
			<div class="card shadow-2dp">
				<div id="pic-container">
					<img
						src="<%=request.getContextPath()%>/images/tour_image/레저체험/바지락캐기.jpg"
						alt="" />
					<p id="title"></p>
				</div>
				<div id="caption">

					<p id="description">바지락캐기 체험</p>

					<div class="booking-buttons">
						<form id="reservationFrm" method="POST"
							action="<%=request.getContextPath()%>/reservation/reservationGo"
							onsubmit="return reservation();">

							<button class="blob-btn" >
								예약하기 <span class="blob-btn__inner"> <span
									class="blob-btn__blobs"> <span class="blob-btn__blob"></span>
										<span class="blob-btn__blob"></span> <span
										class="blob-btn__blob"></span> <span class="blob-btn__blob"></span>
								</span>
								</span>
							</button>
							<input type="hidden" name="tour_id" value="TA60001" />
						</form>
							<button class="blob-btn" onclick="clam();">
								상세보기 <span class="blob-btn__inner"> <span
									class="blob-btn__blobs"> <span class="blob-btn__blob"></span>
										<span class="blob-btn__blob"></span> <span
										class="blob-btn__blob"></span> <span class="blob-btn__blob"></span>
								</span>
								</span>
							</button>
					</div>

				</div>
			</div>
		</div>

		<%--두번째 라인 --%>
		<div class="booking-container">
			<div class="card shadow-2dp">
				<div id="pic-container">
					<img
						src="<%=request.getContextPath()%>/images/tour_image/레저체험/낚시체험.jpg"
						alt="" />
					<p id="title"></p>
				</div>
				<div id="caption">

					<p id="description">낚시체험</p>

					<div class="booking-buttons">
						<form id="reservationFrm" method="POST" action="<%=request.getContextPath()%>/reservation/reservationGo" onsubmit="return reservation();">

							<button class="blob-btn" >
								예약하기 <span class="blob-btn__inner"> <span
									class="blob-btn__blobs"> <span class="blob-btn__blob"></span>
										<span class="blob-btn__blob"></span> <span
										class="blob-btn__blob"></span> <span class="blob-btn__blob"></span>
								</span>
								</span>
							</button>
							<input type="hidden" name="tour_id" value="TA60002" />
						</form>
							<button class="blob-btn" onclick="fishing();">
								상세보기 <span class="blob-btn__inner"> <span
									class="blob-btn__blobs"> <span class="blob-btn__blob"></span>
										<span class="blob-btn__blob"></span> <span
										class="blob-btn__blob"></span> <span class="blob-btn__blob"></span>
								</span>
								</span>
							</button>
					</div>

				</div>
			</div>

			<div class="card shadow-2dp">
				<div id="pic-container">
					<img
						src="<%=request.getContextPath()%>/images/tour_image/레저체험/연꽃재배.jpg"
						alt="" />
					<p id="title"></p>
				</div>
				<div id="caption">

					<p id="description">연꽃재배</p>

					<div class="booking-buttons">
						<form id="reservationFrm" method="POST"
							action="<%=request.getContextPath()%>/reservation/reservationGo"
							onsubmit="return reservation();">

							<button class="blob-btn" >
								예약하기 <span class="blob-btn__inner"> <span
									class="blob-btn__blobs"> <span class="blob-btn__blob"></span>
										<span class="blob-btn__blob"></span> <span
										class="blob-btn__blob"></span> <span class="blob-btn__blob"></span>
								</span>
								</span>
							</button>
							<input type="hidden" name="tour_id" value="TA60003" />
						</form>
							<button class="blob-btn" onclick="lotus();">
								상세보기 <span class="blob-btn__inner"> <span
									class="blob-btn__blobs"> <span class="blob-btn__blob"></span>
										<span class="blob-btn__blob"></span> <span
										class="blob-btn__blob"></span> <span class="blob-btn__blob"></span>
								</span>
								</span>
							</button>
					</div>

				</div>
			</div>
			<div class="card shadow-2dp">
				<div id="pic-container">
					<img
						src="<%=request.getContextPath()%>/images/tour_image/레저체험/토속음식체험.jpg"
						alt="" />
					<p id="title"></p>
				</div>
				<div id="caption">

					<p id="description">토속음식체험</p>

					<div class="booking-buttons">
						<form id="reservationFrm" method="POST"
							action="<%=request.getContextPath()%>/reservation/reservationGo"
							onsubmit="return reservation();">
							
							<button class="blob-btn" >
								예약하기 <span class="blob-btn__inner"> <span
									class="blob-btn__blobs"> <span class="blob-btn__blob"></span>
										<span class="blob-btn__blob"></span> <span
										class="blob-btn__blob"></span> <span class="blob-btn__blob"></span>
								</span>
								</span>
							</button>
							<input type="hidden" name="tour_id" value="TA60004" />
						</form>
						<button class="blob-btn" onclick="nativeFood();">
								상세보기 <span class="blob-btn__inner"> <span
									class="blob-btn__blobs"> <span class="blob-btn__blob"></span>
										<span class="blob-btn__blob"></span> <span
										class="blob-btn__blob"></span> <span class="blob-btn__blob"></span>
								</span>
								</span>
							</button>
					</div>

				</div>
			</div>
        </div>
    </div>

		<%--세번째 라인 --%>
	<%--세번째 라인 끝 --%>

<!-- 풋터 선언!!-->
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
