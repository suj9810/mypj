<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
	function checkOne(chk){
	    var obj = document.getElementsByName("psn");
	    for(var i=0; i<obj.length; i++){
	        if(obj[i] != chk){
	            obj[i].checked = false;
	        }
	    }
	}
	function checkTwo(ch){
	    var obj = document.getElementsByName("marketing");
	    for(var i=0; i<obj.length; i++){
	        if(obj[i] != ch){
	            obj[i].checked = false;
	        }
	    }
	}
</script>
<head>
<meta charset="UTF-8">
<title>gusinsa.join</title>
</head>
    <style>
        /* 테이블 & th */
        .table_1{
            padding-left: 500px;
        }
        th{
            color: #333;
        }
        body, h2{
            margin: 0;
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
        .sp1{
            padding-right: 200px;
        }
        /* 아이디 */
        #idemail{
            width: 400px;
            height: 35px;
        }
        /* 비밀번호 & 확인 */
        #pw{
            width: 400px;
            height: 35px;
        }
        #pwcheck{
            width: 400px;
            height: 35px;
        }
        /* 이름 */
        #name{
            width: 400px;
            height: 35px;
        }
        /* 생년월일 */
        #bithdate{
            width: 300px;
            height: 35px;
        }
        /* 전화번호 */
        #tel{
            width: 300px;
            height: 35px;
        }
        /* 이메일 */
        #email{
            width: 400px;
            height: 35px;
        }
        /* 상세주소 */
        #sample6_postcode{
            width: 100px;
            height: 35px;
            margin-bottom: 5px;
        }
        #sample6_address{
            width: 288px;
            height: 35px;
            margin-bottom: 5px;
        }
        #sample6_extraAddress{
            width: 150px;
            height: 35px;
        }
        #sample6_detailAddress{
            width: 238px;
            height: 35px;
        }
        /* 개인정보설명 */
        #reperson{
            width: 400px;
            height: 35px;        
        }
        /* 매장찾기 */
        #shop{
            width: 400px;
            height: 35px;        
        }
        /* 비밀번호설명 */
        #pwex{
            color: #9c9c9c;
            font-size: 12px;
        }
        /* 회원정보입력 및 회원가입 설명 */
        .p1{

            text-align: center;
            font-weight: 400;
            font-size: 20px;
        }
        /* 회원정보입력 */
        .p2{
            font-weight: 900;
            font-size: 30px;
        }
        /* 회원기본정보 */
        .t_body{
            text-align: left;
        }
        /* 마케팅동의 */
        .mar{
            text-align: left;
            width: 800px;
            height: 100px;
            border: solid;
            border-width: 1px 1px 1px 1px;
            border-color: #787878;
            padding-top: 10px;
            padding-left: 10px;
            padding-right: 10px;
            padding-bottom: 10px;
            color: #9c9c9c;
            font-size: 15px;
        }
        /* 회원가입마지막확인 */
        .mem-save{
            text-align: center;
        }
        /* 개인정보설명 */
        .add-info{
            padding-left:16px;
            position:relative;
            color:#5a5d5a;
            font-size:14px;
        }
        /* 개인정보설명2 */
        .personal{
            font-size: 10px;
        }
        /* -빨간 *- */
        .red{
            color : red;
        }
        /* 배송주소 설명 */
        .adep{
            font-size: 10px;
        }
        /* 아이디 동일 이메일 확인 */
        .idsame{
            font-size: 10px;
        }
        /* 버튼 */
        /* 우편번호찾기버튼 */
        .addr-btn {
            width: 90px;
            height: 35px;
            padding: 5px 5px 5px 5px;
            border: 1px solid #000;
            font-family: 'Lato', sans-serif;
            font-weight: 500;
            background: transparent;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            display: inline-block;
            font-size: 12px;
            font-weight: bold;
        }
        /* 우편번호찾기버튼 */
        .btn-1 {
            background: #000;
            color: #fff;
            transition: all 0.3s ease;
        }
        .btn-1:hover {
            box-shadow:
            -7px -7px 20px 0px #fff9,
            -4px -4px 5px 0px #fff9,
            7px 7px 20px 0px #0002,
            4px 4px 5px 0px #0001;
        }
        /* 매장찾기버튼 */
        .shop-btn {
            width: 90px;
            height: 35px;
            padding: 5px 5px 5px 5px;
            border: 1px solid #000;
            font-family: 'Lato', sans-serif;
            font-weight: 500;
            background: transparent;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            display: inline-block;
            font-size: 12px;
            font-weight: bold;
        }
        /* 매장찾기버튼 */
        .btn-2 {
            background: #000;
            color: #fff;
            transition: all 0.3s ease;
        }
        .btn-2:hover {
            box-shadow:
            -7px -7px 20px 0px #fff9,
            -4px -4px 5px 0px #fff9,
            7px 7px 20px 0px #0002,
            4px 4px 5px 0px #0001;
        }
        /* 전문보기 버튼 */
        .alltext-btn {
            text-align: center;
            width: 90px;
            height: 35px;
            padding: 5px 5px 5px 5px;
            border: 1px solid #000;
            font-family: 'Lato', sans-serif;
            font-weight: 500;
            background: transparent;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            display: inline-block;
            font-size: 12px;
            font-weight: bold;
        }
        /* 전문보기 */
        .btn22{
            text-align: center;
        }
        .btn-3 {
            transition: all 0.3s ease;
        }
        /* 이전 버튼 */
        .customm-btn {
            text-align: center;
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
            font-weight: bold;
        }
        /* 이전버튼 */
        .btn22{
            text-align: center;
        }
        .btn-5 {
            transition: all 0.3s ease;
        }
        .btn-5:hover {
            box-shadow:
            -7px -7px 20px 0px #fff9,
            -4px -4px 5px 0px #fff9,
            7px 7px 20px 0px #0002,
            4px 4px 5px 0px #0001;
        }
        /* 종료버튼 */
        .customm2-btn {
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
            font-weight: bold;
        }
        /* 종료버튼 */
        .btn-6 {
            background: #000;
            color: #fff;
            transition: all 0.3s ease;
        }
        .btn-6:hover {
            box-shadow:
            -7px -7px 20px 0px #fff9,
            -4px -4px 5px 0px #fff9,
            7px 7px 20px 0px #0002,
            4px 4px 5px 0px #0001;
        }
        .line_one{
        	width: 60%;
        }
        /*푸터어어어*/
		footer {width: 100%;height: 10px;bottom: 5px;  position: relative;border-top: 1px solid #c4c4c4; color: #808080;font-size: 11px; transform: translateY(-100%);}
		footer a:visited {color: #808080;}
		footer p {margin-top: 0;  margin-left: 10px;}
		footer p span {display: inline-block;margin-left: 20px; margin-bottom: 5px;} 
		#wrap{
		    width: 100%;height: auto;
		    min-height: 100%;
		    margin-top: 10px;
		}
		#wrap_section{
		    margin-top: 50px;
		    margin-left: 0;
		}
		#footer_addr{float: left;}
		.footer_div{margin-top: 20px;margin-right: 30px;float: right; margin-bottom: 10px;}
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
    <div class="p1">
        <div class="p2">
            <p>회원정보입력</p>
        </div>
        <p>회원가입을 위해 회원정보를 입력하여 주시기 바랍니다.</p>
    </div>
    <table class="table_1">
        <tbody class="t_body">
            <tr>
                <th>[회원기본정보]</th>
                <td>
                    <span>'<span class="red">*</span>' 표시된 정보는 필수입력 정보입니다.</span>
                </td>
            </tr>
            <tr>
                <th><span class="red">*</span>아이디</th>
                
                    <td>
                        <input type="email" name="mid" id="idemail" placeholder=" 이메일 주소를 입력해주세요." />
                    </td>
                
            </tr>
            <tr>
                <th class="psps"><span class="red">*</span>비밀번호</th>
                <td>
                    <input type="password" name="mpw" id="pw" placeholder=" 비밀번호를 입력해주세요." />
                    <p id="pwex">10~20자리</p>
                    <p id="pwex">영소문자/숫자/특수문자 중 두가지 이상 조합</p>
                    <p id="pwex">사용가능한 특수문자:~!@#$%^&*()_+ </p>
                    <p id="pwex">연속된 숫자/문자 사용 불가 </p>
                    <p id="pwex">비밀번호에 아이디 포함 불가</p>
                </td>
            </tr>
            <tr>
                <th><span class="red">*</span>비밀번호 확인</th>
                <td>
                    <input type="password" name="mpwc" id="pwcheck" placeholder=" 비밀번호를 다시 입력해주세요." />
                </td>
            </tr>
            <tr>
                <th><span class="red">*</span>이름</th>
                <td>
                    <input type="text" name="mname" id="name" placeholder=" 이름을 입력해주세요." />
                </td>
            </tr>
            <tr>
                <th><span class="red">*</span>생년월일/성별</th>
                <td>
                    <input type="tel" name="mgender" value="" id="bithdate" placeholder=" 생년월일을 입력해주세요." readonly="readonly"/>
                    <input type="radio" name="gender" value="M" id="male" />남
                    <input type="radio" name="gender" value="F" id="female" />여
                </td>
            </tr>
            <tr>
                <th><span class="red">*</span>휴대폰번호</th>
                <td>
                    <input type="tel" name="mphone" value="" id="tel" placeholder=" 휴대폰 번호를 입력해주세요." readonly="readonly"/>
                </td>
            </tr>
            <tr>
                <th class="mailmail"><span class="red">*</span>이메일</th>
                <td>
                    <input type="tel" name="memail" value="" id="email" placeholder=" 이메일 주소를 입력해주세요." /> <br />
                    <input type="checkbox" /><span class="idsame">아이디로 사용할 이메일 주소와 동일합니다.</span>
                </td>
            </tr>
            <tr>
                <th><span class="red">*</span>주소 </th>
                <td>
                    <input type="text" name="maddr" id="sample6_postcode" placeholder="우편번호" readonly="readonly">
					<input type="text" name="maddr" id="sample6_address" placeholder="주소" readonly="readonly">
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="addr-btn btn-1"><br>
					<input type="text" name="maddr" id="sample6_extraAddress" placeholder="참고항목" readonly="readonly">
					<input type="text" name="maddr" id="sample6_detailAddress" placeholder=" 상세 주소를 입력해주세요.">
                    <div class="add-info">
                        <p class="adep">구매하신 상품 등에 대한 배송 받으실 주소를 입력해 주시기 바랍니다.</p>
                    </div>
                </td>
            </tr>
            <tr>
                <th>개인정보 유효기간</th>
                <td>
                    <span><input value="1" type="checkbox" name="psn" onclick="checkOne(this);"/>평생회원(탈퇴 시/동의 철회 시)</span>
                    <span><input value="2" type="checkbox" name="psn" onclick="checkOne(this);"/>1년</span>
                    <span><input value="3" type="checkbox" name="psn" onclick="checkOne(this);"/>3년</span>
                    <span><input value="4" type="checkbox" name="psn" onclick="checkOne(this);"/>5년</span> <br />
                    <div class="add-info">
                        <p class="personal">개인정보 유효기간 경과 시, 개인정보를 분리 저장/관리 또는 파기합니다.</p>
                    </div>
                </td>
            </tr>
            <tr>
                <th>[선택입력정보]</th>
            </tr>
            <tr>
                <th>마케팅정보 활용동의</th>
                <td>
                    <p>마케팅정보 수신에 대한 약관을 확인하신 후 서비스 제공을 원하신다면 동의함 버튼을 눌러주시기 바랍니다.</p>
                    <p class="mar">회원님께 구신사 에서 준비한 다양한 이벤트 소식 및 혜택/서비스를 제공하고자 마케팅 수신 동의를 받고 있습니다.
                        구신사에서 제공하는 다양한 제품과 서비스, 인테리어 정보를 만나보실 수 있습니다. 단, 약관안내, 서비스 내용, 
                        회사 주요 정책 변경에 따른 메시지는 수신 동의 여부와 상관없이 발송됩니다.</p>
                    <span><button class="alltext-btn btn-3">전문보기</button></span>
                    <span><input value="1" type="checkbox" name="marketing" onclick="checkTwo(this);" type="checkbox" />동의함</span>
                    <span><input value="2" type="checkbox" name="marketing" onclick="checkTwo(this);" type="checkbox" />동의 안함</span>
                </td>
            </tr>
            <tr>
                <th>추천인</th>
                <td>
                    <input type="text" id="reperson" placeholder=" 추천인 코드를 입력해 주세요."/>
                </td>
            </tr>
            <tr>
                <th>주 이용매장</th>
                <td>
                    <input type="text" id="shop" value="" placeholder=" 이용 매장을 입력해주세요." readonly="readonly"/>
                    <span><button class="shop-btn btn-2">매장찾기</button></span>
                </td>
            </tr>
        </tbody>
    </table>
    <hr class="line_one"/>
        <div class="mem-save">
            <h4>구신사 회원가입을 완료하시겠습니까?</h4>
        </div>
        <div class="btn22">
            <button class="customm-btn btn-5">이전</button>
            <button class="customm2-btn btn-6">다음</button>
        </div>
        <div id='wrap'>
        <section id="wrap_section">
            
        </section>
        <footer>
            <div id="footer_addr">
    
          <p>
            <table>
            <tr>
                <td>상호명 : (주)구신사</td>
                <td>조장 : 이종현</td>
                <td>주소 : 서울시 구로구 </td>
            </tr>
            <tr>
                <td colspan="3">이메일 : dlwhdgus@gmail.com</td>
                <td></td>
                <td></td>
            </tr>
            </table>
          </p>
        </div>
    
          <div class="footer_div">
            <table>
                <tr>
                    <td>고객문의 대표전화</td>
                    <td>고객센터 문의전화</td>
                </tr>
                <tr>
                    <td>1588-1588</td>
                    <td>1588-3407</td>
                </tr>
                <tr>
                    <td>평일 09:00 ~ 18:00 <br>(주말 및 공휴일 휴무)</td>
                    <td><a href="#">구신사 상품 문의접수</a></td>
                </tr>
            </table>
          </div>
      </footer>
    </div>
    </body>
    </html>