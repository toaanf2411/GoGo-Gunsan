<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/service/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/service/tourService_res.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/service/tourServiceSelect.css">
<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<script>
	$(document).ready(function(){
		$('#nextStep').click(function(){
			
		if($('#checkBox_01').prop('checked') == false ||$('#checkBox_02').prop('checked') == false||$('#checkBox_03').prop('checked') == false ){
		    	alert('필수 약관에 동의 하셔야 합니다.');
		    	return false;
		}else{
				$("#reservationFrm2").attr("action", "<%=request.getContextPath() %>/reservation/reservationPay").submit();
			
			}
		});
	});
	
	$(document).ready(function(){
	    var flag = true;
		var checkbox= $('.checkBox');
	    
	    $('#chkAll').click(function(){
	        if(flag){
	            checkbox.prop({
	                'checked': true
	            });
	            flag = false;
	        }else{
	            checkbox.prop({
	                'checked': false
	            });
	            flag = true;
	        }
	    });
	});
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
				맞춤코스보기</a> <a><span class="badge ">03</span> 상품별 예약</a> <a
				class="current badge-inverse"><span class="badge ">04</span>예약
				정보동의</a> <a><span class="badge">05</span> 예약 결제</a>
		</div>

			<div class="row text-center">
			
                            <article class="col-xl-4 tm-article">
                                <h3 class="tm-color-primary tm-article-title-1">01 개인정보 수집 및 이용약관
                                    동의</h3>
                                <p class="agree">
                                    개인정보 수집이용 등에 대한 동의 전문 (주)GOGO GUNSAN이 제공하는 군통합예약서비스는 아래의 각각의 목적으로
                                    개인정보를 수집 및 이용하며, 고객의 개인정보를 안전하게 취급하는데 최선을 다합니다. </br> 개인정보 수집이용 동의 전문
                                    (필수동의) 군통합예약 서비스 이용과 관련하여 본인은 동의 내용을 숙지하였으며, 이에 따라 귀사(㈜GOGO
                                    GUNSAN)가 본인의 개인정보를 아래와 같이 수집하는 것에 대해 동의합니다. </br> - 수집항목 : 이름, 휴대폰번호,
                                    이메일 주소(선택)</br> - 수집/이용 목적 : 예매 확인,/취소/ 발권에 따른 </br> 본인확인 및 서비스 관련 고지사항 전달을
                                    위한 의사소통 경로 확보 </br> ※ 본 동의는 서비스의 본질적 기능 제공을 위한 개인정보 수집/이용에 대한 동의로서,
                                    동의하지 않으실 경우 서비스 제공이 불가능합니다.
                                </p>
                                <input type="checkbox" id="checkBox_02"  class="checkBox"  value="">
                                <label class="tm-color-primary " for="">
                                    <h5>개인정보수집 및 이용약관 (필수)</h5>
                                </label> </br>
                                <input type="checkbox" id="checkBox_03" class="checkBox"  value="">
                                <label class="tm-color-primary " for="">
                                    <h5>만 14세 이상의 동의 (필수)</h5>
                                </label> </br>
                                <input type="checkbox" name="" class="checkBox" value="">
                                <label class="tm-color-primary " for="">
                                    <h5>광고성 정보수신에 동의 (선택)</h5>
                                </label>
                            </article>

                            <article class="col-xl-4 tm-article">
                                 
                                <h3 class="tm-color-primary tm-article-title-1 ">02 취소환불규정 동의 </h3>
                                <p class="agree">
                                    대금굴] 환불규정 </br>

                                    임장 7일전 취소 : 100% 환불</br>
                                    입장 6일 ~ 3일전 취소 : 예매금액의 20% 공제</br>
                                    입장 2일전 취소 : 예매금액의 30% 공제</br>
                                    입장 1일전 및 지정일시 경과전 취소 : 예매금액의 40% 공제</br>
                                    지정일시 경과 후 30분 이내 : 예매금액의 60% 공제</br>
                                    지정일시 경과 후 30분 이후 : 예매금액의 100%</br></br>

                                    * 취소 수수료 금액이 1,000원 이하일 경우 1,000원이 부과됩니다.</br>
                                    * 무통장 예약 후 2일이내 임금이 안될 시에는 예약이 자동 취소됩니다.</br>
                                    * 무통장 입금 후 취소 할 경우, 환불수수료 500원이 차감후 환불됩니다.</br>
                                    (환불수수료 : 환불계좌인증 서비스 및 자동 환불 서비스)</br>
                                    * 대금굴 예매 후 취소한 경우 3~7일 이내에 환불처리 됩니다.
                                </p>
                                <input type="checkbox" id="checkBox_01" class="checkBox" value="">
                                <label class="tm-color-primary " for="">
                                    <h5>취소환불규정에 동의(필수)</h5>
                                </label> </br>
                                <input type="checkbox" name=""  id="chkAll" value="">
                                <label class="tm-color-primary" for="">
                                    <h5>모두 동의합니다.</h5>
                                </label>

                            </article>
  	 
				<article class=" col-xl-2 ">
					<h5>01 맞춤 선택</h5>
					<h6>02 맞춤코스 보기</h6>
					<h6>03 상품별 예약</h6>
					<h6 class="tm-color-primary ">04 예약자 정보 동의</h6>
					<h6>05 예약 결제</h6>
					<a href="#" class="tm-color-white tm-btn-white-bordered">이전</a>
					<form action="<%=request.getContextPath()%>/service/tourServicePay" method="POST">
						<input type="submit" class="tm-color-white tm-btn-white-bordered" id="nextStep" value="다음">
					</form>
				</article>
			</div>

	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
