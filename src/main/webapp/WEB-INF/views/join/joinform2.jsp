<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<script>
	/* 전체동의 */
	/* 첫번째 약관 동의 */
	function checkOne(chk){
	    var obj = document.getElementsByName("check1");
	    for(var i=0; i<obj.length; i++){
	        if(obj[i] != chk){
	            obj[i].checked = false;
	        }
	    }
	}
	/* 두번째 약관 동의 */
	function checkTwo(ch){
	    var obj = document.getElementsByName("check2");
	    for(var i=0; i<obj.length; i++){
	        if(obj[i] != ch){
	            obj[i].checked = false;
	        }
	    }
	}
	/* 세번째 약관 동의 */
	function checkThree(chch){
	    var obj = document.getElementsByName("check3");
	    for(var i=0; i<obj.length; i++){
	        if(obj[i] != chch){
	            obj[i].checked = false;
	        }
	    }
	}
	/* 네번째 약관 동의 */
	function checkFour(chchk){
	    var obj = document.getElementsByName("check4");
	    for(var i=0; i<obj.length; i++){
	        if(obj[i] != chchk){
	            obj[i].checked = false;
	        }
	    }
	}
</script>
<style>
    table{
            padding-left: 500px;
    }
    body, h2{
            margin: 0;
            margin-bottom: 20px;
    }
    header{
            position: fixed;
            left: 0;
            right: 0;
            top: 0;
            height: 4rem;
            line-height: 4rem;
            text-align: center;
    }
    .h2{
            background-color: white;
    }
    .h3{
            font-family: HY견명조, sans-serif;
            padding-top:5px;
            width:1900px;
            height: 100px;
            padding-bottom: 25px;
            background-color: black;
            color: white;
            text-align: center;
            font-weight: 400;
            font-size: 25px;
    }
    .h2{
    	padding-top: 20px;
       text-align: center;
       font-weight: 400;
       font-size: 20px;
    }
    .p1{
            margin-top: 250px;
            text-align: center;
            font-weight: 400;
            font-size: 20px;
        }
    .p2{
        padding-left: 500px;
        padding-right: 550px;
    }
    .red{
        color: red;
    }
    .t1{
        text-align: left;
        width: 800px;
        height: 100px;
        border: solid;
        border-width: 1px 1px 1px 1px;
        border-color: #787878;
        padding-left: 10px;
        padding-right: 10px;
        color: #333;
        font-size: 12px;
    }
    .t2{
        text-align: left;
        width: 800px;
        height: 100px;
        border: solid;
        border-width: 1px 1px 1px 1px;
        border-color: #787878;
        padding-left: 10px;
        padding-right: 10px;
        color: #333;
        font-size: 12px;
    }
    .t3{
        text-align: left;
        width: 800px;
        height: 100px;
        border: solid;
        border-width: 1px 1px 1px 1px;
        border-color: #787878;
        padding-left: 10px;
        padding-right: 10px;
        color: #333;
        font-size: 12px;
    }
    .t4{
        text-align: left;
        width: 800px;
        height: 100px;
        border: solid;
        border-width: 1px 1px 1px 1px;
        border-color: #787878;
        padding-left: 10px;
        padding-right: 10px;
        color: #333;
        font-size: 12px;
    }
    /* 버튼 전체 */
    .custom-btn {
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
    .btn-1 {
    transition: all 0.3s ease;
    }
    .btn-1:hover {
    box-shadow:
    -7px -7px 20px 0px #fff9,
    -4px -4px 5px 0px #fff9,
    7px 7px 20px 0px #0002,
    4px 4px 5px 0px #0001;
    }
    /* 2번버튼 */
    .btn-2 {
    transition: all 0.3s ease;
    }
    .btn-2:hover {
    box-shadow:
    -7px -7px 20px 0px #fff9,
    -4px -4px 5px 0px #fff9,
    7px 7px 20px 0px #0002,
    4px 4px 5px 0px #0001;
    }
    /* 3번버튼 */
    .btn-3 {
    transition: all 0.3s ease;
    }
    .btn-3:hover {
    box-shadow:
    -7px -7px 20px 0px #fff9,
    -4px -4px 5px 0px #fff9,
    7px 7px 20px 0px #0002,
    4px 4px 5px 0px #0001;
    }
    /* 4번버튼 */
    .btn-4 {
    transition: all 0.3s ease;
    }
    .btn-4:hover {
    box-shadow:
    -7px -7px 20px 0px #fff9,
    -4px -4px 5px 0px #fff9,
    7px 7px 20px 0px #0002,
    4px 4px 5px 0px #0001;
    }
    .btn22{
        text-align: center;
        padding-top: 20px;
    }
    /* 이전 버튼 */
    .customm-btn {
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
    }
    /* 종료버튼 */
    .btn-6 {
        background: #000;
        color: white;
        transition: all 0.3s ease;
    }
    .btn-6:hover {
        box-shadow:
        -7px -7px 20px 0px #fff9,
        -4px -4px 5px 0px #fff9,
        7px 7px 20px 0px #0002,
        4px 4px 5px 0px #0001;
    }
</style>
<body>
    <div>
	    <header>
	        <div class="h3">
	            <h3>gusinsa.com</h3>
	        </div>
	        <div class="h_2">
	            <div class="h2">
	                <h2>회원가입</h2>
	        <hr />
	            </div>
	        </div>
	    </header>
	</div>
    <tbody>
    <div class="p1">
    	<p>약관동의</p>
    </div>
    <div class="p2">
        <p>고객님의 회원가입 시 필요한 정보 수집 시 「개인정보보호법」 제15조, 제22조 및 「정보통신망 이용 촉진 및 정보보호 등에 관한 법률」 제22조에 따라
                        고객 본인의 동의를 얻고 있습니다. 이에 아래 약관 및 개인정보 수집 내용을 확인하시고 동의여부를 결정하여 주시기 바랍니다.</p>
    </div>
    <table>
        <tr>
            <td>아래의 약관에 모두 동의 합니다</td>
            <td><input type="checkbox" />전체 동의</td>
        </tr>
        <tr>
            <td>
                <h3>
                    <span>서비스 이용약관</span>
                    <span class="red">(필수)</span>
                </h3>
            </td>
        </tr>
        
        <tr>
            <td class="t1">이 약관은 (주)구신사에서 운영하는 구신사 멤버스와 구신사닷컴(https://gusinsa.com) 에서 제공하는 인터넷 관련 서비스를 이용함에 있어 (주)구신사와
            이용자의 권리, 의무 및 책임 사항을 규정함을 목적으로 합니다.</td>
        </tr>
        <tr>
            <td>
                <span><button class="custom-btn btn-1">전문보기</button></span>
                <span><input type="checkbox" value="1" type="checkbox" name="check1" onclick="checkOne(this);" />동의함</span>
                <span><input type="checkbox" value="2" type="checkbox" name="check1" onclick="checkOne(this);" />동의 안함</span>
            </td>
        </tr>
        <tr>
            <td>
                <h3>
                    <span>서비스 이용약관</span>
                    <span class="red">(필수)</span>
                </h3>
            </td>
        </tr>
        <tr>
            <div>
                <td class="t2">당사는 구신사 멤버스 통합회원 및 구신사 멤버스 간편가입회원에게 <br />
                본인확인, 포인트 적립 및 결제 서비스, 다양하고 편리한 서비스를 제공하기 위해 아래의 방법을 통해 개인정보를 수집하고 있습니다</td>
            </div>
        </tr>
        <tr>
            <td>
                <span><button class="custom-btn btn-2">전문보기</button></span>
                <span><input type="checkbox" value="1" type="checkbox" name="check2" onclick="checkTwo(this);" />동의함</span>
                <span><input type="checkbox" value="2" type="checkbox" name="check2" onclick="checkTwo(this);" />동의 안함</span>
            </td>
        </tr>
        <tr>
            <td>
                <h3>
                    <span>서비스 이용약관</span>
                    <span class="red">(필수)</span>
                </h3>
            </td>
        </tr>
        <tr>
            <div>
                <td class="t3">당사는 서비스 이행을 위해 아래와 같이 개인정보 처리 업무를 외부업체에 위탁하여 운영하고 있습니다.</td>
            </div>
        </tr>
        <tr>
            <td>
                <span><button class="custom-btn btn-3">전문보기</button></span>
                <span><input type="checkbox" value="1" type="checkbox" name="check3" onclick="checkThree(this);" />동의함</span>
                <span><input type="checkbox" value="2" type="checkbox" name="check3" onclick="checkThree(this);" />동의 안함</span>
            </td>
        </tr>
        <tr>
            <td>
                <h3>
                    <span>위치정보서비스 활용동의</span>
                    <span class="black">(선택)</span>
                </h3>
            </td>
        </tr>
        <tr>
            <div>
                <td class="t4">(주)구신사는 직접 위치정보를 수집하거나 위치정보사업자로부터 위치정보를 전달받아 위치기반서비스(주변매장찾기)를 제공합니다.
                    위치기반서비스의 이용요금은 무료입니다. 단, 무선서비스 이용시 발생하는 데이터 통신료는 별도이며, 
                    이용자가 가입한 각 이동통신사의 정책을 따릅니다.</td>
            </div>
        </tr>
        <tr>
            <td>
                <span><button class="custom-btn btn-4">전문보기</button></span>
                <span><input type="checkbox" value="1" type="checkbox" name="check4" onclick="checkFour(this);" />동의함</span>
                <span><input type="checkbox" value="2" type="checkbox" name="check4" onclick="checkFour(this);" />동의 안함</span>
            </td>
        </tr>
    </tbody>
    </table>
    <div class="btn22">
        <button class="customm-btn btn-5">이전</button>
        <button class="customm2-btn btn-6">다음</button>
    </div>
    </body>
    </html>