<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>gusinsa.login</title>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>


<script>
// 카카오 초기화
Kakao.init('84f46626395e42bdc72cdb114b32c584');

function kakaoLogin() {
	
    Kakao.Auth.login({
        success: function(response) {
            Kakao.API.request({ // 사용자 정보 가져오기 
                url: '/v2/user/me',
                success: (response) => {
                	var kakaoid = response.id+"K";
                    $.ajax({
    					type : "post",
    					url : '/login/idDuplicateCheck.go', // ID중복체크를 통해 회원가입 유무를 결정한다.
    					data : {"userid":kakaoid},
    					dataType:"json",
    					success : function(json){   				
    						if(json.idExists){
    							// 존재하는 경우 로그인 처리
    							createHiddenLoginForm(kakaoid);
    							
    						} else{
    							// 회원가입
    							$.ajax({
    								type : "post",
    		    					url : '/login/kakaoSignUp.go',
    		    					data : {"userid":kakaoid,
    		    						    "name":response.properties.nickname,
    		    						    "email":response.kakao_account.email},
    		    					dataType :"json",
    		    					success : function(json){
    		    						if(json.success){
    		    							// 로그인
    		    							createHiddenLoginForm(kakaoid);		    							
    		    						} else {
    		    							alert('카카오 회원가입 실패. 일반계정으로 로그인하시기 바랍니다.');
    		    						}
    		    					},
    		    					error: function(request, status, error){
    		    		                   alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
    		    		                }
    							});
    						}						
    					},
    					error: function(request, status, error){
    		                   alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
    		                }
    				});
                }
            });
            // window.location.href='/ex/kakao_login.html' //리다이렉트 되는 코드
        },
        fail: function(error) {
            alert(error);
        }
    });
}

function createHiddenLoginForm(kakaoId){
	
	var frm = document.createElement('form');
	frm.setAttribute('method', 'post');
	frm.setAttribute('action', '/member/kakaoLogin.go');
	var hiddenInput = document.createElement('input');
	hiddenInput.setAttribute('type','hidden');
	hiddenInput.setAttribute('name','userid');
	hiddenInput.setAttribute('value',kakaoId);
	frm.appendChild(hiddenInput);
	document.body.appendChild(frm);
	frm.submit();
	
}
//카카오 초기화
Kakao.init('84f46626395e42bdc72cdb114b32c584');
    
function kakaoLogout() {
    if (!Kakao.Auth.getAccessToken()) {
      alert('로그인을 해주세요.');
      return
    }
    Kakao.Auth.logout(function() {
      location.href = "/login/logout.go"; // 로그아웃 처리
	})
}
</script>
</head>
<!-- <link rel="stylesheet" href="../headerimg/header.css"> -->
    <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"> -->
     <style>
    html,body{
        margin: 0;
        padding: 0;
    }

        header{
            width: 100%;
            height: 236px;
            position: fixed;
            background: white;
        }
    .header_left{ 
    margin-top: 10px;
    }
    
    #high_con,#con{ text-decoration: none;   /* a태그 밑줄제거 */
          color: black;       /*메뉴 a태그 id*/
    }
    #high_con:hover{
        font-weight: bold;
    }

    /* #con{
        background-color: #a8a8a8;
    } */
    .BRAND_Second li,.WOMEN_Second li,.Man_Second li{
        background-color: #a8a8a8; border: none; /*메뉴 하위메뉴 배경색상 지정*/
    }
    

    #con:link{ color : black}
    #con:hover{font-weight: bold; text-decoration: underline; }
    input:-ms-input-placeholder{color:#a8a8a8;}
    input::-webkit-input-placeholder{color:#a8a8a8;}
    input::-moz-placeholder{color:#a8a8a8;}
    #product_menu_list{font-size: 30px;display: inline-block; left: 15%;  } /* 메뉴 카테고리 좌우 이동*/
    .first_hearder{ height: 40px; width: 400px; border: 1px solid #0b0c0e; background: #ffffff; }
    #fisrst_search{ font-size: 16px; width: 325px; padding: 10px; border: 0px; outline: none; float: left; }
    #button_search{ width: 50px; height: 100%; border: 0px; background: #020202; outline: none; float: right; color: #ffffff}
    #header_gita li,.first_hearder{list-style-type: none;float: right; margin-right: 30px;}  /*로그인 장바구니 목록 설정*/
    #sidelist{ margin-right: 0;}
    .header_img{ width: 40px;}
    #header_right_img{ 
        float: left; width: 180px; height: 60px; margin-left: 20px;
    }
    #hearder_color{ background: #020202; background-color: #020202; width: 100%;height: 50px;margin-bottom: 30px;float: right;text-align: center;}
    /* body{width: 0 auto;text-align: center;} */
    /* ----------------------------------------- 헤더메뉴 ----------------------------------------- */
    nav{  width: 100%; height: 220px;
    background-color: rgb(255, 255, 255);}
    /* ----------------------------------------- 메뉴 MEN ----------------------------------------- */
    .header_menu_Man li{ float: left; padding: 0 50px; line-height: 36px; position: relative; }
    .Man_Second{ margin-bottom: 20px; position:absolute;  top:100%; left: 0%; right: 200%; display: none;   /* 중분류 될 리스트를 숨김 */}
    .Man_Second li{width: 250px; height: 30px; padding-bottom: 7px;  } /* 크기 및 이동조절*/
    .header_menu_Man:hover .Man_Second{display: block;}
    /* ----------------------------------------- MEN 끝 및 브랜드 시작 ----------------------------------------- */
    .header_menu_BRAND li{ float: left; padding: 0 50px; line-height: 36px; position: relative;}
    .BRAND_Second{ margin-bottom:20px; position: absolute; top:100%; left: 0; right: 400%; display: none; /* 중분류 될 리스트를 숨김 */}
    .BRAND_Second li{ width: 250px; height: 30px; padding-bottom: 7px; }  /*중분류 리스트 사이즈*/
    .header_menu_BRAND:hover .BRAND_Second{ display: block; }
    /* ----------------------------------------- 브랜드 three ----------------------------------------- */
    .BRAND_Three{  margin-bottom:10px; position:absolute; bottom: 100%; top: -1px; left: 71.5%;  /* right: 500px; */ display: none; /* 중분류 될 리스트를 숨김 */ }
    .BRAND_Three li{ width: 300px; height: 30px; padding-bottom: 7px; }  /*중분류 리스트 사이즈*/
    .Restock:hover .BRAND_Three{ display: block; }
     /*------------------------------------ 안헷갈리게 ViewallBrands_Three------------------------------------------------------------------------------*/
     .ViewallBrands_Three{ margin-bottom:10px; position:absolute; top: -1px;  left: 71.5%; /* right: 500px; */ display: none; /* 중분류 될 리스트를 숨김 */}
    .ViewallBrands_Three li{ width: 300px; height: 30px; padding-bottom: 7px; }  /*중분류 리스트 사이즈*/
    .ViewallBrands:hover .ViewallBrands_Three{ display: block; }
    /* ----------------------------------------- 브랜드 끝 ----------------------------------------- */
    /*------------------------------------ 안헷갈리게 MAN_Three 중분류들 ------------------------------------------------------------------------------*/
    .OUTER_Second{  margin-bottom:10px; position:absolute; bottom: 100%; top: -1px;  left: 71.5%;  /* right: 500px; */ display: none; /* 중분류 될 리스트를 숨김 */ }
    .OUTER_Second li{ width: 300px; height: 30px; padding-bottom: 7px; }  /*중분류 리스트 사이즈*/
    .OUTER:hover .OUTER_Second{ display: block; }
    .TOP_Second{  margin-bottom:10px; position:absolute; bottom: 100%; top: -1px;  left: 71.5%; /* right: 500px; */ display: none; /* 중분류 될 리스트를 숨김 */ }
    .TOP_Second li{ width: 300px; height: 30px; padding-bottom: 7px; }  /*중분류 리스트 사이즈*/
    .TOP:hover .TOP_Second{ display: block; }
    
    .LIFE_Second{  margin-bottom:10px; position:absolute; bottom: 100%; top: -1px;  left: 71.5%; /* right: 500px; */ display: none; /* 중분류 될 리스트를 숨김 */ }
    .LIFE_Second li{ width: 300px; height: 30px; padding-bottom: 7px; }  /*중분류 리스트 사이즈*/
    .LIFE:hover .LIFE_Second{ display: block; }
    /*------------------------------------ 안헷갈리게 MAN_Three 끝 및 WOMEN_SECOND 시작------------------------------------------------------------------------------*/
    .header_menu_WOMEN #product_menu_list{  float: left;  padding: 0 50px;  line-height: 36px; position: relative; }
    .WOMEN_Second{ margin-bottom: 10px; position: absolute; top:95%; left: 0; right: 500%; display: none;    /* 중분류 될 리스트를 숨김 */ }
    .WOMEN_Second #product_menu_list{ width: 300px; height: 30px; padding-bottom: 7px;  left: 18.6%; } /*우먼 2단계리스트 크기 좌우 조절*/
    .header_menu_WOMEN:hover .WOMEN_Second{ display: block; }
    /* ----------------------------------------- 세일----------------------------------------- */
    .header_menu_SALE li{  float: left; padding: 0 50px; line-height: 36px; position: relative; }
    .SALE_Second{ margin-bottom: 10px; position: absolute; top:140%; left: 0; right: 500%; display: none;    /* 중분류 될 리스트를 숨김 */}
    .SALE_Second li{ width: 500px; height: 60px; padding-top: 15px; }
    .header_menu_SALE:hover .SALE_Second{ display: block;}
    /* ----------------------------------------- NEW ARRIVAL ----------------------------------------- */
    .header_menu_NEWARRIVAL li{  float: left; padding: 0 50px; line-height: 36px; position: relative; }
    .SALE_Second{ margin-bottom: 10px; position: absolute; top:140%; left: 0; right: 500%; display: none;    /* 중분류 될 리스트를 숨김 */}
    .SALE_Second li{ width: 500px; height: 60px; padding-top: 15px; }
    .header_menu_NEWARRIVAL:hover .SALE_Second{ display: block;}
    /* ----------------------------------------- 유저리뷰 ----------------------------------------- */
    .header_menu_Userrivw li{  float: left; padding: 0 50px; line-height: 36px; position: relative; }
    .SALE_Second{ margin-bottom: 10px; position: absolute; top:140%; left: 0; right: 500%; display: none;    /* 중분류 될 리스트를 숨김 */}
    .SALE_Second li{ width: 500px; height: 60px; padding-top: 15px; }
    .header_menu_Userrivw:hover .SALE_Second{ display: block;}
    .side_list{
        background:url("../headerimg/목록.png");
        border : 0;
        outline: 0;
        margin-right: 100px;
    
    }
        /*사이드메뉴 추가 스타일*/
        .sidebar{
    width: 500px;
    height: 100%;
    background: rgb(63, 62, 62);
    position: fixed;  /*고정 드래그하면 사이드메뉴도 드래그되어버려 fixed 고정*/
    top: 0;
    right: -500px;  /*화면밖으로 내보내기위해 -값*/
    z-index: 1;   /*포지션값의 우선순위*/
    transition: all .35s;
    opacity: 0.5;
    
}

#menuicon:checked+label+div{
    right: 0;
}
 #menuicon{
    float: right;
    display: none;
}
#menuicon +label{
    display: block;
    width: 60px;
    height: 50px;
    position: relative;
    right: 0;
    top: calc(50% - 25px);
    transition: all .0s;
    cursor: pointer;
} 
#menuicon + label span{
    display: block;
    position: absolute;
    width: 100%;
    height: 4px;
    border-radius: 30px;
    background: #000;
    transition: all 1s;
}

input[id="menuicon"]:checked +label span:nth-child(1){
    top: 50%;
    transform: translateY(-50%) rotate(45deg);
}
input[id="menuicon"]:checked +label span:nth-child(2){
    opacity: 0;
}
input[id="menuicon"]:checked +label span:nth-child(3){
    bottom: 50%;
    transform: translateY(50%) rotate(-45deg);
}
#menuicon + label span:nth-child(1){
    top: 0;
}
#menuicon + label span:nth-child(2){
    top: 50%;
    transform: translateY(-50%);
}
#menuicon + label span:nth-child(3){
    bottom: 0;
}

#menuicon:checked+label+div{
    right: 0;
}
#menuicon:checked+label{
    z-index: 2;
    right: 500px;
}
.sidebar_ul{
    margin-top: 30%;
    
}
.sidebar_ul #sidebar_li{
    margin-bottom: 10%;
    font-size: 18px;
    text-align: right;
    margin-right: 70%;  
    height: 30px;
    line-height: 30px;
    list-style:none;
}

#sidebar_li_a:hover{
    font-weight: bold;
}
#sidebar_li:hover{
    font-weight: bold;
}

#sidebar_li_a{
    text-decoration:none
}

/* .every{
    width: 100%;
    margin: 0 auto; 
    text-align: center;
} */

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
    margin-top: px;
}
#footer_addr{float: left;}
.footer_div{margin-top: 20px;margin-right: 30px;float: right; margin-bottom: 10px;}

/* 여기서부터 은주 */
	.main11{
		padding-left: 20%;
	}
	.main {

        min-width: 500px;
        max-width: 0px;
        padding: 50px;
        background: #ffffff;
        padding-left: 20%;
        
        }
    section {
        display: none;
        padding: 20px 0 0;
        border-top: 1px solid #ddd;}
    /*라디오버튼 숨김*/
      #tab1,#tab2{
          display: none;}
    label {
        display: inline-block;
        margin: 0 0 -1px;
        padding: 10px 100px;
        font-weight: 600;
        text-align: center;
        color: #bbb;
        border: 1px solid transparent;}
    label:hover {
        color: #555;
        cursor: pointer;}
    /*input 클릭시, label 스타일*/
    input:checked + label {
          color: #555;
          border: 1px solid #ddd;
          border-top: 2px solid black;
          border-bottom: 0px solid #ffffff;}
    #tab1:checked ~ #content1,
    #tab2:checked ~ #content2 {
    	
        display: contents;
    }
    .content2{
        font-weight: bold;
    }
    .body_body{
        padding-top: 15%;
        padding-left: 20%;
    }
    .hr-sect {
        display: flex;
        flex-basis: 100%;
        align-items: center;
        color: rgba(0, 0, 0, 0.35);
        font-size: 15px;
        font-weight: bold;
        margin: 20px 0px;
    }
    .hr-sect::before,
    .hr-sect::after {
        content: "";
        flex-grow: 1;
        background: rgba(0, 0, 0, 0.35);
        height: 1px;
        font-size: 0px;
        line-height: 0px;
        margin: 0px 16px;
        margin-left: 0px;
        margin-right: 0px;
    }
    #mid{
    	margin-top:20px;
    	width: 480px;
    	height: 40px;
    }
    #mpw{
    	margin-top:10px;
    	margin-bottom:10px;
    	width: 480px;
    	height: 40px;
    }
    #nid{
	    margin-top:20px;
	    width: 480px;
	    height: 40px;
    }
    #nno{
	    margin-top:20px;
	    margin-bottom: 20px;
	    width: 480px;
	    height: 40px;
    }
	/* 버튼전체 */
        .btn22{
            text-align: center;
        }
        /* 로그인 */
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
        /* 로그인 */
        .btn-1 {
        	margin-top: 20px;
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
        /* 비회원 로그인 */
        .customm3-btn {
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
        /* 비회원 로그인 */
        .btn-2 {
        	margin-bottom: 19%;
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
    </style>

    <header>
        <div class="header_left"><a href=#><img src="../resources/headerimg/GUSINSA.png" alt="" id="header_right_img"></a></div>
        <div class="header_right">
        <ul id="header_gita">
            <li><input type="checkbox" class="side_list"  id="menuicon">
                <label for="menuicon">
                    <span id="menuicon_span"></span>
                    <span id="menuicon_span"></span>
                    <span id="menuicon_span"></span>
                </label>
                <div class="sidebar">
                    <ul class="sidebar_ul">
                        <li id="sidebar_li"><a href="#" id="sidebar_li_a" style="color: rgb(255, 255, 255);"><b>주문/배송</b></a></li>
                        <li id="sidebar_li"><a href="#" id="sidebar_li_a" style="color: rgb(255, 255, 255);" ><b>매장안내</b></a></li>
                        <li id="sidebar_li"><a href="#" id="sidebar_li_a" style="color: rgb(255, 255, 255);"><b>고객센터</b></a></li>
                        <li id="sidebar_li"><a href="#" id="sidebar_li_a" style="color: rgb(255, 255, 255);"><b>로그인</b></a></li>
                        <li id="sidebar_li"><a href="#" id="sidebar_li_a" style="color: rgb(255, 255, 255);"><b>회원가입</b></a></li>
                    </ul>
                </div></li>
            <!-- <li><a href=#><img src="../headerimg/목록.png" style="margin-right: 80px;" alt="목록" class="header_img"></a></li> -->
            <li><a href=#><img src="../resources/headerimg/장바구니.png" style="height: 47px;" alt="장바구니" class="header_img"></a></li>
            <li><a href=""><img src="../resources/headerimg/로그인.png" style="height: 47px;" alt="로그인" class="header_img"></li></a>
        </ul>
        </div>
        <div class="first_hearder">
            <input type="text" placeholder="검색어 입력" id="fisrst_search">
            <button id="button_search">검색</button>
        </div>
        <div id="hearder_color"></div>
    
        <div id ="menu_list">
            <nav>
            <ul class="header_menu_NEWARRIVAL">
                <li id="product_menu_list"><a href=# id="high_con">NEW ARRIVAL</a>
    
                </li>
            </ul>
            <ul class="header_menu_BRAND">
                <li id="product_menu_list"><a href="" id="high_con">BRAND</a>
                    <ul class="BRAND_Second">
                        <li class ="ViewallBrands" id="product_menu_list"><a href="" id="con" >View all Brands</a>
                            <ul class="ViewallBrands_Three">
                                <li id="product_menu_list"><a href="" id="con">LLUD Exclusive</a></li>        
                                <li id="product_menu_list"><a href="" id="con">AFTERPRAY</a></li>   
                                <li id="product_menu_list"><a href="" id="con">MPQ</a></li>   
                                <li id="product_menu_list"><a href="" id="con">SUJIPMIHAK</a></li>
                                <li id="product_menu_list"><a href="" id="con">WHITEBOXHGALLERY</a></li>
                            </ul>
                            </li>
    
                        <li class="Restock"  id="product_menu_list"><a href="" id="con">Restock</a>
                            <ul class="BRAND_Three">
                                <li id="product_menu_list"><a href="" id="con">CURATED PARADE</a></li>        
                                <li id="product_menu_list"><a href="" id="con">SANSAN GEAR</a></li>   
                                <li id="product_menu_list"><a href="" id="con">Hatchingroom</a></li>   
                                <li id="product_menu_list"><a href="" id="con">Saturday of us</a></li> 
                            </ul>
                            </li>
    
                       
                    </ul>
                </li>
            </ul>
                <ul class="header_menu_Man">
                    <li id="product_menu_list"><a href=# id="high_con">MEN</a>
                        <ul class="Man_Second">
                            <li class="OUTER"  id="product_menu_list"><a href=# id="con">OUTER</a>
                                <ul class="OUTER_Second">
                                    <li id="product_menu_list"><a href="" id="con">JACKET</a></li>        
                                    <li id="product_menu_list"><a href="" id="con">Coat</a></li>   
                                    <li id="product_menu_list"><a href="" id="con">Jumper</a></li>   
                                    <li id="product_menu_list"><a href="" id="con">Biazer</a></li> 
                                </ul></li>
                            <li class="TOP" id="product_menu_list"><a href=# id="con">TOP</a>
                                <ul class="TOP_Second">
                                    <li id="product_menu_list"><a href="" id="con">Shirts(LS)</a></li>        
                                    <li id="product_menu_list"><a href="" id="con">Shirts(1/2)</a></li>   
                                    <li id="product_menu_list"><a href="" id="con">Tee(LS)</a></li>   
                                    <li id="product_menu_list"><a href="" id="con">Tee(1/2)</a></li> 
                                    <li id="product_menu_list"><a href="" id="con">Sleeveless</a></li> 
                                    <li id="product_menu_list"><a href="" id="con">Knit</a></li> 
                                    <li id="product_menu_list"><a href="" id="con">Vest</a></li> 
                                    <li id="product_menu_list"><a href="" id="con">Hoodie</a></li> 
                                    <li id="product_menu_list"><a href="" id="con">Sweatshirts</a></li> 
                                </ul></li>
                            <li id="product_menu_list"><a href=# id="con">BOTTOM</a></li>
                            <li id="product_menu_list"><a href=# id="con">ACCESSORIES</a></li>
                            <li class="LIFE" id="product_menu_list"><a href=# id="con">LIFE</a>
                                <ul class="LIFE_Second">
                                    <li id="product_menu_list"><a href="" id="con">HOME</a></li>        
                                    <li id="product_menu_list"><a href="" id="con">Beauty</a></li>   
                                    <li id="product_menu_list"><a href="" id="con">Paper</a></li>   
                                    <li id="product_menu_list"><a href="" id="con">Digital</a></li> 
                                </ul></li>
                        </ul>
                    </li>
                </ul>
                <ul class="header_menu_WOMEN">
                    <li id="product_menu_list"><a href=# id="high_con">WOMEN</a>
                        <ul class="WOMEN_Second">
                            <li class="OUTER" id="product_menu_list"><a href=# id="con">OUTER</a>
                                <ul class="OUTER_Second">
                                    <li id="product_menu_list"><a href="" id="con">JACKET</a></li>        
                                    <li id="product_menu_list"><a href="" id="con">Coat</a></li>   
                                    <li id="product_menu_list"><a href="" id="con">Jumper</a></li>   
                                    <li id="product_menu_list"><a href="" id="con">Biazer</a></li> 
                                </ul></li>
                            <li class="TOP" id="product_menu_list"><a href=# id="con">TOP</a>
                                <ul class="TOP_Second">
                                    <li id="product_menu_list"><a href="" id="con">Shirts(LS)</a></li>        
                                    <li id="product_menu_list"><a href="" id="con">Shirts(1/2)</a></li>   
                                    <li id="product_menu_list"><a href="" id="con">Tee(LS)</a></li>   
                                    <li id="product_menu_list"><a href="" id="con">Tee(1/2)</a></li> 
                                    <li id="product_menu_list"><a href="" id="con">Sleeveless</a></li> 
                                    <li id="product_menu_list"><a href="" id="con">Knit</a></li> 
                                    <li id="product_menu_list"><a href="" id="con">Vest</a></li> 
                                    <li id="product_menu_list"><a href="" id="con">Hoodie</a></li> 
                                    <li id="product_menu_list"><a href="" id="con">Sweatshirts</a></li> 
                                </ul></li>
                            <li id="product_menu_list"><a href=# id="con">BOTTOM</a></li>
                            <li id="product_menu_list"><a href=# id="con">ACCESSORIES</a></li>
                            <li class="LIFE"  id="product_menu_list"><a href=# id="con">LIFE</a>
                                <ul class="LIFE_Second">
                                    <li id="product_menu_list"><a href="" id="con">HOME</a></li>        
                                    <li id="product_menu_list"><a href="" id="con">Beauty</a></li>   
                                    <li id="product_menu_list"><a href="" id="con">Paper</a></li>   
                                    <li id="product_menu_list"><a href="" id="con">Digital</a></li> 
                                </ul></li>
                        </ul>
                    </li>
                </ul>
                <ul class="header_menu_SALE">
                    <li id="product_menu_list"><a href=# id="high_con">유저리뷰</a>    
                        <ul class="SALE_Second"> 
                        </ul>
                    </li>
                </ul>
                <ul class="header_menu_Userrivw">
                    <li id="product_menu_list"><a href=# id="high_con">SALE</a>    
                        <ul class="Userrivw_Second"> 
                        </ul>
                    </li>
                </ul>
            </nav>
        </div>
    </header>
</head>
<body>
<div class="body_body">
	<div class="main11">
		<h2>안녕하세요 고객님!</h2>
		<p>구신사의 회원이 되시면 더 많은 혜택을 누리실 수 있습니다</p>
	</div>
    <div class="main">
            <input id="tab1" type="radio" name="tabs" checked> 
            <label for="tab1">회원</label>
        
            <input id="tab2" type="radio" name="tabs">
            <label for="tab2">비회원</label>

            <section id="content1">
                <tr>
                    <td>
                        <input type="text" id="mid" name="mid" placeholder=" 아이디"/> <br />
                        <input type="text" id="mpw" name="mpw" placeholder=" 비밀번호"/> <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="checkbox" />아이디 저장
                    </td> 
                    <td>
	                    <a href="#">아아디 찾기</a>
                        |
                        <a href="#">비밀번호 찾기</a> <br />
                    </td>
                </tr>
                <tr>
                    <div class="btn22">
					        <button class="customm2-btn btn-1">로그인</button>
					  </div>
                </tr>
            
            <span><p>아직 구신사의 회원이 아니신가요?</p><a href="#">회원가입</a></span>

            </section>
            
            
                <div class="hr-sect">or</div>
					<a class="btn btnkakao" id="kakao-login-btn" style="text-align:center;" href="javascript:kakaoLogin()">
						<img src="../resources/snsimg/카카오톡.png" />
					</a>
            	</div>
                <!-- kakaoemail을 넘기기 위한 숨겨진 form -->
            <!-- <form action="./kakaologin.do" method="post" name="lfrm" hidden>
            	<input type="text" name="kakaoemail" id="kakaoemail" value="" />
            </form> -->    
                	<!-- <input type="button" class="btn_img1"/>
                	<input type="button" class="btn_img2"/>
                	<input type="button" class="btn_img3"/>
                	<input type="button" class="btn_img4"/> -->
            <section id="content2" class="content2">
                <tr>
                    <div class="no_lo">
                    <td>
                        <span><input type="radio" />주문자 이름+주문번호</span>
                        <span><input type="radio" />주문자 이름+휴대폰번호</span> <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="text" id="nid" placeholder="주문자명" /> <br />
                        <input type="text" id="nno" placeholder="주문번호" /> <br />
                    </td>
                </tr>
                <div class="btn22">
					        <button class="customm3-btn btn-2">비회원 주문조회</button>
				</div> 
            </section>
    </div>
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