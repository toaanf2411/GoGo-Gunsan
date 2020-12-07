<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/main/main.css">

<!-- 헤더 선언!!-->
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!-- 사이드메뉴 선언!  -->
<%@ include file="/WEB-INF/views/common/course_sidebar.jsp"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/course/style.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/course/117.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/course/118.css" />
<script
	src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appkey=l7xx0833b81c69c546ec9c9ee870389b7cb9"></script>
<script>
	var map;
	var marker_s, marekr_e;

	//경로그림정보
	var drawInfoArr = [];

	$(document).ready( function() {
						// 1. 지도 띄우기
						// 근대문화역사박물관
						map = new Tmapv2.Map("map_div", {
							center : new Tmapv2.LatLng(35.990779, 126.712097),
							width : "100%",
							height : "350px",
							zoom : 11,
							zoomControl : true,
							scrollwheel : true
						});

						// 시작, 도착 심볼찍기
						// 시작     근대문화역사박물관
						marker_s = new Tmapv2.Marker(
								{
									position : new Tmapv2.LatLng(35.990779,
											126.712097),
									icon : "http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_s.png",
									iconSize : new Tmapv2.Size(24, 38),
									map : map
								});

						// 도착
						//열대자 마을
						marker_e = new Tmapv2.Marker(
								{
									position : new Tmapv2.LatLng(35.959563,
											126.633837),
									icon : "http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_e.png",
									iconSize : new Tmapv2.Size(24, 38),
									map : map
								});
						//경유지1 부잔교
						marker = new Tmapv2.Marker(
								{
									position : new Tmapv2.LatLng(35.99144,
											126.713946),
									icon : "http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_1.png",
									iconSize : new Tmapv2.Size(24, 38),
									map : map
								});

						// 경유지2 군산 3.1 기념관
						marker = new Tmapv2.Marker(
								{
									position : new Tmapv2.LatLng(35.984936,
											126.741964),
									icon : "http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_2.png",
									iconSize : new Tmapv2.Size(24, 38),
									map : map
								});

						//경유지3 월명호수
						marker = new Tmapv2.Marker(
								{
									position : new Tmapv2.LatLng(35.979715,
											126.695576),
									icon : "http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_3.png",
									iconSize : new Tmapv2.Size(24, 38),
									map : map
								});

						var headers = {};
						headers["appKey"] = "l7xx0833b81c69c546ec9c9ee870389b7cb9";

						$
								.ajax({
									type : "POST",
									headers : headers,
									url : "https://apis.openapi.sk.com/tmap/routes/routeOptimization10?version=1&format=json",//
									async : false,
									contentType : "application/json",
									data : JSON.stringify({
										"reqCoordType": "WGS84GEO",
						                  "resCoordType" : "EPSG3857",
						                  "startName": "출발", //근대문화역사박물관
						                  "startX": "126.712097",
						                  "startY": "35.990779",
						                  "startTime": "201711121314",
						                  "endName": "도착", //열대자마을
						                  "endX": "126.633837",
						                  "endY": "35.959563",
						                  "searchOption" : "0",
						                  "viaPoints": [
						                    {
						                      "viaPointId": "test01",  //부잔교
						                      "viaPointName": "test01",
						                      "viaX": "126.713946",
						                      "viaY": "35.99144",
						                      "viaTime": 12000
						                    },
						                    {
						                      "viaPointId": "test02", //군산 3.1기념관
						                      "viaPointName": "test02",
						                      "viaX": "126.741964",
						                      "viaY": "35.984936",
						                      "viaTime": 12000
						                    },
						                    {
						                      "viaPointId": "test03", //월명호수
						                      "viaPointName": "test03",
						                      "viaX": "126.695576",
						                      "viaY": "35.979715",
						                      "viaTime": 12000
						                    }
										]
									}),
									success : function(response) {
										var resultData = response.properties;
										var resultFeatures = response.features;

										// 결과 출력
										var tDistance = resultData.totalDistance;
										var tTime = resultData.totalTime;
										var tFare = resultData.totalFare;

										for ( var i in resultFeatures) {
											var geometry = resultFeatures[i].geometry;
											var properties = resultFeatures[i].properties;
											var polyline_;

											drawInfoArr = [];

											if (geometry.type == "LineString") {
												for ( var j in geometry.coordinates) {
													// 경로들의 결과값(구간)들을 포인트 객체로 변환 
													var latlng = new Tmapv2.Point(
															geometry.coordinates[j][0],
															geometry.coordinates[j][1]);
													// 포인트 객체를 받아 좌표값으로 변환
													var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(
															latlng);
													// 포인트객체의 정보로 좌표값 변환 객체로 저장
													var convertChange = new Tmapv2.LatLng(
															convertPoint._lat,
															convertPoint._lng);

													drawInfoArr
															.push(convertChange);
												}

												polyline_ = new Tmapv2.Polyline(
														{
															path : drawInfoArr,
															strokeColor : "#FF0000",
															strokeWeight : 6,
															map : map
														});
											}
										}
									},
									error : function(request, status, error) {
										console.log("code:" + request.status
												+ "\n" + "message:"
												+ request.responseText + "\n"
												+ "error:" + error);
									}
								});
					});
</script>
<style>
#course-container {
	width: 100%;
	max-width: 1050px;
	text-align: center;
	padding-right: 15%;
	padding-left: 5%;
}

.title {
	background-color: #c6c6c6;
}
</style>
<div class="gunsan-wrapper">
	<div id="course-container">
		<div class="slidershow">
			<div class="title">
				<div class="cimage" style="float: left;" width="50%">
					<img
						src="<%=request.getContextPath()%>/images/photos/courseicon.jpg"
						alt=""></<img>
				</div>
				<div class="ctitle" style="float: left;" width="50%";>문화유산</div>
				<span id="span-title">소요시간 : 12시간</span>
				<div class="slides">
					<input type="radio" name="r" id="r1" checked> <input
						type="radio" name="r" id="r2"> <input type="radio"
						name="r" id="r3"> <input type="radio" name="r" id="r4">
					<input type="radio" name="r" id="r5">
					<div class="slide s1">
						<img src="<%=request.getContextPath()%>/images/photos/근대역사박물관.jpg"
							alt="근대역사박물관">
					</div>
					<div class="slide">
						<img src="<%=request.getContextPath()%>/images/photos/부잔교.jpg"
							alt="부잔교">
					</div>
					<div class="slide">
						<img src="<%=request.getContextPath()%>/images/photos/군산 3.1기념관.jpg"
							alt="3.1기념관">
					</div>
					<div class="slide">
						<img src="<%=request.getContextPath()%>/images/photos/월명호수.jpg"
							alt="월명호수">
					</div>
					<div class="slide">
						<img src="<%=request.getContextPath()%>/images/photos/열대자마을.jpg"
							alt="열대자마을">
					</div>
					<div class="detail">
						<div class="navigation">
							<label for="r1" class="sbar"></label> <label for="r2" class="bar"></label>
							<label for="r3" class="bar"></label> <label for="r4" class="bar"></label>
							<label for="r5" class="ebar"></label>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="img-course">
			<img src="<%=request.getContextPath()%>/images/course/근대문화유산코스.png"
				alt="">
			<div class="GamsungMap" onload="initTmap()">
				<p id="result"></p>
				<div id="map_wrap" class="map_wrap">
					<div id="map_div"></div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 풋터 선언!!-->
<%@ include file="/WEB-INF/views/common/footer.jsp"%>