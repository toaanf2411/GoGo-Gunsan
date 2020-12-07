<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/main/main.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/intro/intro.css">
<!-- 헤더 선언!!-->
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!-- 사이드메뉴 선언!  -->
<%@ include file="/WEB-INF/views/common/intro_sidebar.jsp" %>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/intro/info.css">
<div class="gunsan-wrapper">
<div class="gunsan-page-title">
		            <nav id="topMenu" >
                    <ul>
                            <li><a class="menuLink" href="<%=request.getContextPath() %>/intro/GunsInfoGo">전체</a></li>
                            <li><a class="menuLink" href="<%=request.getContextPath() %>/intro/GunsInfoNature" style="background: #ee8342;">자연</a></li>
                            <li><a class="menuLink" href="<%=request.getContextPath() %>/intro/GunsInfoPark">공원</a></li>
                            <li><a class="menuLink" href="<%=request.getContextPath() %>/intro/GunsInfoTown">마을</a></li>
                            <li><a class="menuLink" href="<%=request.getContextPath() %>/intro/GunsInfoMuseum">박물관/전시관</a></li>
                            <li><a class="menuLink" href="<%=request.getContextPath() %>/intro/GunsInfoRuins">문화유적</a></li>
                            <li><a class="menuLink" href="<%=request.getContextPath() %>/intro/GunsInfoLeisure">레저/체험</a></li>
                    </ul>
            </nav>
	</div>
	<div class="board">
        <div class="A-1_View">	
            <div class="viewImg">
                <ul>
                    <li><img src="<%=request.getContextPath()%>/images/tour_image/박물관전시관/31기념관.jpg" alt="3.1기념관" /></li>
                </ul>
            </div>
        </div>
    
        <div class="viewField">
                            <h4>박물관전시관</h4>
            <!-- 기본정보 -->	
            <div class="fieldBasic">
                <ul>
                    <li class="i-1"><i class='fas fa-pen' style='font-size:16px'></i><p>군산3.1운동기념관</p></li><!-- i-1, 명칭 -->
                    
                    <li class="i-2"><i class='fas fa-phone-volume' style='font-size:16px'></i><p>063-454-5940</p></li><!-- i-2, 문의처 -->	
                    <li class="i-3"><i class='fas fa-map-marker-alt' style='font-size:16px'></i><p>전북 군산시 구암동</p></li><!-- i-3, 주소 -->	
         
                    <li class="i-4"><i class='far fa-clock' style='font-size:16px'></i><p>평일, 주말 09:00~18:00</p></li><!-- i-4, 이용시간 -->
     
                </ul>
            </div>
            <div class="conText">
                    <h4 class="h4">월명호수</h4>
    <div class="h4Box">
    <h5 class="h5"><i class='fas fa-check' style='font-size:24px;color:#4c72fc'></i>주 소 : 전북 군산시 구암동</h5>
    <h5 class="h5"><i class='fas fa-check' style='font-size:24px;color:#4c72fc'></i>문 의 처 : 063-454-5940</h5>
    <h5 class="h5"><i class='fas fa-check' style='font-size:24px;color:#4c72fc'></i>평일, 주말 09:00~18:00</h5>
    <h5 class="h5"><i class='fas fa-check' style='font-size:24px;color:#4c72fc'></i>휴관일 : 매주 월요일, 1월1일, 설날, 추석날</h5>
    <ul class="bu01 h5Box">
    <li>한강 이남에서 최초로 군산 지역에서 일어난 3·1 독립 만세 운동의 애국 정신을 기념하고 전승하기 위하여 2008년 11월 20일 군산 3·1 운동 기념 사업회가 주관하여 기념관을 건립 및 개관.</li></ul>
    <h5 class="h5">주차시설</h5>
    <div class="h5Box">
    <ul class="bu01">
    <li>있음</li>
    </ul></div>
    <h5 class="h5">입장료</h5>
    <div class="basic">
    <table class="conTable">
    <caption>3.1운동기념관 입장료 </caption>
    <thead>
    <tr>
    <th scope="col">구분</th>
    <th scope="col">성인</th>
    <th scope="col">청소년, 군인</th></tr></thead>
    <tbody>
    <tr>
    <td>입장료</td>
    <td>1000원</td>
    <td>700원</td>
   </tr></tbody></table></div></div>
            </div>
        </div>
		<p style="text-align: center">
       <input type="button" value="뒤로가기" id="backButton" onclick="history.back(-1);">
		</p>


</div>
</div>