<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/reservation/reservationInfo/reservationInfo.css">  
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<div class="board">
        <div class="A-1_View">	
            <div class="viewImg">
                <ul>
                    <li><img src="<%=request.getContextPath()%>/images/tour_image/레저체험/낚시체험.jpg" alt="낚시체험" /></li>
                </ul>
            </div>
        </div>
    
        <div class="viewField">
                            <h4>레저체험</h4>
            <!-- 기본정보 -->	
            <div class="fieldBasic">
                <ul>
                    <li class="i-1"><i class='fas fa-pen' style='font-size:16px'></i><p>신시도(낚시 체험)</p></li><!-- i-1, 명칭 -->
                    
                    <li class="i-2"><i class='fas fa-phone-volume' style='font-size:16px'></i><p>063-463-7088</p></li><!-- i-2, 문의처 -->	
                    <li class="i-3"><i class='fas fa-map-marker-alt' style='font-size:16px'></i><p>전북 군산시 옥도면 신시도리</p></li><!-- i-3, 주소 -->	
         
                    <li class="i-4"><i class='far fa-clock' style='font-size:16px'></i><p>체험기간: 4월~6월, 8월~10월</p></li><!-- i-4, 이용시간 -->
     
                </ul>
            </div>
            <div class="conText">
                    <h4 class="h4">월명호수</h4>
    <div class="h4Box">
    <h5 class="h5"><i class='fas fa-check' style='font-size:24px;color:#4c72fc'></i>주 소 : 전북 군산시 옥도면 신시도리</h5>
    <h5 class="h5"><i class='fas fa-check' style='font-size:24px;color:#4c72fc'></i>문 의 처 : 063-463-7088</h5>
    <h5 class="h5"><i class='fas fa-check' style='font-size:24px;color:#4c72fc'></i>이용시간 : </h5>
    <h5 class="h5"><i class='fas fa-check' style='font-size:24px;color:#4c72fc'></i>체험기간: 4월~6월, 8월~10월</h5>
    <ul class="bu01 h5Box">
    <li>준비물: 낚시도구,기타</li></ul>
    <h5 class="h5">주차시설</h5>
    <div class="h5Box">
    <ul class="bu01">
    <li>있음</li>
    </ul></div>
    <h5 class="h5">체험비</h5>
    <div class="basic">
    <table class="conTable">
    <caption>낚시체험 체험비</caption>
    <thead>
    <tr>
    <th scope="col">구분</th>
    <th scope="col">개인</th>
    <th scope="col">20인이상 단체</th></tr></thead>
    <tbody>
    <tr>
    <td colspan="3">5000원</td>
   </tr></tbody></table></div></div>
            </div>
        </div>
		<p style="text-align: center">
       <input type="button" value="뒤로가기" id="backButton" onclick="history.back(-1);">
		</p>


</div>
</div>