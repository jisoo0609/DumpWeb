<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="e" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%   response.setHeader("Cache-Control","no-cache");

	response.setHeader("Pragma","no-cache");

	response.setDateHeader("Expires",0); %>

<%@ include file="../include/header.jsp" %>

<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="msapplication-TileImage" content="/resources/image/favicon/favicon.png">
	<link rel="shortcut icon" href="/resources/image/favicon/favicon.png">

	<meta property="og:image" content="/resources/image/favicon/favicon.png">
	<meta property="og:title" content="배차관리시스템">

	<!-- js -->
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="/resources/js/jquery.modal-master/js/jquery.modal.js?jsVerType=<fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyyMMddHHmmss"/>" ></script>

	<script src="/resources/js/login/login.js?jsVer=<fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyyMMddHHmmss"/>"></script>

	<!--CSS-->
	<link href="/resources/css/login.css?jsVerType=<fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyyMMddHHmmss"/>" rel="stylesheet" type="text/css">
	<link href="/resources/js/jquery.modal-master/css/jquery.modal.css"  type="text/css" rel="stylesheet" />
	<link href="/resources/js/jquery.modal-master/css/jquery.modal.theme-xenon.css"  type="text/css" rel="stylesheet" />
	<link href="/resources/js/jquery.modal-master/css/jquery.modal.theme-atlant.css"  type="text/css" rel="stylesheet" />

	<!-- The core Firebase JS SDK is always required and must be listed first -->
	<script src="https://www.gstatic.com/firebasejs/8.2.9/firebase-app.js"></script>
	<script src="https://www.gstatic.com/firebasejs/8.2.5/firebase-messaging.js"></script>

	<!-- TODO: Add SDKs for Firebase products that you want to use
         https://firebase.google.com/docs/web/setup#available-libraries -->
	<script src="https://www.gstatic.com/firebasejs/8.2.9/firebase-analytics.js"></script>

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=64bdd806e937defb179aa9a2b9cc6c95&libraries=services"></script>

	<script src="/resources/js/include/header.js?jsVerType=20<fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyyMMddHHmmss"/>"></script>

</head>
<style>
	*,html,body{
		font-family: GmarketSansTTF!important;
	}
	header{display: none}
</style>
<body>
<div class="b-loginM">
	<section class="b-loginM__inner">
		<div class="b-loginM__top"></div>
		<h1 class="b-loginM__tit">
			덤프트럭관리<span>시스템</span>
		</h1>
		<form method="post" name="loginfrm" onsubmit="return false;">
			<input type="hidden" name="address">
			<input type="hidden" name="regid" />

			<div class="b-loginM__form">
				<h2>로그인</h2>
				<%--				<div class="b-loginM__input">--%>
				<input type="hidden" name="userSS" value="KIWON 골재">
				<%--					<label>회사명</label>--%>
				<%--					<div class="b-selectCustomWrap">--%>
				<%--						<a href="javascript:void(0)">--%>
				<%--							선택해주세요--%>
				<%--						</a>--%>
				<%--						<ul class="b-selectCustom ssList">--%>
				<%--							<c:forEach var="ssInfo" items="${userSSList}">--%>
				<%--								<li select-data="${ssInfo.siteName}"><span>${ssInfo.customSiteName}</span><span>${ssInfo.siteLocation}</span></li>--%>
				<%--							</c:forEach>--%>
				<%--						</ul>--%>
				<%--					</div>--%>
				<%--				</div>--%>
				<div class="b-loginM__input">
					<label>아이디</label>
					<input type="text" name="userId" autocomplete=off onkeydown="if(event.keyCode == 13) $.loginCheck();">
				</div>
				<div class="b-loginM__input">
					<label>비밀번호</label>
					<input type="password" name="userPw" onkeydown="if(event.keyCode == 13) $.loginCheck();">
				</div>
			</div>
			<div class="b-loginM__label clear" style="padding: 0 25px;">
				<input type="button" class="btn" value="회원가입" onclick="moveJoin();">
				<label style="margin: 0;">
					<input type="checkbox" name="id_save">
					<span>아이디/패스워드 저장</span>
				</label>
			</div>
			<div class="b-loginM__btnGroup dis-f">
				<button class="b-loginM__btn add" type="button" onkeydown="if(event.keyCode == 13) return false;" onclick="location.href='/trial'">체험, 둘러보기</button>
				<button class="b-loginM__btn add" type="button" onkeydown="if(event.keyCode == 13) return false;" onclick="$.loginCheck()">로그인</button>
				<%--		<a href="/join" class="b-loginM__btn" type="button">회원가입</a>--%>
			</div>
		</form>
		<div class="b-question" >
			<%--			<img src="/resources/image/icons/ico_que.png" alt="" style="margin-bottom: 5px; margin-right: 10px; margin-top: 4px;" class="que-dis-mn ico-first-que" onclick="$.openLayerHelpMsgPopUp(this, 'W01');">--%>
			<span class="fc-point que-dis-mn" style="margin-top: 3px; font-weight: 500;">
				문의
			</span>
			<img src="/resources/image/icons/ico_que.png" alt="" class="que-dis-b que-icon" onclick="$.openLayerHelpMsgPopUp(this, 'W01');">
			<span>02-6012-7406 / 010-3717-7406</span>
		</div>


	</section>
</div>
</body>
</html>
