<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>gusinsa.login</title>
</head>
<!-- <style>
	table{
	text-align: center;
	}
</style>
<body> -->
<h3>구신사로그인</h3>

<div align="center">
	<h2>안녕하세요 고객님</h2>
	<p>구신사의 회원이 되시면 더 많은 혜택을 누리실 수 있습니다</p>
	<table>
		<tr align="center">
			<td><input type="text" id="mid" name="mid" placeholder="아이디"/></td>
		</tr>
		<tr align="center">
			<td><input type="text" id="mid" name="mid" placeholder="비밀번호"/></td>
		</tr>
		<tr>
			<td><input type="checkbox" />아이디 저장</td> 
			
		</tr>
		<tr>
			<td><a href="#">아아디 찾기</a>
			|
			<a href="#">비밀번호 찾기</a></td>
		</tr>
		<tr align="center">
			<td>
				<button>로그인</button>
			</td>
		</tr>
	</table>
	<p>아직 구신사의 회원이 아니신가요?</p><a href="#">회원가입</a>
</div>

</body>
</html>