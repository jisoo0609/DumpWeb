<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="e" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%-- 개인정보 팝업 --%>
<%@ include file="pop-personal.jsp" %>

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

	<script src="/resources/js/login/pwChange.js?jsVer=20<fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyyMMddHHmmss"/>"></script>

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



	<script></script>


	<script src="/resources/js/include/header.js?jsVerType=20<fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyyMMddHHmmss"/>"></script>

	<link rel="stylesheet" type="text/css" href="/resources/css/loading.css">


</head>
<div id="page_loading_progressbar" style="z-index:9998; position:absolute; visibility:hidden; left:calc(100%/2); top:calc(100%/2);">
	<div class="closeMask" style="left:0px; top:0px;"></div>

	<div id="ajaxloader2">
		<div class="outer"></div>
		<div class="inner" style="top: -40px;"></div>
		<p style="color:#fff; text-align:center;">Checking...</p>
	</div>
</div>
<style>
	*,html,body{
		font-family: GmarketSansTTF!important;
	}
	header{display: none}
	.b-loginM__input input {
		width: 60%;
	}
</style>
<body>
<div class="b-loginM">
	<section class="b-loginM__inner join">
		<div class="b-loginM-wrap">
			<h1 class="b-loginM__tit">
				배차관리<span>시스템</span>
			</h1>
			<h1 class="b-loginM__tit add">암호 재설정</h1>

			<form name="pwfrm" onsubmit="return false;">
				<div class="b-loginM__form">
					<div class="line"></div>
					<div class="b-loginM__input">
						<input type="hidden" name="uuserID" value="${sessionScope.loginInfo.uuserID}">
					</div>
					<div class="b-loginM__input">
						<label>새 비밀번호</label>
						<input type="password" placeholder="숫자4자리 이상" name="userPw" onkeydown="if(event.keyCode == 13) $.pwChange();" autocomplete="off" pattern="\d*">
					</div>
					<div class="b-loginM__input">
						<label>새 비밀번호 확인</label>
						<input type="password" placeholder="숫자4자리 이상" name="re_userPw" onkeydown="if(event.keyCode == 13) $.pwChange();" autocomplete="off" pattern="\d*">
					</div>
					<div class="checkbox-group b-form-table-ck erpCheckText">
						<label>
							<div class="checkbox-f">
								<input type="checkbox" name="privacyChk" id="privacyChk" value="Y">
								<span class="checkmark"></span>
								<span>개인정보 수집 및 이용에 동의합니다.</span>
							</div>

							<button onclick="$.openLayerPrivaryPopUp('pop-personal', this);">
								<a>
									[ 개인정보취급방침 보기 ]
								</a>
							</button>
						</label>
					</div>

					<div class="b-loginM__btnGroup">
						<button class="b-loginM__btn change" type="button" onkeydown="if(event.keyCode == 13) return false;" onclick="$.pwChange()">저장</button>
						<button class="b-loginM__btn prev" type="button" onkeydown="if(event.keyCode == 13) return false;" onclick="$.prevPage()">뒤로</button>
					</div>
				</div>
			</form>

			<div class="b-question">
				<img src="/resources/image/icons/ico_que.png" alt="" style="margin-bottom: 5px; margin-right: 10px; margin-top: 4px;" class="que-dis-mn" onclick="$.openLayerHelpMsgPopUp(this, 'W01-1');">
				<span class="fc-point que-dis-mn" style="margin-top: 3px;">
				문의
			</span>
				<img src="/resources/image/icons/ico_que.png" alt="" class="que-dis-b que-icon" onclick="$.openLayerHelpMsgPopUp(this, 'W01-1');">
				<span>02-6012-7406 (주)기원테크</span>
			</div>
		</div>
	</section>
</div>
</body>
</html>
