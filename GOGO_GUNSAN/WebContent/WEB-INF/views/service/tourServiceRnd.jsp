<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="tour_info.model.vo.TourInfo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/service/bootstrap.min.css"> 
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/service/tourService_res.css">     
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/service/tourServiceSelect.css">
<script src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appkey=l7xx0833b81c69c546ec9c9ee870389b7cb9"></script>
<script	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<%
	//세션정보를 가져오기
	String type = (String)session.getAttribute("type");
	String startDay = (String)session.getAttribute("startDay");
	List<TourInfo> result = (List)session.getAttribute("result");
	
	//날짜 계산하기 1박 2일
	SimpleDateFormat format = new SimpleDateFormat("yyyy/M/dd");
	Date date = format.parse(startDay);
	Calendar day1 = Calendar.getInstance();
	day1.setTime(date);
	day1.add(Calendar.DATE, 1);
	String day1End = format.format(day1.getTime());
	
	System.out.println(day1End);
	
	//날짜 계산하기 2박 3일
	Calendar day2 = Calendar.getInstance();
	day2.setTime(date);
	day2.add(Calendar.DATE, 2);
	String day2End = format.format(day2.getTime());
	
	System.out.println(day2End);
	
%>

<script type="text/javascript">
var map,marker;
// 페이지가 로딩이 된 후 호출하는 함수입니다.
$(document).ready(function() {
			// map 생성
			// Tmap.map을 이용하여, 지도가 들어갈 div, 넓이, 높이를 설정합니다.
/* 당일코스  */
<%if(result.size() == 4){%>
			map = new Tmapv2.Map("map_div", {
				center : new Tmapv2.LatLng(35.977376, 126.713796), // 지도 초기 좌표
				width : "600px", // map의 width 설정
				height : "400px" // map의 height 설정	
			});
			console.log(<%=result.get(0).getLat()%>,<%=result.get(0).getLongitude()%>);
			var positions = [//다중 마커 저장 배열
				{
					 title: '<%=result.get(0).getTourInfoName()%>',
					 lonlat: new Tmapv2.LatLng(<%=result.get(0).getLat()%>,<%=result.get(0).getLongitude()%>)//좌표 지정
					 
				 },
				 {
					 title: '<%=result.get(1).getTourInfoName()%>',
					 lonlat: new Tmapv2.LatLng(<%=result.get(1).getLat()%>,<%=result.get(1).getLongitude()%>)//좌표 지정
				 },
				 {
					 title: '<%=result.get(2).getTourInfoName()%>',
					 lonlat: new Tmapv2.LatLng(<%=result.get(2).getLat()%>,<%=result.get(2).getLongitude()%>)//좌표 지정
				 },
				 {
					 title: '<%=result.get(3).getTourInfoName()%>',
					 lonlat: new Tmapv2.LatLng(<%=result.get(3).getLat()%>,<%=result.get(3).getLongitude()%>)//좌표 지정
				 }
				
			];

			for (var i = 0; i< positions.length; i++){//for문을 통하여 배열 안에 있는 값을 마커 생성
				var lonlat = positions[i].lonlat;
				var title = positions[i].title;
				//Marker 객체 생성.
				marker = new Tmapv2.Marker({
					position : lonlat, //Marker의 중심좌표 설정.
					map : map, //Marker가 표시될 Map 설정.
					title : title //Marker 타이틀.
				});
			}
			map.setZoom(11);
		
/*  1박2일 코스 */
<%}else if(result.size() == 6){%>
		map = new Tmapv2.Map("map_div", {
			center : new Tmapv2.LatLng(35.977376, 126.713796), // 지도 초기 좌표
			width : "600px", // map의 width 설정
			height : "400px" // map의 height 설정	
		});
		console.log(<%=result.get(0).getLat()%>,<%=result.get(0).getLongitude()%>);
		var positions = [//다중 마커 저장 배열
			{
				 title: '<%=result.get(0).getTourInfoName()%>',
				 lonlat: new Tmapv2.LatLng(<%=result.get(0).getLat()%>,<%=result.get(0).getLongitude()%>)//좌표 지정
				 
			 },
			 {
				 title: '<%=result.get(1).getTourInfoName()%>',
				 lonlat: new Tmapv2.LatLng(<%=result.get(1).getLat()%>,<%=result.get(1).getLongitude()%>)//좌표 지정
			 },
			 {
				 title: '<%=result.get(2).getTourInfoName()%>',
				 lonlat: new Tmapv2.LatLng(<%=result.get(2).getLat()%>,<%=result.get(2).getLongitude()%>)//좌표 지정
			 },
			 {
				 title: '<%=result.get(3).getTourInfoName()%>',
				 lonlat: new Tmapv2.LatLng(<%=result.get(3).getLat()%>,<%=result.get(3).getLongitude()%>)//좌표 지정
			 },
			 {
				 title: '<%=result.get(4).getTourInfoName()%>',
				 lonlat: new Tmapv2.LatLng(<%=result.get(4).getLat()%>,<%=result.get(4).getLongitude()%>)//좌표 지정
			 },
			 {
				 title: '<%=result.get(5).getTourInfoName()%>',
				 lonlat: new Tmapv2.LatLng(<%=result.get(5).getLat()%>,<%=result.get(5).getLongitude()%>)//좌표 지정
			 }
			 
			
		];
		
		for (var i = 0; i< positions.length; i++){//for문을 통하여 배열 안에 있는 값을 마커 생성
			var lonlat = positions[i].lonlat;
			var title = positions[i].title;
			//Marker 객체 생성.
			marker = new Tmapv2.Marker({
				position : lonlat, //Marker의 중심좌표 설정.
				map : map, //Marker가 표시될 Map 설정.
				title : title //Marker 타이틀.
			});
		}
		map.setZoom(11);
<%}else if(result.size() == 8){%>
	map = new Tmapv2.Map("map_div", {
		center : new Tmapv2.LatLng(35.977376, 126.713796), // 지도 초기 좌표
		width : "600px", // map의 width 설정
		height : "400px" // map의 height 설정	
	});
	console.log(<%=result.get(0).getLat()%>,<%=result.get(0).getLongitude()%>);
	var positions = [//다중 마커 저장 배열
		{
			 title: '<%=result.get(0).getTourInfoName()%>',
			 lonlat: new Tmapv2.LatLng(<%=result.get(0).getLat()%>,<%=result.get(0).getLongitude()%>)//좌표 지정
			 
		 },
		 {
			 title: '<%=result.get(1).getTourInfoName()%>',
			 lonlat: new Tmapv2.LatLng(<%=result.get(1).getLat()%>,<%=result.get(1).getLongitude()%>)//좌표 지정
		 },
		 {
			 title: '<%=result.get(2).getTourInfoName()%>',
			 lonlat: new Tmapv2.LatLng(<%=result.get(2).getLat()%>,<%=result.get(2).getLongitude()%>)//좌표 지정
		 },
		 {
			 title: '<%=result.get(3).getTourInfoName()%>',
			 lonlat: new Tmapv2.LatLng(<%=result.get(3).getLat()%>,<%=result.get(3).getLongitude()%>)//좌표 지정
		 },
		 {
			 title: '<%=result.get(4).getTourInfoName()%>',
			 lonlat: new Tmapv2.LatLng(<%=result.get(4).getLat()%>,<%=result.get(4).getLongitude()%>)//좌표 지정
		 },
		 {
			 title: '<%=result.get(5).getTourInfoName()%>',
			 lonlat: new Tmapv2.LatLng(<%=result.get(5).getLat()%>,<%=result.get(5).getLongitude()%>)//좌표 지정
		 }
		 
		
	];
	
	for (var i = 0; i< positions.length; i++){//for문을 통하여 배열 안에 있는 값을 마커 생성
		var lonlat = positions[i].lonlat;
		var title = positions[i].title;
		//Marker 객체 생성.
		marker = new Tmapv2.Marker({
			position : lonlat, //Marker의 중심좌표 설정.
			map : map, //Marker가 표시될 Map 설정.
			title : title //Marker 타이틀.
		});
	}
	map.setZoom(11);
		
<%}%>
	});
</script>
<script>

$( document ).ready(function() {
	
	$("#btn").click(function(){
		
		//추천코스 ajax
		$.ajax({
			url:"<%=request.getContextPath()%>/service/tourRecommend.do",
			type: "GET", //전송방식
			success: function(data){
				//요청성공시 처리 함수
				//data에는 전달받은 값이 담겨있다.
				console.log("success");
				console.log("success"+data);
				
				
				var position = $(window).scrollTop(); 
				//새로고침
				document.location.reload(true);
				
				


			},
			error: function(jqxhr, textStatus, errorThrown){
				//에러가 난 경우 실행 함수
				console.log("ajax처리실패!", jqxhr, textStatus, errorThrown);
			}, 
					
		}); 
		
	
	});




	
	
});


</script>

<div class="tm-section-2">
        <div class="container">
            <div class="row">
                <div class="col text-center">
                    <h2 class="tm-section-title">군산에서 멋진 경험을 체험해 보세요.</h2>
                    <p class="tm-color-white tm-section-subtitle">5분안이면 당신의 여행이 한눈에 </p>
                   
                </div>
            </div>
        </div>
    </div>



    <div class="tm-section tm-position-relative">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100" preserveAspectRatio="none"
            class="tm-section-down-arrow">
            <polygon fill="#ee5057" points="0,0  100,0  50,60"></polygon>
        </svg>
        <div class="container tm-pt-5 tm-pb-4">
            <div class="wizard">
                <a ><span class="badge">01</span> 맞춤선택</a>
                <a class="current badge-inverse"><span class="badge">02</span> 맞춤코스보기</a>
                <a><span class="badge ">03</span> 상품별 예약</a>
                <a><span class="badge ">04</span>예약 정보동의</a>
                <a><span class="badge">05</span> 예약 결제</a>
            </div>
            <div class="row">
            	<div class="col-xl-11 corseTitle">
            	<%if(type.equals("M")){ %>
            		가족과 함께
            	<%  }else if(type.equals("C")){%>	 
          			연인과 함께
          		<%  }else if(type.equals("F")){%>	 
            		친구와 함께	
            	<%  }else if(type.equals("S")){%>
            		나홀로 여행		
            		<% }%>| <% if(result.size()==4){%>
            		당일코스
            		<%}else if(result.size()==6){ %>
            		1박2일코스
            		<%}else if(result.size()==8){ %>
            		2박3일
            		<% }%>
            		 </div>
            		
            </div>
            <form action="" id="" method="POST">
                <div class="row text-center ">
                    
                   <article class=" col-xl-9 ">
                     
                       <a href="#" class="tm-color-white tm-btn-white-bordered">이전</a>
                       <input type="button" value="다시 추천" id="btn" class="tm-color-white tm-btn-white-bordered"/>
                        <a href="<%=request.getContextPath()%>/service/tourServiceReservation"
                         class="tm-color-white  tm-btn-white-bordered">다음</a>
                         
                         <% if(result != null){%>
                         	<div class="cource-view-row">
                        	<% if(result.size() == 4){ %>
                        	<p><%=startDay %></p>
                        	<% 	 for(TourInfo info : result){ 
                        	 %>
                            <div class="card shadow-2dp">
                                <div id="pic-container">
                                    <img
                                        src="<%=request.getContextPath() %>/images/photos/<%=info.getTourInfoName()%>.jpg"
                                        alt="" 
                                        style="width:200px; height:150px"/>
                                    <p id="title"></p>
                                </div>
                                <div id="caption">
                                    <p id="description"><%=info.getTourInfoName() %></p>
                                </div>
                            </div>
                         
                            <%} %>
                           </div >
                          <!-- 맵 생성 실행 -->
                            <div class="cource-view-row map">
								<div id="map_div"></div>
							</div>

                         <%} else if(result.size()==6){%>
                         <article class="col-xl-9">
                        	 <div class="cource-view-row ">
                        	 <p><%=startDay%></p>
                        	 <%for(int i=0; i<3; i++){ %>
                            <div class="card shadow-2dp">
                                <div id="pic-container">
                                    <img
                                        src="<%=request.getContextPath() %>/images/photos/<%=result.get(i).getTourInfoName()%>.jpg"
                                        alt=""
										style="width:200px; height:150px"/>
                                    <p id="title"></p>
                                </div>
                                <div id="caption">
                                    <p id="description"><%=result.get(i).getTourInfoName() %></p>
                                </div>
                            </div>
                            <%} %>
                            </div>                    
                       	<div class="cource-view-row">
                       	<br>
                       	<p><%=day1End %></p>
                            <%for(int i=3; i<6; i++){ %>           
                            <div class="card shadow-2dp">
                                <div id="pic-container">
                                    <img
                                        src="<%=request.getContextPath() %>/images/photos/<%=result.get(i).getTourInfoName()%>.jpg"
                                        alt="" 
                                        style="width:200px; height:150px"/>
                                    <p id="title"></p>
                                </div>
                                <div id="caption">
                
                                    <p id="description"><%=result.get(i).getTourInfoName()%></p>
 
                                </div>
                            </div>
                             
                            <% } %> 
                       	</div>
                             <!-- 맵 생성 실행 -->
                            <div class="cource-view-row map">
								<div id="map_div"></div>
							</div>
                       	 </article>
                       
                       <%  } else if(result.size()==8){ %>
                       <article class="col-xl-10">
                       <div class="cource-view-row">
                        	 <p><%=startDay %></p>
                        	 <%for(int i=0; i<3; i++){ %>
                            <div class="card shadow-2dp">
                                <div id="pic-container">
                                    <img
                                        src="<%=request.getContextPath() %>/images/photos/<%=result.get(i).getTourInfoName()%>.jpg"
                                        alt="" 
                                        style="width:200px; height:150px"/>
                                    <p id="title"></p>
                                </div>
                                <div id="caption">
                
                                    <p id="description"><%=result.get(i).getTourInfoName() %></p>

                                </div>
                            </div>
                            <%} %>
                              
                        </div>
                        <br>
                       	<div class="cource-view-row">
                       	<p><%=day1End %></p>
                            <%for(int i=3; i<6; i++){ %>           
                            <div class="card shadow-2dp">
                                <div id="pic-container">
                                    <img
                                        src="<%=request.getContextPath() %>/images/photos/<%=result.get(i).getTourInfoName()%>.jpg"
                                        alt="" 
                                        style="width:200px; height:150px"/>
                                    <p id="title"></p>
                                </div>
                                <div id="caption">
                
                                    <p id="description"><%=result.get(i).getTourInfoName() %></p>
 
                                </div>
                            </div>
                            <%} %> 
                       	</div>
                       	<br>
                       	<div class="cource-view-row">
                       	<p><%=day2End %></p>
                            <%for(int i=6; i<8; i++){ %>           
                            <div class="card shadow-2dp">
                                <div id="pic-container">
                                    <img
                                        src="<%=request.getContextPath() %>/images/photos/<%=result.get(i).getTourInfoName()%>.jpg"
                                        alt="" 
                                        style="width:200px; height:150px"/>
                                    <p id="title"></p>
                                </div>
                                <div id="caption">
                
                                    <p id="description"><%=result.get(i).getTourInfoName() %></p>
 
                                </div>
                            </div>
                            <%} }
                            } %> 
                       	</div>
                       	   <!-- 맵 생성 실행 -->
                       	   
                            <div class="map">
								<div id="map_div"></div>
							</div>         
                    </article>
                    <article class=" col-xl-2 ">
                        <h6 >01 맞춤 선택</h6>
						<h5 class="tm-color-primary ">02 맞춤코스 보기</h5>
						<h6>03 상품별 예약</h6>
						<h6>04 예약자 정보 동의</h6>
						<h6>05 예약 결제</h6>
                    </article>
                   
                </div>
                
                  <input type="hidden" name="date" id="date" value="">
            </form>
        </div>
    </div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
