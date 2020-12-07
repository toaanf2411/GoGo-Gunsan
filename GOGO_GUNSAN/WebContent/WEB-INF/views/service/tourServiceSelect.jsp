<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/service/bootstrap.min.css"> 
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/service/tourService_res.css">     
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/service/tourServiceSelect.css">


	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/service/calender/style.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/service/calender/ui.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/service/calender/pignose.calendar.min.css"/>
   
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/calendar/vanilla-calendar-min.css">
<script src="<%=request.getContextPath() %>/js/calendar/vanilla-calendar-min.js"></script>

    
    
    
    

<%@ include file="/WEB-INF/views/common/header.jsp" %>



<div class="tm-section-2">
        <div class="container">
            <div class="row">
                <div class="col text-center">
                    <h2 class="tm-section-title">군산에서 멋진 경험을 체험해 보세요.</h2>
                    <p class="tm-color-white tm-section-subtitle">5분안이면 당신의 여행이 한눈에 </p>
                    <a href="#" class="tm-color-white tm-btn-white-bordered">Subscribe Newletters</a>
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
                <a class="current badge-inverse"><span class="badge">01</span> 맞춤선택</a>
                <a><span class="badge">02</span> 맞춤코스보기</a>
                <a><span class="badge ">03</span> 상품별 예약</a>
                <a><span class="badge ">04</span>예약 정보동의</a>
                <a><span class="badge">05</span> 예약 결제</a>
            </div>
            <form action="<%=request.getContextPath()%>/service/tourServiceRnd" method="POST">
                <div class="row text-center">
                    <article class="col-xl-2 tm-article">

                        <h3 class="tm-color-primary tm-article-title-1">여행기간</h3>

                        <input type="checkbox" name="period" value="4" onclick="periodCheck(this);">
                        <label for="oneday">당일</label>
                        </br>
                        <input type="checkbox" name="period" value="6" onclick="periodCheck(this);">
                        <label for="oneday">1박2일</label>
                        </br>
                        <input type="checkbox" name="period" value="8" onclick="periodCheck(this);">
                        <label for="oneday">2박3일</label>


                    </article>
                    <article class=" col-xl-5 tm-article">
                        <h3 class="tm-color-primary tm-article-title-1">출발일</h3>
                      <div id="wrapper">
   				
        				<div class="calendar-container">
							<div id ="tourDateTime" style="float: right !important;"></div>
							<div id="myCalendar" class="vanilla-calendar" style="margin-bottom: 20px"></div>
        			  	<input type="hidden" name="startDay" id="date" value=""/>
						</div>
        			</div>
                    </article>
                    <article class="col-xl-2 tm-article">

                        <h3 class="tm-color-primary tm-article-title-1">여행테마</h3>
                        <p class="box_subtitle">❖ 인원 선택 없음</p>

                        <input type="checkbox" name="thema" value="M" onclick="themaCheck(this);">
                        <label for="oneday">가족과 함께</label>
                        </br>
                        <input type="checkbox" name="thema" value="F" onclick="themaCheck(this);">
                        <label for="oneday">친구와 함께</label>
                        </br>
                        <input type="checkbox" name="thema" value="C" onclick="themaCheck(this);">
                        <label for="oneday">연인과 함께</label>
                        </br>
                        <input type="checkbox" name="thema" value="S" onclick="themaCheck(this);">
                        <label for="oneday">나홀로 여행</label>
                    </article>
                    <article class=" col-xl-2 tm-article service-sub">
                        <h5 class="tm-color-primary ">01 맞춤 선택</h5>
						<h6>02 맞춤코스 보기</h6>
						<h6>03 상품별 예약</h6>
						<h6>04 예약자 정보 동의</h6>
						<h6>05 예약 결제</h6>
						<input type="submit" value="추천코스" class=" tm-color-white tm-btn-white-bordered" />      
                    </article>
                </div>
            </form>
        </div>
    </div>
    
 <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.3.1/semantic.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/service/serviceCalender/pignose.calendar.full.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/service/checkbox.js"></script>



    
    
    
<script src="<%=request.getContextPath() %>/js/calendar/vanilla-calendar-end.js"></script>    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
