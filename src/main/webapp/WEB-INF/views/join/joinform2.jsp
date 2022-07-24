<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>

<script>
	var authType = "hhp";
	
	$(document).ready(function() {
		 $("#agree-all").on("change",function(){
			 if($(this).prop("checked")==true){
				 $("input[value=Y]").prop("checked",true)
	
				 $('#ageAgreYn').prop('checked', true)
				 $('#ageAgreYn').val('Y')
	
				 var scrollHeight = $(document).outerHeight();
				 $("html,body").animate({scrollTop:scrollHeight},500)
			 } else {
				 $("input[value=Y]").prop("checked",false)
				 $("#ageAgreYn").prop("checked",false)
				 $('#ageAgreYn').val('N')
			 }
		 })
	
		 $(".argree-item").on("change",function(){
			 var agree = 0
			 $(".argree-item").each(function(){
				 if($(this).find("input[value=Y]").prop("checked")==true || $(this).find("input[type=checkbox]").prop("checked")==true){
					 agree+=1
				 }
			 })
	
			 if(agree == $(".argree-item").length){
				 $("#agree-all").prop("checked",true)
			 } else {
				 $("#agree-all").prop("checked",false)
			 }
		 })
	
		 $('#ageAgreYn').on('change', function() {
			 if($(this).prop("checked")==true){
				 $('#ageAgreYn').val('Y')
			 } else {
				 $('#ageAgreYn').val('N')
			 }
		 })
	
		 $(".btn-next").on("click",function(){
			 if(authType == null) {
				 if($('#ageAgreYn').is(':checked') == false) {
					 casamia.csAlert('만 14세 이상부터 회원가입이 가능합니다.<br>동의 항목을 확인해 주시기 바랍니다.')
					 return;
				 }
			 }
	
			 var item=[]
			 $(".argree-item").each(function(){
				 var agreeVal = $(this).find('input:checked').val();
	
				 if( agreeVal == null || agreeVal == '' ) {
					 item.push( $(this).find('h3 span').text().trim() )
				 } else {
					 if($(this).hasClass('required')) {
						 if(agreeVal == 'N') {
							 item.push( $(this).find('h3 span').text().trim() )
						 }
					 }
				 }
			 })
	
			if(item.length > 0){
				var msg = "아래 동의 항목을 확인해주시기 바랍니다. <br> - "+item.join(", ")
				casamia.csAlert(msg)
			} else {
				var agreeData = new Object();
	
				var jsonObject = {};
				$(".argree-item .agree-area").each(function(){
					var id = $(this).attr('id')
					var input = $(this).find('input:checked').val()
	
					if ( id.indexOf("prvinfo") > - 1) {
						id ='prvinfo';
					}
					jsonObject[id] = input;
				})
	
				qtjs.func.requestPost({
					url: "\/api\/mbr\/joinAgreeChk.json",
					data: jsonObject
				}, function(resData) {
					if(resData.success) {
						qtjs.func.redirect('/web/mbr/joinInfo')
					} else {
						qtjs.func.redirect('/web/mbr/joinError')
					}
				});
			}
		 })
	
		 $(".btn-prev").on("click",function(){
			 casamia.csConfirm(
				'이전화면으로 돌아가시겠습니까? <br/>입력하신 정보가 모두 초기화 됩니다.'
				, function() {
					qtjs.func.redirect('/web/mbr/join')
				}
			 )
	
		 })
		});
</script>
<style>
    body, h2{
         margin: 0;
            margin-bottom: 20px;
    }
  	.h_2{
		width:100%;
		text-align: center;
         position: sticky;
         top: 0; /* 클래스 sticky인 요소 안에서 top값이 0이되면 sticky를 적용 */
         line-height: 80px;
    }
    .h2{
		background-color: white;
            /* padding-top: 3%; */
            font-size: 20px;
        }
        .h3{
            font-family: HY견명조, sans-serif;
            padding-top:15px;
            width:100%;
            height: 100px;
            padding-bottom: 15px;
            background-color: black;
            color: white;
            text-align: center;
            font-weight: 400;
            font-size: 25px;
        }
        .h_3{
        	padding-left: 23%;
        }
    .p1{
            text-align: center;
            font-weight: 400;
            font-size: 20px;
        }
    .p2{
        padding-left: 23%;
        padding-right: 24%;
    }
    .allall{
    	padding-left: 23%;
    	padding-right: 24%;
    }
    .all{
    	text-align: left;
    }
    .allcheck{
    	margin-left: 63%;
    }
    .red{
        color: red;
    }
    .t1{
    	padding-left: 23%;
    	padding-right: 24%;
        /* text-align: left;
        width: 800px;
        height: 100px;
        border: solid;
        border-width: 1px 1px 1px 1px;
        border-color: #787878;
        padding-left: 10px;
        padding-right: 10px;
        color: #333;
        font-size: 12px; */
    }
    /* .t_1{
    	border: 1px solid;
    	border-color: #787878;
    	color: #333;
    	font-size: 13px;
    	height: 150px;
  		width: 200px;
    } */
    .t2{
    	padding-left: 23%;
    	padding-right: 24%;
        /* text-align: left;
        width: 800px;
        height: 100px;
        border: solid;
        border-width: 1px 1px 1px 1px;
        border-color: #787878;
        padding-left: 10px;
        padding-right: 10px;
        color: #333;
        font-size: 12px; */
    }
    .t3{
    	padding-left: 23%;
    	padding-right: 24%;
        /* text-align: left;
        width: 800px;
        height: 100px;
        border: solid;
        border-width: 1px 1px 1px 1px;
        border-color: #787878;
        padding-left: 10px;
        padding-right: 10px;
        color: #333;
        font-size: 12px; */
    }
    .t4{
    	padding-left: 23%;
    	padding-right: 24%;
        /* text-align: left;
        width: 800px;
        height: 100px;
        border: solid;
        border-width: 1px 1px 1px 1px;
        border-color: #787878;
        padding-left: 10px;
        padding-right: 10px;
        color: #333;
        font-size: 12px; */
    }
    /* 버튼위치 */
    
    
    /* 버튼 전체 */
    .btn-popup {
    width: 100px;
    height: 30px;
    padding: 5px 5px 5px 5px;
    border: 1px solid #000;
    font-family: 'Lato', sans-serif;
    font-weight: 500;
    background: transparent;
    cursor: pointer;
    transition: all 0.3s ease;
    position: relative;
    display: inline-block;
    font-size: 10px;
    }
    /* 1번버튼 */
    .btn-popup {
    transition: all 0.3s ease;
    }
    .btn-popup:hover {
    box-shadow:
    -7px -7px 20px 0px #fff9,
    -4px -4px 5px 0px #fff9,
    7px 7px 20px 0px #0002,
    4px 4px 5px 0px #0001;
    }
    
    /* 이전 버튼 */
    .white {
    width: 200px;
    height: 40px;
    padding: 5px 5px 5px 5px;
    border: 1px solid #000;
    font-family: 'Lato', sans-serif;
    font-weight: 500;
    background: transparent;
    cursor: pointer;
    transition: all 0.3s ease;
    position: relative;
    display: inline-block;
    font-size: 20px;
    }
    /* 이전버튼 */
    .btn-prev {
    transition: all 0.3s ease;
    }
    .btn-prev:hover {
    box-shadow:
    -7px -7px 20px 0px #fff9,
    -4px -4px 5px 0px #fff9,
    7px 7px 20px 0px #0002,
    4px 4px 5px 0px #0001;
    }
    /* 종료버튼 */
    .basic {
    
    width: 200px;
    height: 40px;
    padding: 5px 5px 5px 5px;
    border: 1px solid #000;
    font-family: 'Lato', sans-serif;
    font-weight: 500;
    background: transparent;
    cursor: pointer;
    transition: all 0.3s ease;
    position: relative;
    display: inline-block;
    font-size: 20px;
    }
    /* 종료버튼 */
    .btn-next {
        background: #000;
        color: white;
        transition: all 0.3s ease;
    }
    .btn-next:hover {
        box-shadow:
        -7px -7px 20px 0px #fff9,
        -4px -4px 5px 0px #fff9,
        7px 7px 20px 0px #0002,
        4px 4px 5px 0px #0001;
    }
</style>
<body>
    <div class="h3">
            <h3>gusinsa.com</h3>
        </div>
            <div class="h_2">
                <div class="h2">
                    <h2>회원가입</h2>
                    <hr />
                </div>
            </div>
    <div class="wrapper">

	    <div class="container sign-in agreement">

	        <div class="head-area type02">
	            <p class="bold">약관동의</p>
	            <p>고객님의 회원가입 시 필요한 정보 수집 시 「개인정보보호법」 제15조, 제22조 및 「정보통신망 이용 촉진 및 정보보호 등에 관한 법률」 제22조에 따라
	                고객 본인의 동의를 얻고 있습니다. 이에 아래 약관 및 개인정보 수집 내용을 확인하시고 동의여부를 결정하여 주시기 바랍니다.</p>
	        </div>

	        <div class="sub-gray">
	            	아래의 약관에 모두 동의합니다.
	            <div class="agree-area">
	                <input type="checkbox" id="agree-all"/>
	                <label for="agree-all">전체동의</label>
	            </div>
	        </div>

					<div class="argree-item required">
					    <h3>
					    	<span>서비스 이용약관</span>
					    	<span class="red">(필수)</span>
					    </h3>
					    <div class="terms-area">이 약관은 ㈜구신사에서 운영하는 까사미아 굳멤버스와 구신사닷컴(https://gusinsa.com) 에서 제공하는 인터넷 관련 서비스를 이용함에 있어 ㈜구신사와 이용자의 권리, 의무 및 책임 사항을 규정함을 목적으로 합니다.</div>
					    <div class="clear-fix">
					        <button type="button" class="btn-popup" onclick="showTermDetail( $(this).attr(&#39;data-termType&#39;) )" data-termType="MEMBER">전문보기</button>
					        <div class="agree-area" id="member">
					            <input type="radio" name="agreement02" id="agree02" value="Y"/><label for="agree02">동의함</label>
					            <input type="radio" name="agreement02" id="disagree02" value="N"/><label for="disagree02">동의 안함</label>
					        </div>
					    </div>
					</div>
				
					<div class="argree-item required">
					    <h3>
					    	<span>개인정보 수집 및 이용동의</span>
					    	<span class="red">(필수)</span>
					    </h3>
					    <div class="terms-area">당사는 구신사 멤버스 통합회원 및 구신사 간편가입회원에게 <br/>본인확인, 포인트 적립 및 결제 서비스, 다양하고 편리한 서비스를 제공하기 위해 아래의 방법을 통해 개인정보를 수집하고 있습니다. </div>
					    <div class="clear-fix">
					        <button type="button" class="btn-popup" onclick="showTermDetail( $(this).attr(&#39;data-termType&#39;) )" data-termType="PRV_INFO_ON">전문보기</button>
					        <div class="agree-area" id="prvinfoon">
					            <input type="radio" name="agreement03" id="agree03" value="Y"/><label for="agree03">동의함</label>
					            <input type="radio" name="agreement03" id="disagree03" value="N"/><label for="disagree03">동의 안함</label>
					        </div>
					    </div>
					</div>
				
					<div class="argree-item required">
					    <h3>
					    	<span>개인정보처리 위탁동의</span>
					    	<span class="red">(필수)</span>
					    </h3>
					    <div class="terms-area">당사는 서비스 이행을 위해 아래와 같이 개인정보 처리 업무를 외부업체에 위탁하여 운영하고 있습니다.</div>
					    <div class="clear-fix">
					        <button type="button" class="btn-popup" onclick="showTermDetail( $(this).attr(&#39;data-termType&#39;) )" data-termType="PRV_REF">전문보기</button>
					        <div class="agree-area" id="prvref">
					            <input type="radio" name="agreement04" id="agree04" value="Y"/><label for="agree04">동의함</label>
					            <input type="radio" name="agreement04" id="disagree04" value="N"/><label for="disagree04">동의 안함</label>
					        </div>
					    </div>
					</div>
				
					<div class="argree-item">
					    <h3>
					    	<span>위치정보서비스 활용동의</span>
					    	<span>(선택)</span>
					    </h3>
					    <div class="terms-area">(주)구신사는 직접 위치정보를 수집하거나 위치정보사업자로부터 위치정보를 전달받아 위치기반서비스(주변매장찾기)를 제공합니다.<br/>위치기반서비스의 이용요금은 무료입니다. 단, 무선서비스 이용시 발생하는 데이터 통신료는 별도이며, 이용자가 가입한 각 이동통신사의 정책을 따릅니다.</div>
					    <div class="clear-fix">
					        <button type="button" class="btn-popup" onclick="showTermDetail( $(this).attr(&#39;data-termType&#39;) )" data-termType="LBS_SVC">전문보기</button>
					        <div class="agree-area" id="lbssvc">
					            <input type="radio" name="agreement01" id="agree01" value="Y"/><label for="agree01">동의함</label>
					            <input type="radio" name="agreement01" id="disagree01" value="N"/><label for="disagree01">동의 안함</label>
					        </div>
					    </div>
					</div>
				
			

	        <div class="btn-bottom-area type01">
			 	<button type="button" class="white btn-prev">이전</button>
	            <button type="button" class="basic btn-next">다음</button>
	        </div>

	    </div>
    </body>
    </html>