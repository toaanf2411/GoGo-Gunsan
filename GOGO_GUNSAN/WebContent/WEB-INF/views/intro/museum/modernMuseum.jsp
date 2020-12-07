<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/main/main.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/intro/intro.css">
<!-- 헤더 선언!!-->
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!-- 사이드메뉴 선언!  -->
<%@ include file="/WEB-INF/views/common/intro_sidebar.jsp"%>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/intro/info.css">
<div class="gunsan-wrapper">
	<div class="gunsan-page-title">
		<nav id="topMenu">
			<ul>
				<li><a class="menuLink"
					href="<%=request.getContextPath()%>/intro/GunsInfoGo">전체</a></li>
				<li><a class="menuLink"
					href="<%=request.getContextPath()%>/intro/GunsInfoNature">자연</a></li>
				<li><a class="menuLink"
					href="<%=request.getContextPath()%>/intro/GunsInfoPark">공원</a></li>
				<li><a class="menuLink"
					href="<%=request.getContextPath()%>/intro/GunsInfoTown">마을</a></li>
				<li><a class="menuLink"
					href="<%=request.getContextPath()%>/intro/GunsInfoMuseum"
					style="background: #ee8342;">박물관/전시관</a></li>
				<li><a class="menuLink"
					href="<%=request.getContextPath()%>/intro/GunsInfoRuins">문화유적</a></li>
				<li><a class="menuLink"
					href="<%=request.getContextPath()%>/intro/GunsInfoLeisure">레저/체험</a></li>
			</ul>
		</nav>
	</div>
	<div class="board">
		<div class="A-1_View">
			<div class="viewImg">
				<ul>
					<li><img
						src="<%=request.getContextPath()%>/images/tour_image/박물관전시관/근대역사박물관.jpg"
						alt="근대역사박물관" /></li>
				</ul>
			</div>
		</div>

		<div class="viewField">
			<h4>박물관/전시관</h4>
			<!-- 기본정보 -->
			<div class="fieldBasic">
				<ul>
					<li class="i-1"><i class='fas fa-pen' style='font-size: 16px'></i>
					<p>근대역사박물관</p></li>
					<!-- i-1, 명칭 -->

					<li class="i-2"><i class='fas fa-phone-volume'
						style='font-size: 16px'></i>
					<p>063-454-7872</p></li>
					<!-- i-2, 문의처 -->
					<li class="i-3"><i class='fas fa-map-marker-alt'
						style='font-size: 16px'></i>
					<p>전라북도 군산시 해망로 240</p></li>
					<!-- i-3, 주소 -->

					<li class="i-4"><i class='far fa-clock'
						style='font-size: 16px'></i>
					<p>09:00 ~ 21:00</p></li>
					<!-- i-4, 이용시간 -->

				</ul>
			</div>
			<div class="conText">
				<h4 class="h4">근대역사박물관</h4>
				<div class="h4Box">
					<h5 class="h5">
						<i class='fas fa-check' style='font-size: 24px; color: #4c72fc'></i>주
						소 : 근대역사박물관
					</h5>
					<h5 class="h5">
						<i class='fas fa-check' style='font-size: 24px; color: #4c72fc'></i>문
						의 처 : 063-454-7872
					</h5>
					<h5 class="h5">
						<i class='fas fa-check' style='font-size: 24px; color: #4c72fc'></i>이용시간
						: 09:00 ~ 21:00
					</h5>
					<h5 class="h5">
						<i class='fas fa-check' style='font-size: 24px; color: #4c72fc'></i>휴
						무 일 : 1월 1일, 시장이 휴관일로 정한 날, 매월 첫번째, 세번째 월요일
					</h5>
					<ul class="bu01 h5Box">
						<li>근대역사교육의 도시 군산에 자리한 군산의 근대문화 및 해양문화를 주제로 하는 특화 박물관이자
							지역박물관으로서 방문객들이 군산의 역사와 문화를 체험 할 수 있는 공간이다.</li>
						<li>부지2,525평(8,348㎡) 연면적1,285평(4,248㎡)이고, 지하1층 지상3층으로 구성되어
							있으며 사업비 182억이 소요되었으며 사업 기간은 2007년 시작하여 2011년 9월에 개관하였다.</li>
					</ul>
					<h5 class="h5">주차시설</h5>
					<div class="h5Box">
						<ul class="bu01">
							<li>1층 - 해양물류역사관(509㎡), 어린이박물관(126㎡), 수장고(113㎡)</li>
							<li>2층 - 근대자료규장각실(84㎡)</li>
							<li>3층 - 근대생활관(617㎡), 기획전시실(231㎡), 세미나실(73㎡)</li>
						</ul>
					</div>
					<h5 class="h5">입장료</h5>
					<div class="basic">
						<table class="conTable">
							<caption>근대역사박물관 입장료</caption>
							<thead>
								<tr>
									<th scope="col">구분</th>
									<th scope="col">통합권</th>
									<th scope="col">박물관</th>
									<th scope="col">진포해양공원<br> (위봉함)
									</th>
									<th scope="col">조선은행</th>
									<th scope="col">18은행</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row">성인<br> (군산시거주자)
									</th>
									<td>3,000<br> (2,000)
									</td>
									<td>2,000<br> (1,000)
									</td>
									<td>1,000<br> (500)
									</td>
									<td>500(500)</td>
									<td>500(500)</td>
								</tr>
								<tr>
									<th scope="row">청소년,군인<br> (군산시거주자)
									</th>
									<td>2,000<br> (1,000원)
									</td>
									<td>1,000<br> (500)
									</td>
									<td>700(300)</td>
									<td>300(300)</td>
									<td>300(300)</td>
								</tr>
								<tr>
									<th scope="row">어린이<br> (군산시거주자)
									</th>
									<td>1,000<br> (500)
									</td>
									<td>500<br> (300)
									</td>
									<td>300(200)</td>
									<td>200(200)</td>
									<td>200(200)</td>
								</tr>
								<tr>
									<th scope="row"><span class="colorR">무료입장</span></th>
									<td colspan="5">6세이하 아동, <span class="colorR">65세이상
											어른</span> , 장애인, 유공자
									</td>
								</tr>
								<tr>
									<th scope="row">문의전화</th>
									<td colspan="5">063-454-7872(근대역사박물관)</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<p style="text-align: center">
			<input type="button" value="뒤로가기" id="backButton"
				onclick="history.back(-1);">
		</p>


	</div>
</div>


<!-- 풋터 선언!!-->
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
