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

function modernMuseum(){
		let url = "<%=request.getContextPath()%>/reservation/resInfo/modernMuseum";
		window.open(url, '근대역사박물관', 'width=900, height=800');
	};
	
function customsMuseum(){
		let url = "<%=request.getContextPath()%>/reservation/resInfo/customsMuseum";
		window.open(url, '호남관세박물관', 'width=900, height=800');
	};
	
function modernArchitecture(){
		let url = "<%=request.getContextPath()%>/reservation/resInfo/modernArchitecture";
		window.open(url, '근대건축관', 'width=900, height=800');
	};
	
function modernArt(){
		let url = "<%=request.getContextPath()%>/reservation/resInfo/modernArt";
		window.open(url, '근대미술관', 'width=900, height=800');
	};
	
function memorialHall(){
		let url = "<%=request.getContextPath()%>/reservation/resInfo/memorialHall";
		window.open(url, '군산3.1기념관', 'width=900, height=800'); 
	};
	
</script>
<div class="gunsan-wrapper">

		<div class="gunsan-page-title">
			<h1>전시/관람</h1>
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
						src="<%=request.getContextPath()%>/images/tour_image/박물관전시관/근대역사박물관.jpg"
						alt="" />
					<p id="title"></p>
				</div>
				<div id="caption">

					<p id="description">근대역사박물관</p>

					<div class="booking-buttons">
						<form id="reservationFrm" method="POST" action="<%=request.getContextPath()%>/reservation/reservationGo" onsubmit="return reservation();">
							<button class="blob-btn">
								예약하기 <span class="blob-btn__inner"> <span
									class="blob-btn__blobs"> <span class="blob-btn__blob"></span>
										<span class="blob-btn__blob"></span> <span
										class="blob-btn__blob"></span> <span class="blob-btn__blob"></span>
								</span>
								</span>
							</button>
							<input type="hidden" name="tour_id" value="TA40001" />
						</form>

							<button class="blob-btn" onclick="modernMuseum();">
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
						src="<%=request.getContextPath()%>/images/tour_image/박물관전시관/호남관세박물관.jpg"
						alt="" />
					<p id="title"></p>
				</div>
				<div id="caption">

					<p id="description">호남관세박물관</p>

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
							<input type="hidden" name="tour_id" value="TA40002" />
						</form>
							<button class="blob-btn" onclick="customsMuseum();">
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
						src="<%=request.getContextPath()%>/images/tour_image/박물관전시관/근대건축관.jpg"
						alt="" />
					<p id="title"></p>
				</div>
				<div id="caption">

					<p id="description">근대건축관</p>
					<div class="booking-buttons">
						<form id="reservationFrm" method="POST"
							action="<%=request.getContextPath()%>/reservation/reservationGo"
							onsubmit="return reservation();">

							<button class="blob-btn btn-res" >
								예약하기 <span class="blob-btn__inner"> <span
									class="blob-btn__blobs"> <span class="blob-btn__blob"></span>
										<span class="blob-btn__blob"></span> <span
										class="blob-btn__blob"></span> <span class="blob-btn__blob"></span>
								</span>
								</span>
							</button>
							<input type="hidden" name="tour_id" value="TA40003" />
						</form>

							<button class="blob-btn" onclick="modernArt();">
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
						src="<%=request.getContextPath()%>/images/tour_image/박물관전시관/군산근대미술관.jpg"
						alt="" />
					<p id="title"></p>
				</div>
				<div id="caption">

					<p id="description">근대미술관</p>

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
							<input type="hidden" name="tour_id" value="TA40004" />
						</form>
							<button class="blob-btn" onclick="modernArt();">
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
						src="<%=request.getContextPath()%>/images/tour_image/박물관전시관/31기념관.jpg"
						alt="" />
					<p id="title"></p>
				</div>
				<div id="caption">

					<p id="description">군산3.1기념관</p>

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
							<input type="hidden" name="tour_id" value="TA40005" />
						</form>
							<button class="blob-btn" onclick="memorialHall();">
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
