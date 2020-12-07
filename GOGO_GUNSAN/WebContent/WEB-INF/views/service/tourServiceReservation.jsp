<%@page import="java.text.DecimalFormat"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="tour_info.model.vo.TourInfo"%>
<%@page import="java.util.List"%>
<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link rel="stylesheet"href="<%=request.getContextPath()%>/css/service/bootstrap.min.css">
 <link rel="stylesheet"href="<%=request.getContextPath()%>/css/service/tourServiceSelect.css">
<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.js" /></script>
<script src="<%=request.getContextPath()%>/js/service/tourServiceReservation.js"></script>

<%--이부분 수정 reservation css 가져옴 --%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/service/tourService_res.css">


<%
	int cnt = (Integer)session.getAttribute("cnt");
	List<TourInfo> result = (List)session.getAttribute("result");
	String startDay = (String)session.getAttribute("startDay");
  	
	System.out.println(result.size());
	System.out.println("resultList="+result);
	System.out.println("resultList@jsp="+result);
  	int idx = (Integer)request.getAttribute("idx");
	

	System.out.println("i@jspsss"+idx);
	System.out.println("result.get(idx).getTourInfoId()="+	result.get(idx).getTourInfoId());
	
	DecimalFormat frm = new DecimalFormat("###,###,###");
	String childPrice = frm.format(Integer.parseInt(result.get(idx).getChildPrice()));
	String adultPrice = frm.format(Integer.parseInt(result.get(idx).getAdultPrice()));
	System.out.println("childPirce="+childPrice);
	System.out.println("adultPrice="+adultPrice);
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
<%--인원수 줄이기 --%>
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

input.form-control.input-number {
    margin-right: 0 !important;
    margin-top: 5px !important;
    padding: 3px !important;
     width: 40px; 
}
</style>
<script>
$(function() {
	var sum = parseInt($('[name=adultValue]').val())+parseInt($('[name=childValue]').val());

	$('#adultMinus').click(function(e) {

		e.preventDefault();
		var num = $('[name=adultValue]').val();
		if (num == 0) {
			alert('더이상 줄일수 없습니다.');
			num = 0;
		} else if (num >= 1) {
			num--;
		}
		$('[name=adultValue]').val(num);
	});
	$('#adultPlus').click(function(e) {
		e.preventDefault();
		var num = $('[name=adultValue]').val();
		var idx =0;
   
		if (sum>= $('.input-number').attr('max')) {
			alert('더이상 늘릴수 없습니다.');
			console.log('총sum='+sum);
			console.log("어른증가값="+num);
			//num = $('.input-number').attr('max');
		} else if (sum < $('.input-number').attr('max')) {
			num++;
			idx++;
			sum +=idx;
			console.log("어른증가값="+num);
			console.log('총sum='+sum);
		}
		$('[name=adultValue]').val(num);
	});
	
	$('#childMinus').click(function(e) {
		e.preventDefault();
		var num = $('[name=childValue]').val();
		if (num == 0) {
			alert('더이상 줄일수 없습니다.');
			num = 0;
		} else if (num >= 1) {
			num--;
		}
		$('[name=childValue]').val(num);
	});
	$('#childPlus').click(function(e) {
		e.preventDefault();
		var num = $('[name=childValue]').val();
		var idx =0;
		if (sum >= $('.input-number').attr('max')) {
			alert('더이상 늘릴수 없습니다.');
			console.log('어린이sum='+sum);
			console.log('총sum='+sum);
			//num = $('.input-number').attr('max');
		} else if (sum < $('.input-number').attr('max')) {
			num++;
			idx++;
			sum +=idx;
			console.log("어린이증가값="+num);
			console.log('총sum='+sum);
		}
		$('[name=childValue]').val(num);
	});
});

function periodCheck(chk) {
         var obj = document.getElementsByName("CheckBox");
         for (var i = 0; i < obj.length; i++) {
          if (obj[i] != chk) {
         obj[i].checked = false;
           }
       }
     }
	
</script>

<script> 

$(document).ready(function(){
    var date_ = $('#date').text().trim();
	
	console.log("date="+date_);
	
	//티켓여부에 따른 시간표 불러오는 ajax
	$('[name=date]').val(date_);
	<%if(result.get(idx).getHasTicket()=='Y') { %>
		var con = $("#amount-table");
		   con.hide();

		
			let reservation ={
					date : date_,
					tourInfoId : $("[name=tour_info_id]").val()	
					
			}
			
			console.log(reservation);
			$("#amount-table").hide();
			$("#time-table").remove();	
			$.ajax({
				url:"<%=request.getContextPath()%>/reservation/json/reservationGo.do",
				data: reservation,
				dataType:"json",
				success: data=>{
					$('.input-number').empty();
					$ranklist = $("p#time-title");
					$table = $("<table id='time-table'></table>");
					$th = $("<tr><th>시간</th><th>잔여수</th><th></th></tr>");
					$ranklist.append($table);
					$table.append($th);
					$.each(data, function(idx, result){
						
						 let code = "";
						let i =0;
					
		
			
						code += "<tr><td>"+result.time+"</td>"+"<td id ='remainCnt'>"+result.remain+"</td>";
						code += "<td class='td-white-back'><input type='checkbox' class='timeCheck' name='timeCheck' value="+result.time+" onclick=''>";
						code += "<input type='hidden' id='remainChk'  value="+result.remain+"></td>";
				

							
						console.log(code);	
						$('#time-table').append(code);
				
					});	
					$('input[type="checkbox"][name="timeCheck"]').click(function(){
						if($(this).prop('checked')){
							$('.input-number').attr('max', $(this).next().val());	
							console.log("max="+ $(this).next().val());
							con.show();
							
							console.log("remainCHk뭐야"+$(this).children().css( "background-color", "red" ));
							$('input[type="checkbox"][name="timeCheck"]').prop('checked', false);
							$(this).prop('checked', true);
						}else{
								con.hide();
								
						}	
					
					});

				},
				error: (x,s,e) =>{
					//x:xhr
					//s:textStatus
					//e:errorThrown
					console.log(x,s,e);
				}
			});

	
	<%}%>
	
});
</script>

<div class="tm-section-2">
	<div class="container">
		<div class="row">
			<div class="col text-center">
				<h2 class="tm-section-title">군산에서 멋진 경험을 체험해 보세요.</h2>
				<p class="tm-color-white tm-section-subtitle">5분안이면 당신의 여행이 한눈에
				</p>
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
				맞춤코스보기</a> <a class="current badge-inverse"><span class="badge ">03</span>
				상품별 예약</a> <a><span class="badge ">04</span>예약 정보동의</a> <a><span
				class="badge">05</span> 예약 결제</a>
		</div>
		
<!--form 태그 시작 -->

		<form action="<%=request.getContextPath()%>/service/TourServiceRingServlet" id="sv_form"class="sv_form" method="POST">
			<div class="row text-center">
				<article class="col-xl-4 tm-article" id="infoView">
					<h3 class="tm-color-primary tm-article-title-1">여행지 소개</h3>
					<img src="<%=request.getContextPath() %>/images/service_tour_intro/<%=result.get(idx).getImgServiceOriginalFileName()%>">
				</article>
				
	
				<article class=" col-xl-2.5 tm-article" name="dateTimeView">
					<h3 class="tm-color-primary tm-article-title-1"> 날짜</h3>
					<h4 id="date"><%   if(cnt == 4){%>
									<%=startDay%>
								<%}else if(cnt ==6){ %>
									<%if(idx<3) { %>
									<%=startDay %>
									<%} else{%>
									<%=day1End %>
									<%} %>
								<%} else if(cnt == 8){%>
									<%if(idx<3) { %>
									<%=startDay %>
									<%} else if(idx<6){%>
									<%=day1End %>
									<%} else {%>
									<%=day2End %>
									<%} %>
								<%} %>
							</h4>
					<h3 class="tm-color-primary tm-article-title-1">회차 / 시간 선택</h3>
	<!--timetable이 있는 관광 -->
				<%
					System.out.println("result.get(idx).getHasTicket()="+result.get(idx).getHasTicket());
				if(result.get(idx).getHasTicket()=='Y'){%>
					<p id="time-title" class="box_subtitle">❖ 원하시는 시간을 선택해 주세요.</p>
			          <%--타임테이블 ajax로 넣기 --%>
<!-- timetable이 필요 없는 아이  -->
					<%}else if(result.get(idx).getHasTicket()=='N'){ %>
						<p class="box_subtitle">❖ 선택하실 회차/시간이 없습니다. </p>
						<input type="hidden" name="time" value="00:00"/>
					<%} %>
				</article>
				<article class="col-xl-2.5  tm-article">

				<h3 class="tm-color-primary tm-article-title-1">인원 선택</h3>
		<%if(result.get(idx).getHasTicket()=='Y'){%>
					<article class="col-xl-2.5  tm-article">
						<h3 class="tm-color-primary tm-article-title-1">03 인원 선택</h3>
						<p class="box_subtitle">❖ 인원을 선택 해주세요.</p>

						<table id="amount-table">
							<tr>
								<th>어른인원</th>
								<td class="td-wthie-back"><span id="price"><%=adultPrice%>원</span></td>
								<td class="">
									<div class="input-group">
										<span class="input-group-btn">
											<button type="button" class="btn btn-default btn-number"
												id="adultMinus">
												<span class="glyphicon glyphicon-minus">-</span>
											</button>
										</span>
										<div class="selected-amount">
											<input type="text" name="adultValue" 
												class="form-control input-number" value="0" min="0"
												max=""> <span class="input-group-btn"></span>
										</div>
										<span class="input-group-btn">
											<button type="button" class="btn btn-default btn-number"
											id="adultPlus">
												<span class="glyphicon glyphicon-plus">+</span>
											</button>
										</span>
									</div>
								</td>
							</tr>
							<tr>
								<th>어린이 인원</th>
								<td class="td-wthie-back"><span id="price"><%=childPrice%>원</span></td>
								<td class="">
									<div class="input-group">
										<span class="input-group-btn">
											<button type="button" id="childMinus"
												class="btn btn-default btn-number">
												<span class="glyphicon glyphicon-minus">-</span>
											</button>
										</span>
										<div class="selected-amount">
											<input type="text" name="childValue" 
												class="form-control input-number" value="0" min="0"
												max="">
										</div>
										<span class="input-group-btn">
											<button type="button" class="btn btn-default btn-number"
												id="childPlus">
												<span class="glyphicon glyphicon-plus">+</span>
											</button>
										</span>
									</div>
								</td>
							</tr>
						</table>
					</article>
					<%}else if(result.get(idx).getHasTicket()=='N'){%>
					<p class="box_subtitle">❖ 인원 선택하실 필요가 없습니다. </p>
				   <input type="hidden" name="adultValue" value="0">
				   <input type="hidden" name="childValue" value="0">
					<%} %>
				</article>
				<input type="hidden" name="idx" value="<%=idx%>"/> 
          <input type ="hidden" name ="tour_info_id" value="<%=result.get(idx).getTourInfoId()%>"/> 
			<input type="hidden" name="time" value="00:00" />
			<input type="hidden" name="date" value="" /> 
			<input type="hidden" name="member_no" value="<%=memberLoggedIn.getMemberNo()%>" />
			<input type="hidden" name="childPrice" value="<%=result.get(idx).getAdultPrice()%>"/>	
			<input type="hidden" name="adultPrice" value="<%=result.get(idx).getChildPrice()%>"/>
			</form>
				<article class=" col-xl-1.5">
					<h6>01 맞춤 선택</h6>
					<h6>02 맞춤코스 보기</h6>
					<h5 class="tm-color-primary ">03 상품별 예약</h5>
					<h6>04 예약자 정보 동의</h6>
					<h6>05 예약 결제</h6>
					<a href="#" class="tm-color-white tm-btn-white-bordered">이전</a> 
					<%if(!(idx==result.size()-1)){ %>
					<input type="submit" id="nxt_btn" class="tm-color-white tm-btn-white-bordered" value="다음 "
					onclick="goSub();">
				<%}else if(idx == result.size()-1){ %>
				<form id="goFrm" action="<%=request.getContextPath()%>/service/tourServiceAgree" method="POST">
					<input type="submit" id="end" class="tm-color-white tm-btn-white-bordered" value="예약완료 "/>
				</form>				
					<% } %>
				</article>
			</div>
			
	</div>
	

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
