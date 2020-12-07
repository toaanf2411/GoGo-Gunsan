
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="time.model.vo.TourTime"%>

<%@page import="tour_info.model.vo.TourInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 헤더 선언!!-->
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/main/main.css">
<% 

	TourInfo tourInfo = (TourInfo)request.getAttribute("tourInfo");
	TourTime tourTime = (TourTime)request.getAttribute("tourTime");
	List<String> tourDateTimeList = (List<String>)request.getAttribute("tourDateTimeList");
	
	
	String[] tourDate= new String[tourDateTimeList.size()];
	for(int i=0; i<tourDateTimeList.size(); i++){
		tourDate[i] = tourDateTimeList.get(i);
	}
	
	List<String> dateTime = new ArrayList<>();
	for(int i=0;i<tourDate.length;i++){
		String splitDateTime = tourDate[i];
		dateTime.add(splitDateTime);
	}

  	for(String item : dateTime){
				String[] splitData = item.split("-");
  	}
	
	
	DecimalFormat frm = new DecimalFormat("###,###,###");

	String childPrice = frm.format(Integer.parseInt(tourInfo.getChildPrice()));
	String adultPrice = frm.format(Integer.parseInt(tourInfo.getAdultPrice()));


%>
 
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/calendar/vanilla-calendar-min.css">
<script src="<%=request.getContextPath() %>/js/calendar/vanilla-calendar-min.js"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel='stylesheet'
	href='https://fonts.googleapis.com/css?family=Roboto:300,400,700'>

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
			console.log("remainCnt="+parseInt($('#remainCnt').text()));
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
	
</script>

<script> 


$(document).ready(function() {
	
	$('#myCalendar').click(function(){
	     let year = selectedDate.getFullYear();
	     let month =selectedDate.getMonth()+1;
	     let date =selectedDate.getDate();

	     let myDate = String(year)+'/'+String(month)+'/'+String(date);

	     $('#tourDateTime').text(myDate);
	     

	
	});
	

});


</script>
<div class="tm-section-2">
	<div class="container">
		<div class="row">
			<div class="col text-center">
				<h2 class="tm-section-title">군산에서 멋진 경험을 체험해 보세요.</h2>
				<p class="tm-color-white tm-section-subtitle">통합예약하기</p>
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
			<a class="current badge-inverse"><span class="badge">01</span>통합예약</a>
			<a><span class="badge ">02</span>예약자 정보동의</a> <a><span
				class="badge ">03</span>예약 결제</a>
		</div>
		<div class="reservation-content-contianer">
			<form action="<%=request.getContextPath()%>/reservation/reservationAgree" method="POST">
				<div class="row text-center">
					<article class="col-xl-4 tm-article first-col">
						<h3 class="tm-color-primary tm-article-title-1 first-tm">01
							날짜선택</h3>
						<div class="calendar-container">
							<div id ="tourDateTime" style="float: right !important;"></div>
							<div id="myCalendar" class="vanilla-calendar" style="margin-bottom: 20px"></div>
						</div>
					</article>
								
					<article class="col-xl-2.5 tm-article">
						<h3 class="tm-color-primary tm-article-title-1">02 회차 / 시간 선택</h3>
						<p id="time-title" class="box_subtitle">❖ 원하시는 시간을 선택해 주세요.</p>
						 <%--타임테이블 생성 --%>
					</article>
					<article class="col-xl-2.5  tm-article">
						<h3 class="tm-color-primary tm-article-title-1">03 인원 선택</h3>
						<p  class="box_subtitle">❖ 인원을 선택 해주세요.</p>

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
				

				
					<article class="col-xl-1.5 tm-article service-sub">
						<h5 class="tm-color-primary ">01 통합 예약</h5>
						<h6 class="title-h6">02 예약자 정보동의</h6>
						<h6 class="title-h6">03 예약 결제</h6>
						<input type="submit" id="btn-next"class="tm-btn-white-bordered"  value="다음"/>
					</article>
				</div>
				
				<%--input 넘겨주기 --%>
				  <input type="hidden" name="date" id="date" value="">
				  <input type="hidden" name="tourInfoId" id="tourInfoId" value="<%=tourInfo.getTourInfoId()%>"/>
					
				  
			</form>
		</div>
	</div>
</div>
<div id="test1"></div>

<script>
$(document).ready(function(){
		
		<%--처음 통합예약 선택 페이지 들어갈 때 수량 테이블 숨기기--%>
	   var con = $("#amount-table");
	   con.hide();
	 
	<%--회원이 원하는 날짜  선택시 시간회차 및 잔여수 체크 테이블 만들기--%>
	$("#myCalendar").click(function(){
	 	
		//필요한 
		let reservation ={
				date : $("[name=date]").val(),
				tourInfoId : $("[name=tourInfoId]").val()
		}	
		$("#amount-table").hide();
		$("#time-table").remove();
		
		$.ajax({
			url:"<%=request.getContextPath()%>/reservation/json/reservationGo.do",
			data: reservation,
			dataType:"json",
			success: data=>{
				console.log(data); 
				$ranklist = $("p#time-title");
				$table = $("<table id='time-table'></table>");
				$th = $("<tr><th>시간</th><th>잔여수</th><th></th></tr>");
				$ranklist.append($table);
				$table.append($th);
				 $('.input-number').empty();
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
		
						$('.input-number').attr('max', $(this).next().val() );	
						
						con.show();
						
					
						$('input[type="checkbox"][name="timeCheck"]').prop('checked', false);
						$(this).prop('checked', true);
						}else{
							con.block();
							
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
				
	});

});
</script>
<script src="<%=request.getContextPath() %>/js/calendar/vanilla-calendar-end.js"></script>
<!-- 풋터 선언!!-->
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
