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
                    <li><img src="<%=request.getContextPath()%>/images/tour_image/문화유적/이영춘가옥.jpg" alt="이영춘가옥" /></li>
                </ul>
            </div>
        </div>
    
        <div class="viewField">
                            <h4>문화유적</h4>
            <!-- 기본정보 -->	
            <div class="fieldBasic">
                <ul>
                    <li class="i-1"><i class='fas fa-pen' style='font-size:16px'></i><p>이영춘가옥</p></li><!-- i-1, 명칭 -->
                    
                    <li class="i-2"><i class='fas fa-phone-volume' style='font-size:16px'></i><p>063-452-8884</p></li><!-- i-2, 문의처 -->	
                    <li class="i-3"><i class='fas fa-map-marker-alt' style='font-size:16px'></i><p>전북 군산시 돈개정길 7</p></li><!-- i-3, 주소 -->	
         
                    <li class="i-4"><i class='far fa-clock' style='font-size:16px'></i><p>이용시간 :</p></li><!-- i-4, 이용시간 -->
     
                </ul>
            </div>
            <div class="conText">
                    <h4 class="h4">이영춘가옥</h4>
    <div class="h4Box">
    <h5 class="h5"><i class='fas fa-check' style='font-size:24px;color:#4c72fc'></i>주 소 : 전북 군산시 돈개정길 7</h5>
    <h5 class="h5"><i class='fas fa-check' style='font-size:24px;color:#4c72fc'></i>문 의 처 : 063-452-8884</h5>
    <h5 class="h5"><i class='fas fa-check' style='font-size:24px;color:#4c72fc'></i>이용시간 : </h5>
    <h5 class="h5"><i class='fas fa-check' style='font-size:24px;color:#4c72fc'></i>휴 무 일 : </h5>
    <ul class="bu01 h5Box">
    <li>일제강점기 군산에서 대규모 농장을 경영하던 일본인 대지주 구마모토 리헤이가 지은 별장주택으로 일년에 봄철과 추수철에 농장을 방문할 때 임시거처로 사용되던 별장과 같은 건물로 서구식과 한식, 일식의 여러 건축양식이 절충된 다양한 양식적 특성을 띄며, 해방 후 우리나라 농촌보건위생의 선구자 쌍천 이영춘 박사가 거주하며 이영춘 가옥이라 불리게 되었다.</li></ul>
    <h5 class="h5">주차시설</h5>
    <div class="h5Box">
    <ul class="bu01">
    <li>있음</li>
    </ul></div>
    <h5 class="h5">입장료</h5>
    <div class="basic">
    <table class="conTable">
    <caption>이영춘가옥 입장료 </caption>
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