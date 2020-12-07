<%@page import="tour_info.model.vo.TourInfo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<TourInfo> list = (List<TourInfo>)request.getAttribute("list");
	System.out.println("list@jsp="+list);
%>
<!-- 헤더 선언!!-->
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!-- 사이드메뉴 선언!  -->
<%@ include file="/WEB-INF/views/common/reservation_sidebar.jsp"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/common/searchbox.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/reservation/reservation.css" />

<script>
function reservation(){
	$("#reservationFrm").attr("action", "<%=request.getContextPath()%>/reservation/reservationGo").submit();
};

function modernMuseum(){
		let url = "<%=request.getContextPath()%>/reservation/resInfo/modernMuseum";
		window.open(url, '근대역사박물관', 'width=900, height=800');
	};
	
function customsMuseum(){
		let url = "<%=request.getContextPath()%>/reservation/resInfo/customsMuseum";
		window.open(url, '호남관세박물관', 'width=900, height=800');
	};
	
function modernArchitecture(){
		let url = "<%=request.getContextPath()%>/reservation/resInfo/modernArchitecture";
		window.open(url, '근대건축관', 'width=900, height=800');
	};
	
function modernArt(){
		let url = "<%=request.getContextPath()%>/reservation/resInfo/modernArt";
		window.open(url, '근대미술관', 'width=900, height=800');
	};
	
function memorialHall(){
		let url = "<%=request.getContextPath()%>/reservation/resInfo/memorialHall";
		window.open(url, '군산3.1기념관', 'width=900, height=800'); 
	};
	
function riding(){
		let url = "<%=request.getContextPath()%>/reservation/resInfo/riding";
		window.open(url, '승마체험', 'width=900, height=800');
	};

function paragliding(){
		let url = "<%=request.getContextPath()%>/reservation/resInfo/paragliding";
		window.open(url, '패러글라이딩', 'width=900, height=800');
	};

function zipline(){
		let url = "<%=request.getContextPath()%>/reservation/resInfo/zipline";
		window.open(url, '선유스카이 SUN라인', 'width=900, height=800');
	};
	
function clam(){
		let url = "<%=request.getContextPath()%>/reservation/resInfo/clam";
		window.open(url, '바지락캐기 체험', 'width=900, height=800');
	};
	
function fishing(){
		let url = "<%=request.getContextPath()%>/reservation/resInfo/fishing";
		window.open(url, '낚시체험', 'width=900, height=800');
	};
	
function lotus(){
		let url = "<%=request.getContextPath()%>/reservation/resInfo/lotus";
		window.open(url, '연꽃재배', 'width=900, height=800');
	};
	
function nativeFood(){
		let url = "<%=request.getContextPath()%>/reservation/resInfo/nativeFood";
		window.open(url, '토속음식체험', 'width=900, height=800');
	};

	$(function() {
		let $exhibit = $("#search-exhibit");
		let $experience = $("#search-experience");
	});
</script>
<div class="gunsan-wrapper">
	<div class="gunsan-page-title">
		<h1>전체</h1>
		<div id="search-container">
			<form action="<%=request.getContextPath()%>/reservation/findInfo">
				<input type="hidden" name="searchType" value="findInfo" />
				<div class="search__container">
					<input type="text" class="search__input" name="searchKeyword"
						placeholder="검색할 관광지명을 입력하세요.">
				</div>
			</form>
		</div>
	</div>
	<div class="booking-container">
	<%
		if (list == null || list.isEmpty()) {
	%>
	<table>
		<tr>
			<td colspan="10" align="center">검색 결과가 없습니다.</td>
		</tr>
	</table>
	<%
		} else {
		
	%>
		<%--예약 1개 --%>
		<%
			for (TourInfo t : list) {
					
					String view ="";
					if("TA60001".equals(t.getTourInfoId())){
						view="clam";
					}else if("TA60002".equals(t.getTourInfoId())){
						view="fishing";
					}else if("TA60003".equals(t.getTourInfoId())){
						view="lotus";
					}else if("TA60004".equals(t.getTourInfoId())){
						view="nativeFood";
					}else if("TA60005".equals(t.getTourInfoId())){
						view="riding";
					}else if("TA60006".equals(t.getTourInfoId())){
						view="paragliding";
					}else if("TA60007".equals(t.getTourInfoId())){
						view="zipline";
						
					}else if("TA40001".equals(t.getTourInfoId())){
						view="modernMuseum";
					}else if("TA40002".equals(t.getTourInfoId())){
						view="customsMuseum";
					}else if("TA40003".equals(t.getTourInfoId())){
						view="modernArchitecture";
					}else if("TA40004".equals(t.getTourInfoId())){
						view="modernArt";
					}else if("TA40005".equals(t.getTourInfoId())){
						view="memorialHall";
					}
		%>
		<div class="card shadow-2dp">
			<div id="pic-container">
				<img
					src="<%=request.getContextPath()%>/images/photos/<%=t.getTourInfoName()%>.jpg"
					alt="" />
				<p id="title"></p>
			</div>
			<div id="caption">

				<p id="description"><%=t.getTourInfoName() %></p>

				<div class="booking-buttons">
					<form id="reservationFrm" method="POST"
						action="<%=request.getContextPath()%>/reservation/reservationGo" onsubmit="return reservation();">
						<button class="blob-btn">
							예약하기 <span class="blob-btn__inner"> <span
								class="blob-btn__blobs"> <span class="blob-btn__blob"></span>
									<span class="blob-btn__blob"></span> <span
									class="blob-btn__blob"></span> <span class="blob-btn__blob"></span>
							</span>
							</span>
						</button>
						<input type="hidden" name="tour_id" value="<%=t.getTourInfoId() %>" />
					</form>

					<button class="blob-btn" onclick="<%=view %>();">
						상세보기 <span class="blob-btn__inner"> <span
							class="blob-btn__blobs"> <span class="blob-btn__blob"></span>
								<span class="blob-btn__blob"></span> <span
								class="blob-btn__blob"></span> <span class="blob-btn__blob"></span>
						</span>
						</span>
					</button>
				</div>

			</div>
		</div>
		<%--예약 1개  끝--%>
		<%
			 }
	
			}
	%>
	</div>

</div>



<!-- 풋터 선언!!-->
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
