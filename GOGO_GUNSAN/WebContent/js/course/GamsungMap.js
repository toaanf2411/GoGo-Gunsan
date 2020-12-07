//감성코스
var map;

var marker_s, marekr_e, waypoint;
var resultMarkerArr = [];
// 경로그림정보
var drawInfoArr = [];
var resultInfoArr = [];

$(function initTmap() {
	resultMarkerArr = [];

	// 1. 지도 띄우기
	// 출발지 경암동 철길마을
	map = new Tmapv2.Map("map_div", {
		center : new Tmapv2.LatLng(35.981288, 126.737023),
		width : "100%",
		height : "350px",
		zoom : 11,
		zoomControl : true,
		scrollwheel : true

	});

	// 2. 시작, 도착 심볼찍기
	// 시작 경암동 철길마을
	marker_s = new Tmapv2.Marker(
			{
				position : new Tmapv2.LatLng(35.981288, 126.737023),
				icon : "http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_s.png",
				iconSize : new Tmapv2.Size(24, 38),
				map : map
			});
	resultMarkerArr.push(marker_s);
	// 도착 선유도
	marker_e = new Tmapv2.Marker(
			{
				position : new Tmapv2.LatLng(35.810655, 126.416209),
				icon : "http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_e.png",
				iconSize : new Tmapv2.Size(24, 38),
				map : map
			});
	resultMarkerArr.push(marker_e);

	// 3. 경유지 심볼 찍기 동국사
	marker = new Tmapv2.Marker(
			{
				position : new Tmapv2.LatLng(35.982849, 126.707512),
				icon : "http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_1.png",
				iconSize : new Tmapv2.Size(24, 38),
				map : map
			});
	resultMarkerArr.push(marker);
	// 이영춘 가옥
	marker = new Tmapv2.Marker(
			{
				position : new Tmapv2.LatLng(35.970884, 126.759705),
				icon : "http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_2.png",
				iconSize : new Tmapv2.Size(24, 38),
				map : map
			});
	resultMarkerArr.push(marker);
	// 군산신흥동 일본식가옥
	marker = new Tmapv2.Marker(
			{
				position : new Tmapv2.LatLng(35.98613, 126.70605),
				icon : "http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_3.png",
				iconSize : new Tmapv2.Size(24, 38),
				map : map
			});
	resultMarkerArr.push(marker);

	// 4. 경로탐색 API 사용요청
	var routeLayer;

	var searchOption = $("#selectLevel").val();

	var headers = {};
	headers["appKey"] = "l7xx0833b81c69c546ec9c9ee870389b7cb9";
	headers["Content-Type"] = "application/json";

	var param = JSON.stringify({
		"startName" : "출발지",
		"startX" : "126.737023",
		"startY" : "35.981288",
		"startTime" : "201708081103",
		"endName" : "도착지",
		"endX" : "126.416209",
		"endY" : "35.810655",
		"viaPoints" : [ {
			"viaPointId" : "test01",
			"viaPointName" : "name01",
			"viaX" : "126.707512",
			"viaY" : "35.982849"
		}, {
			"viaPointId" : "test02",
			"viaPointName" : "name02",
			"viaX" : "126.759705",
			"viaY" : "35.970884"
		}, {
			"viaPointId" : "test03",
			"viaPointName" : "name03",
			"viaX" : "126.70605",
			"viaY" : "35.98613"
		} ],
		"reqCoordType" : "WGS84GEO",
		"resCoordType" : "EPSG3857",
		"searchOption" : "0"
	});

	$
			.ajax({
				method : "POST",
				url : "https://apis.openapi.sk.com/tmap/routes/routeSequential10?version=1&format=json",//
				headers : headers,
				async : false,
				data : param,
				success : function(response) {

					var resultData = response.properties;
					var resultFeatures = response.features;

					// 결과 출력
					var tDistance = "총 거리 : " + resultData.totalDistance
							+ "km,  ";
					var tTime = "총 시간 : " + resultData.totalTime + "분,  ";
					var tFare = "총 요금 : " + resultData.totalFare + "원";

					$("#result").text(tDistance + tTime + tFare);

					// 기존 라인 초기화

					if (resultInfoArr.length > 0) {
						for ( var i in resultInfoArr) {
							resultInfoArr[i].setMap(null);
						}
						resultInfoArr = [];
					}

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
										convertPoint._lat, convertPoint._lng);

								drawInfoArr.push(convertChange);
							}

							polyline_ = new Tmapv2.Polyline({
								path : drawInfoArr,
								strokeColor : "#FF0000",
								strokeWeight : 6,
								map : map
							});
							resultInfoArr.push(polyline_);

						} else {
							var markerImg = "";
							var size = ""; // 아이콘 크기 설정합니다.

							if (properties.pointType == "S") { // 출발지 마커
								markerImg = "http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_s.png";
								size = new Tmapv2.Size(24, 38);
							} else if (properties.pointType == "E") { // 도착지
																		// 마커
								markerImg = "http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_e.png";
								size = new Tmapv2.Size(24, 38);
							} else { // 각 포인트 마커
								markerImg = "http://topopen.tmap.co.kr/imgs/point.png";
								size = new Tmapv2.Size(8, 8);
							}

							// 경로들의 결과값들을 포인트 객체로 변환
							var latlon = new Tmapv2.Point(
									geometry.coordinates[0],
									geometry.coordinates[1]);
							// 포인트 객체를 받아 좌표값으로 다시 변환
							var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(
									latlon);

							marker_p = new Tmapv2.Marker({
								position : new Tmapv2.LatLng(convertPoint._lat,
										convertPoint._lng),
								icon : markerImg,
								iconSize : size,
								map : map
							});

							resultMarkerArr.push(marker_p);
						}
					}
				},
				error : function(request, status, error) {
					console.log("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error);
				}
			});
});

function addComma(num) {
	var regexp = /\B(?=(\d{3})+(?!\d))/g;
	return num.toString().replace(regexp, ',');
}