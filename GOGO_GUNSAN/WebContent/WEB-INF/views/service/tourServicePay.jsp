<%@page import="tour_info.model.vo.TourInfo"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="reservation.model.vo.Reservation"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/service/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/service/tourService_res.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/service/tourServiceSelect.css">
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<%
	List<Reservation> rList = (List)session.getAttribute("rList");
	String startDay = (String)session.getAttribute("startDay");
	int cnt = (Integer)session.getAttribute("cnt");
	String type = (String)session.getAttribute("type");
	List<TourInfo> result = (List)session.getAttribute("result");

	
	//날짜 계산하기 1박 2일
			SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
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
            <polygon fill="#ee5057" points="0,0  100,0  50,60"></polygon>
        </svg>
	<div class="container tm-pt-5 tm-pb-4">
		<div class="wizard">
			<a><span class="badge">01</span> 맞춤선택</a> <a><span class="badge">02</span>
				맞춤코스보기</a> <a><span class="badge ">03</span>
				상품별 예약</a> <a><span class="badge ">04</span>예약 정보동의</a> <a class="current badge-inverse"><span
				class="badge">05</span> 예약 결제</a>
		</div>
		<form action="<%=request.getContextPath()%>/service/tourServiceEnd" method="POST">
			<div class="row text-center">
				<article class="col-xl-4 tm-article">
					<h3 class="tm-color-primary tm-article-title-1">결제 상품 </h3>
				    <table class="ticket-tbl container">
				    <%for(int i=0; i<rList.size(); i++){ %>
				        <% String time[] = rList.get(i).getTourDateTime().split("-");%>
							<tr>
								<td rowspan='3'><%=i+1%></td>
								<td rowspan='3'><%if("M".equals(type)){%>
										  	가족여행 
											<%}else if ("F".equals(type)){%>
											친구여행 
											<%}else if("C".equals(type)){ %>
											커플여행 
											<%}else if("S".equals(type)){%>
											나홀로 여행 
											<%}%></td>
								<td colspan='3'><b>
								<%for(int j=0; j<result.size(); j++){ %>
								<%if(rList.get(i).getTourInfoId().equals(result.get(j).getTourInfoId())){%>
									<%=result.get(j).getTourInfoName() %>
								<% } %>
								<%} %>
								</b></td>
							</tr>

							<tr>
								<td><%=time[0]%>  <% if(!"999".equals(time[1])){ %> (<%=time[1]%>) <% }%></td>

							</tr>
							<tr>

								<td>어른: <%=rList.get(i).getAdultAmount()%>매 어린이: <%=rList.get(i).getChildAmount()%>매
								</td>
							</tr>
							<%} %>
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
				<article class=" col-xl-1.5">
					<h6>01 맞춤 선택</h6>
					<h6>02 맞춤코스 보기</h6>
					<h5 class="tm-color-primary ">03 상품별 예약</h5>
					<h6>04 예약자 정보 동의</h6>
					<h6>05 예약 결제</h6>
					<input type="submit" value="결제완료" class="tm-color-white tm-btn-white-bordered" />
				</article>
			</div>
		</form>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
