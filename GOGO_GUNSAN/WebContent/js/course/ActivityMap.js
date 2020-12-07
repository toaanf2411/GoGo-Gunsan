		
var map;
var marker_s, marekr_e;

//경로그림정보
var drawInfoArr = [];

$(document).ready(function(){
	// 1. 지도 띄우기
	map = new Tmapv2.Map("map_div", {
		center: new Tmapv2.LatLng(35.945456, 126.682089),
		width : "50%",
		height : "300px",
		zoom : 11,
		zoomControl : true,
		scrollwheel : true
	});
	
	// 시작, 도착 심볼찍기
	// 시작
    //승마체험
	marker_s = new Tmapv2.Marker({
		position : new Tmapv2.LatLng(35.981612, 126.785103),
		icon : "http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_s.png",
		iconSize : new Tmapv2.Size(24, 38),
		map:map
	});
	
	// 도착
    //선유 스카이라인
	marker_e = new Tmapv2.Marker({
		position : new Tmapv2.LatLng(35.815877, 126.406784),
		icon : "http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_e.png",
		iconSize : new Tmapv2.Size(24, 38),
		map:map
	});
	//경유지1 패러글라이딩
	marker = new Tmapv2.Marker({
		position : new Tmapv2.LatLng(35.999433, 126.786499),
		icon : "http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_1.png",
		iconSize : new Tmapv2.Size(24, 38),
		map:map
	});
	
	var headers = {}; 
	headers["appKey"]="l7xx0833b81c69c546ec9c9ee870389b7cb9";
	
	$.ajax({
		type:"POST",
		headers : headers,
		url:"https://apis.openapi.sk.com/tmap/routes/routeOptimization10?version=1&format=json",//
		async:false,
		contentType: "application/json",
		data: JSON.stringify({
				  "reqCoordType": "WGS84GEO",
				  "resCoordType" : "EPSG3857",
				  "startName": "출발",  //승마체험
				  "startX": "126.785103",
				  "startY": "35.981612",
				  "startTime": "201711121314",
				  "endName": "도착",   //선유스카이
				  "endX": "126.406784",
				  "endY": "35.815877",
				  "searchOption" : "0",
				  "viaPoints": [             
				    {           //패러글라이딩
				      "viaPointId": "test01",
				      "viaPointName": "test01",
				      "viaX": "126.786499",
				      "viaY": "35.999433",
				    }
	    
				  ]
		}),
		success:function(response){
			var resultData = response.properties;
			var resultFeatures = response.features;
			
			// 결과 출력
			var tDistance = resultData.totalDistance; 
			var tTime = resultData.totalTime;
			var tFare =  resultData.totalFare;
			
			for(var i in resultFeatures) {
				var geometry = resultFeatures[i].geometry;
				var properties = resultFeatures[i].properties;
				var polyline_;
				
				drawInfoArr = [];
				
				if(geometry.type == "LineString") {
					for(var j in geometry.coordinates){
						// 경로들의 결과값(구간)들을 포인트 객체로 변환 
						var latlng = new Tmapv2.Point(geometry.coordinates[j][0], geometry.coordinates[j][1]);
						// 포인트 객체를 받아 좌표값으로 변환
						var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(latlng);
						// 포인트객체의 정보로 좌표값 변환 객체로 저장
						var convertChange = new Tmapv2.LatLng(convertPoint._lat, convertPoint._lng);
						
						drawInfoArr.push(convertChange);
					}

					polyline_ = new Tmapv2.Polyline({
						path : drawInfoArr,
						strokeColor : "#FF0000",
						strokeWeight: 6,
						map : map
					});
				}
			}
		},
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
});	
		