
<%@page import="java.text.DecimalFormat"%>
<%@page import="reservation.model.vo.Reservation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/main/main.css">
<%
	Reservation reservation = (Reservation) request.getAttribute("reservation");
	String tourInfoName = (String) request.getAttribute("tourInfoName");
	
	String[] date_time = reservation.getTourDateTime().split("-");
	
	DecimalFormat frm = new DecimalFormat("###,###,###");
	String totalPrice = frm.format(Integer.parseInt(reservation.getTotalPrice()));
%>
<!-- 헤더 선언!!-->
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel='stylesheet'
	href='https://fonts.googleapis.com/css?family=Roboto:300,400,700'>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/calendar/calendar.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/reservation/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/reservation/tourService_res.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/reservation/tourServiceSelect.css">
<script src="<%=request.getContextPath()%>/js/service/checkbox.js"></script>
<script
	src="<%=request.getContextPath()%>/js/service/tourServiceReservation.js"></script>
<style>
input.form-control.input-number {
	background-color: white !important;
	box-sizing: border-box;
	border-radius: 50px 50px !important;
	text-align: center;
	font-size: 11px !important;
	padding: .25rem .40rem important;
}

.reservation-content-contianer {
	text-align: center;
	margin-bottom: 20px;
	background-color: rgba(212, 211, 211, 0.856);
	width: 100%;
	margin: 0 auto;
}

button.btn.btn-default.btn-number {
	background: none;
}

h5.tm-color-primary {
	font-size: 0.9rem;
}

h6.title-h6 {
	font-size: 0.75rem;
}

article.first-col {
	left: 25px;
	width: 290px;
}

h3.first-tm {
	width: 300px;
	margin-block-start: 0em;
	margin-block-end: 0em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
}

select.card-val {
	font-size: 12px;
}
</style>
<style>
.circle-img {
	width: 50px;
	height: 50px;
	border-radius: 50px;
	background: black;
}
</style>
<script>
        $(document).ready(function(){
            //현재HTML문서가 브라우저에 로딩이 끝났다면   
             $("div.select-pay").hide();
              $('#card').click(function(){
            		$("#card-pay").show();
            		$("#bank-pay").hide();
            		$("#card").style.backgroundColor = "#e83e8c";
              });//click
                  
               $('#bank').click(function(){
            	   $("#bank-pay").show();
                	$("#card-pay").hide();
                	$("#bank").style.backgroundColor = "#e83e8c";
               });
           });//ready  

         function reservationEnd(){
        		$("#reservationEndFrm").attr("action", "<%=request.getContextPath()%>/reservation/reservationEnd").submit();
	};
</script>
<div class="tm-section-2">
	<div class="container">
		<div class="row">
			<div class="col text-center">
				<h2 class="tm-section-title">군산에서 멋진 경험을 체험해 보세요.</h2>
				<p class="tm-color-white tm-section-subtitle">5분안이면 당신의 여행이 한눈에
				</p>
				<a href="#" class="tm-color-white tm-btn-white-bordered">Subscribe
					Newletters</a>
			</div>
		</div>
	</div>
</div>



<div class="tm-section tm-position-relative">
	<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"
		preserveAspectRatio="none" class="tm-section-down-arrow">
                        <polygon fill="#ee5057"
			points="0,0  100,0  50,60"></polygon>
                    </svg>
	<div class="container tm-pt-5 tm-pb-4">
		<div class="wizard">
			<a><span class="badge">01</span>통합 예약</a> <a><span class="badge ">02</span>예약자
				정보동의</a> <a class="current badge-inverse"><span class="badge ">03</span>예약
				결제</a>
		</div>
		<div class="reservation-content-contianer">
			<form id="reservationEndFrm" method="POST">
				<div class="row text-center">
					<article class="col-xl-4 tm-article">
						<h3 class="tm-color-primary tm-article-title-1">결제 상품</h3>
						<table class="ticket-tbl container">
							<tr>
								<td rowspan='3'>01</td>
								<td rowspan='3'><img
                                        src="<%=request.getContextPath() %>/images/photos/<%=tourInfoName%>.jpg"
                                        alt="" 
                                        style="width:50px; height:50px; border-radius:50%;"/></td>
								<td colspan='3'><b><%=tourInfoName%></b></td>
							</tr>

							<tr>
								<td><%=date_time[0]%>  <% if(!"999".equals(date_time[1])){ %> (<%=date_time[1]%>) <% }%></td>

							</tr>
							<tr>

								<td>어른: <%=reservation.getAdultAmount()%>매 어린이: <%=reservation.getChildAmount()%>매
								</td>
							</tr>
						</table>



						<table class="container">
							<tr>
								<td colspan='2' class="tm-color-primary">총 금액</td>
								<td colspan='3'><span class="tm-color-primary"><%=totalPrice%>원
								</span></td>
							</tr>
						</table>

					</article>
					<article class=" col-xl-2 tm-article">
						<h3 class="tm-color-primary tm-article-title-1">결제수단</h3>
						<p class="box_subtitle">❖ 원하시는 결제수단을 선택해 주세요.</p>
						<input type="button" class="pay-btn" id="card" name="payCard" value="신용카드" onclick="selectPayType();"> 
						<input type="button" class="pay-btn" id="bank" name="payBank" value="계좌이체" onclick="selectPayType();">
					</article>

					<article class="col-xl-2.5  tm-article">

						<h3 class="tm-color-primary tm-article-title-1">결제수단 세부항목</h3>
						<div class="select-pay" id="card-pay">
							<p class="box_subtitle">❖ 결제하실 카드사를 선택해 주세요.</p>
							<select name="pay-card-val" class="card-val" size="1">
								<option value="">카드사선택</option>
								<option value="C">군산카드</option>
								<option value="C">국민카드</option>
								<option value="C">하나카드</option>
								<option value="C">신한카드</option>
							</select>
						</div>
						<div class="select-pay" id="bank-pay">
							<p class="box_subtitle">❖ 결제하실 은행를 선택해 주세요.</p>
							<select name="pay-bank-val" class="card-val" size="1">
								<option value="">은행선택</option>
								<option value="W">군산은행</option>
								<option value="W">국민은행</option>
								<option value="W">하나은행</option>
								<option value="W">신한은행</option>
							</select>
						</div>

					</article>
					<article class="col-xl-1.5 tm-article service-sub">
						<h6 class="title-h6 ">01 통합 예약</h6>
						<h6 class="title-h6">02 예약자 정보동의</h6>
						<h5 class="tm-color-primary">03 예약 결제</h5>
		
                		<input type="hidden" name="tourInfoName" value="<%=tourInfoName%>" />
						<input type="hidden" name="adultAmount" value="<%=reservation.getAdultAmount() %>" />
                        <input type="hidden" name="childAmount" value="<%=reservation.getChildAmount() %>" />
                        <input type="hidden" name="tourDateTime" value="<%=reservation.getTourDateTime() %>" />
                        <input type="hidden" name="tourInfoId" value="<%=reservation.getTourInfoId()%>" />
                        <input type="hidden" name="totalPrice" value="<%=reservation.getTotalPrice() %>" />
                        <input type="hidden" name="memberNo" value="<%=memberLoggedIn.getMemberNo() %>" />
						<button class="tm-btn-white-bordered" onclick="reservationEnd();">결제하기</button>
					</article>
				</div>
				<%--ReservationEnd로 보내주기 --%>
		
			</form>
		</div>
	</div>
</div>
<!-- 풋터 선언!!-->
<%@ include file="/WEB-INF/views/common/footer.jsp"%>