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
                    <li><img src="<%=request.getContextPath()%>/images/tour_image/문화유적/히로쓰가옥.jpg" alt="히로쓰가옥" /></li>
                </ul>
            </div>
        </div>
    
        <div class="viewField">
                            <h4>문화유적</h4>
            <!-- 기본정보 -->	
            <div class="fieldBasic">
                <ul>
                    <li class="i-1"><i class='fas fa-pen' style='font-size:16px'></i><p>신흥동일본식가옥</p></li><!-- i-1, 명칭 -->
                    
                    <li class="i-2"><i class='fas fa-phone-volume' style='font-size:16px'></i><p>063-454-3923</p></li><!-- i-2, 문의처 -->	
                    <li class="i-3"><i class='fas fa-map-marker-alt' style='font-size:16px'></i><p>전북 군산시 구영1길</p></li><!-- i-3, 주소 -->	
         
                    <li class="i-4"><i class='far fa-clock' style='font-size:16px'></i><p>이용시간 :</p></li><!-- i-4, 이용시간 -->
     
                </ul>
            </div>
            <div class="conText">
                    <h4 class="h4">신흥동일본식가옥</h4>
    <div class="h4Box">
    <h5 class="h5"><i class='fas fa-check' style='font-size:24px;color:#4c72fc'></i>주 소 : 전북 군산시 구영1길</h5>
    <h5 class="h5"><i class='fas fa-check' style='font-size:24px;color:#4c72fc'></i>문 의 처 : 063-454-3923</h5>
    <h5 class="h5"><i class='fas fa-check' style='font-size:24px;color:#4c72fc'></i>이용시간 : </h5>
    <h5 class="h5"><i class='fas fa-check' style='font-size:24px;color:#4c72fc'></i>휴 무 일 : </h5>
    <ul class="bu01 h5Box">
    <li>히로쓰가옥은 해방 후 적산가옥으로 구 호남제분의 이용구 사장 명의로 넘어가 오늘날까지 한국제분의 소유로 되어 있다. 장군의 아들, 바람의 파이터 등 많은 한국영화가 이 주택에서 촬영 될 정도로 일반에 잘 알려져 있어 2005년 6월 18일 등록문화재 제 183호로 등록되었다.</li></ul>
    <h5 class="h5">주차시설</h5>
    <div class="h5Box">
    <ul class="bu01">
    <li>있음</li>
    </ul></div>
    <h5 class="h5">입장료</h5>
    <div class="basic">
    <table class="conTable">
    <caption>신흥동일본식가옥 입장료 </caption>
    <thead>
    <tr>
    <th scope="col">구분</th>
    <th scope="col">개인</th>
    <th scope="col">20인이상 단체</th></tr></thead>
    <tbody>
    <tr>
    <td colspan="3">무료입장</td>
   </tr></tbody></table></div></div>
            </div>
        </div>
		<p style="text-align: center">
       <input type="button" value="뒤로가기" id="backButton" onclick="history.back(-1);">
		</p>


</div>
</div>