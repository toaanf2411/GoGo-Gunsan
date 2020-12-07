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
                    <li><img src="<%=request.getContextPath()%>/images/tour_image/레저체험/승마체험.jpg" alt="승마체험" /></li>
                </ul>
            </div>
        </div>
    
        <div class="viewField">
                            <h4>레저체험</h4>
            <!-- 기본정보 -->	
            <div class="fieldBasic">
                <ul>
                    <li class="i-1"><i class='fas fa-pen' style='font-size:16px'></i><p>승마체험</p></li><!-- i-1, 명칭 -->
                    
                    <li class="i-2"><i class='fas fa-phone-volume' style='font-size:16px'></i><p>063-453-9971</p></li><!-- i-2, 문의처 -->	
                    <li class="i-3"><i class='fas fa-map-marker-alt' style='font-size:16px'></i><p>전북 군산 성산면 고봉리 147-1</p></li><!-- i-3, 주소 -->	
         
                    <li class="i-4"><i class='far fa-clock' style='font-size:16px'></i><p>연중무휴</p></li><!-- i-4, 이용시간 -->
     
                </ul>
            </div>
            <div class="conText">
                    <h4 class="h4">승마체험</h4>
    <div class="h4Box">
    <h5 class="h5"><i class='fas fa-check' style='font-size:24px;color:#4c72fc'></i>주 소 : 전북 군산 성산면 고봉리 147-1</h5>
    <h5 class="h5"><i class='fas fa-check' style='font-size:24px;color:#4c72fc'></i>문 의 처 : 063-453-9971</h5>
    <h5 class="h5"><i class='fas fa-check' style='font-size:24px;color:#4c72fc'></i>이용시간 : 00:00 ~ 24:00</h5>
    <h5 class="h5"><i class='fas fa-check' style='font-size:24px;color:#4c72fc'></i>휴 무 일 : 연중무휴</h5>
    <ul class="bu01 h5Box">
    <li>승마체험</li></ul>
    <h5 class="h5">주차시설</h5>
    <div class="h5Box">
    <ul class="bu01">
    <li>있음</li>
    </ul></div>
    <h5 class="h5">입장료</h5>
    <div class="basic">
    <table class="conTable">
    <caption>승마체험 체험료 </caption>
    <thead>
    <tr>
    <th scope="col">구분</th>
    <th scope="col">이용금액</th>
    <th scope="col">프로그램</th></tr></thead>
    <tbody>
    <tr>
    <td>일반체험</td>
    <td>33,000/22,000원(15분)</td>
    <td rowspan="2">기본레슨, 장비대여 포함 <br>※기승(20분)</td>
   </tr>
   <tr>
       <td>단체체험(10인이상)</td>
       <td>22,000원</td>
   </tr>
</tbody></table></div></div>
            </div>
        </div>
		<p style="text-align: center">
       <input type="button" value="뒤로가기" id="backButton" onclick="history.back(-1);">
		</p>


</div>
</div>