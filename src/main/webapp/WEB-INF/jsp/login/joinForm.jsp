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
	<title>Work&Sales</title>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="msapplication-TileImage" content="/resources/image/favicon/favicon.png">
	<link rel="shortcut icon" href="/resources/image/favicon/favicon.png">


	<!-- js -->
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<link href="/resources/css/login.css?jsVerType=<fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyyMMddHHmmss"/>"" rel="stylesheet" type="text/css">

	<link href="/resources/js/jquery.modal-master/css/jquery.modal.css?version=1.2&<fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyyMMddHHmmss"/>"  type="text/css" rel="stylesheet" />
	<link href="/resources/js/jquery.modal-master/css/jquery.modal.theme-xenon.css?version=1.2&<fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyyMMddHHmmss"/>"  type="text/css" rel="stylesheet" />
	<link href="/resources/js/jquery.modal-master/css/jquery.modal.theme-atlant.css?version=1.2&<fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyyMMddHHmmss"/>"  type="text/css" rel="stylesheet" />

	<script type="text/javascript" src="/resources/js/jquery.modal-master/js/jquery.modal.js?jsVerType=<fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyyMMddHHmmss"/>" ></script>



	<script>
		$(function () {

			if ($("[name=userPosition]").val() == "manager") {
				$(".b-loginM__form.driver").remove();
			} else {
				$(".b-loginM__form.manager").remove();
			}

			var select_title = $(".b-selectCustomWrap > a");
			$('<div class="select_icon"></div>').insertAfter(select_title);

			select_title.click(function () {
				$(".b-selectCustom").toggleClass("active");
				$(".select_icon").toggleClass("active");
			});

			$(".b-selectCustom > li").on('click', function () {
				var _li_value = $(this).html();
				select_title.html(_li_value);
				$(".b-selectCustom").removeClass("active");
				$(".select_icon").toggleClass("active");

				$("[name=userSS]").val($(this).attr("select-data"));
			});
			$("body").click(function (e) {
				if($(".b-selectCustom").hasClass("active")){
					if(!$(".b-selectCustomWrap").has(e.target).length){
						$(".b-selectCustom").removeClass("active");
						$(".select_icon").removeClass("active");
					};
				}
			})
		});

		$.join = function(){
			// LINE :: 개인정보 동의
			if (!$("[name=privacyChk]").is(":checked")) {
				alert("개인정보 수집 및 이용에 동의해주세요..");
				$("[name=privacyChk]").focus();
				return false;
			}

			// LINE :: 아이디 확인
			if ($("[name=userId]").val().length == 0) {
				alert("아이디를 입력해주세요.");
				$("[name=userId]").focus();
				return false;
			}

			// LINE :: 비밀번호 확인
			if ($("[name=userPw]").val().length == 0) {
				alert("비밀번호를 입력해주세요.");
				$("[name=userPw]").focus();
				return false;
			}

			// LINE :: 비밀번호 확인
			if ($("#userPwChk2").val().length == 0) {
				alert("비밀번호확인을 입력해주세요.");
				$("#userPwChk2").focus();
				return false;
			}

			// LINE :: 기사이름 확인
			if ($("[name=userName]").val().length == 0) {
				alert("기사이름을 입력해주세요.");
				$("[name=userName]").focus();
				return false;
			}

			// LINE :: 비밀번호 유효성 검사
			if($("[name=userPw]").val().length < 4 || $("#userPwChk2").val().length < 4){
				alert("비밀번호는 4자리 이상이어야 합니다.");
				return false;
			}

			// LINE :: 비밀번호가 다를 경우
			if($("[name=userPw]").val() != $("#userPwChk2").val()){
				alert("비밀번호가 서로 다릅니다.\n확인 후 다시 입력해주세요.");
				$("[name=userName]").focus();
				return false;
			}

			if ($("[name=userPosition]").val() == 'manager') {
				if ($("[name=userSS]").val().length == 0) {
					alert("회사명을 입력해주세요.");
					$("[name=userSS]").focus();
					return false;
				}

				var phoneChk = phoneNumChk($("[name=userId]").val());

				if (!phoneChk) {
					return phoneChk;
				}
			} else {
				// LINE :: 핸드폰번호 확인
				if ($("[name=userTel]").val().length == 0) {
					alert("핸드폰번호를 입력해주세요.");
					$("[name=userTel]").focus();
					return false;
				} else {
					var phoneChk = phoneNumChk($("[name=userTel]").val());

					if (!phoneChk) {
						return phoneChk;
					}
				}
			}



			modal({
				title: '알림메시지',
				type : 'confirm',
				text: '입력하신 정보로 회원가입 하시겠습니까?',
				callback : function(result) {
					if (result) {
						$("#page_loading_progressbar").css("visibility", "visible");

						// LINE :: 공백 제거
						$("[name=userId]").val($.trim($("[name=userId]").val()));
						$("[name=userPw]").val($.trim($("[name=userPw]").val()));
						$("[name=userTel]").val($.trim($("[name=userTel]").val()));
						$("[name=userName]").val($.trim($("[name=userName]").val()));

						$.ajax({
							url: "/ajax/join",
							type: "POST",
							data: $("form[name=loginfrm]").serialize(),
							async: false,
							success: function (data) {
								$("#page_loading_progressbar").css("visibility", "hidden");
								var json = $.parseJSON(data);
								if (json.httpCode == 200) {
									setRegisterInfo();
									alert('회원가입에 성공하였습니다.\n로그인 해주시길 바랍니다.');
									location.href = "/login";

								} else {
									alert(json.message);
								}
							},
							error: function () {
								alert("오류가 발생하였습니다.");
								location.reload();
							}
						});
					}else {

					}
				}
			});
		}

		function setRegisterInfo() {
			setCookie("dailyReportId",  $("[name=userId]").val(), 365);
			setCookie("saveDailyReportAccount", true, 365);
			localStorage.setItem("dailyReportPw",  $("[name=userPw]").val(), 365);
		}

		//레이어팝업 오픈
		$.openLayerPrivaryPopUp = function(target, _this){
			//레이어팝업 닫기시 다시 탭 포커스 이동해시켜주기 위함
			_focus = $(_this);

			$("#"+target).removeClass("dis-n");
			//포커스를 팝업 내로 옮겨줌
			$("#"+target).attr("tabindex","0").focus();
			/*return $(this);*/
		}

		$.closeLayerPrivaryPopUp = function(obj) {
			if (obj) {
				$(obj).parents(".layerMask").addClass("dis-n");
			} else {
				$(".layerMask").addClass("dis-n");
			}
			if (_focus.length > 0) {
				_focus.focus();
			}
		}

		function numberChk(obj) {

			var testValue = $(obj).val();

			if(testValue.length === 0) {
				$(obj).val("010");
			}



			testValue = testValue.replace(/([^0-9])/g, '');
			$(obj).val(testValue);

		}

		function phoneNumChk(testValue) {
			let phonenumberPattern = /^(010)?([0-9]{4})?([0-9]{4})$/g;

			var phoneChk = phonenumberPattern.test(testValue);

			if(!phoneChk) {
				alert("올바른 전화번호 형식이 아닙니다.");
			}

			return phoneChk;
		}

		function setCookie(cookieName, value, exdays){
			var exdate = new Date();
			exdate.setDate(exdate.getDate() + exdays);
			var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString() + "; path=/login");
			document.cookie = cookieName + "=" + cookieValue;
		}

		// 쿠키 삭제
		function deleteCookie(cookieName){
			var expireDate = new Date();
			expireDate.setDate(expireDate.getDate() - 1);
			document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
		}

		// 쿠키 가져오기
		function getCookie(cookieName) {
			cookieName = cookieName + '=';
			var cookieData = document.cookie;
			var start = cookieData.indexOf(cookieName);
			var cookieValue = '';
			if(start != -1){
				start += cookieName.length;
				var end = cookieData.indexOf(';', start);
				if(end == -1)end = cookieData.length;
				cookieValue = cookieData.substring(start, end);
			}
			return unescape(cookieValue);
		}
	</script>


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
</style>
<body>
<div class="b-loginM">
	<section class="b-loginM__inner join ">
		<div class="b-loginM-wrap">
			<h1 class="b-loginM__tit">
				${type == 'driver' ? '덤프트럭 <span>기사님</span>' : '제출처 <span>담당자님</span>'}
			</h1>
			<h1 class="b-loginM__tit add">회원가입</h1>

			<form name="loginfrm" onsubmit="return false;">
				<input type="hidden" name="userPosition" value="${type}">
				<div class="b-loginM__form driver <c:if test="${type == 'manager'}">dis-n</c:if>">
					<div class="line"></div>
					<%--					<div class="b-loginM__input">--%>
					<%--						<input type="hidden" name="userSS">--%>
					<%--						<label>회사명</label>--%>
					<%--						<div class="b-selectCustomWrap">--%>
					<%--							<a href="javascript:void(0)">--%>
					<%--								선택해주세요--%>
					<%--							</a>--%>
					<%--							<ul class="b-selectCustom ssList">--%>
					<%--								<c:forEach var="ssInfo" items="${userSSList}">--%>
					<%--									<li select-data="${ssInfo.siteName}"><span>${ssInfo.customSiteName}</span><span>${ssInfo.siteLocation}</span></li>--%>
					<%--								</c:forEach>--%>
					<%--							</ul>--%>
					<%--						</div>--%>
					<%--					</div>--%>
					<div class="b-loginM__input">
						<label>아이디</label>
						<input type="text" placeholder="차량번호 전체" name="userId" autocomplete="off">
					</div>
					<div class="b-loginM__input">
						<label>비밀번호</label>
						<input type="password" placeholder="4자리 이상" id="userPwChk1" name="userPw"  autocomplete="off">
					</div>
					<div class="b-loginM__input">
						<label>비밀번호<br/>확인</label>
						<input type="password" placeholder="4자리 이상" id="userPwChk2" autocomplete="off">
					</div>
					<div class="b-loginM__input">
						<label>휴대폰번호</label>
						<input type="text" name="userTel" value="010" autocomplete="off">
					</div>
					<div class="b-loginM__input">
						<label>기사이름</label>
						<input type="text" name="userName" autocomplete="off">
					</div>
				</div>
				<div class="b-loginM__form manager <c:if test="${type == 'driver'}">dis-n</c:if>">
					<div class="line"></div>
					<%--					<div class="b-loginM__input">--%>
					<%--						<input type="hidden" name="userSS">--%>
					<%--						<label>회사명</label>--%>
					<%--						<div class="b-selectCustomWrap">--%>
					<%--							<a href="javascript:void(0)">--%>
					<%--								선택해주세요--%>
					<%--							</a>--%>
					<%--							<ul class="b-selectCustom ssList">--%>
					<%--								<c:forEach var="ssInfo" items="${userSSList}">--%>
					<%--									<li select-data="${ssInfo.siteName}"><span>${ssInfo.customSiteName}</span><span>${ssInfo.siteLocation}</span></li>--%>
					<%--								</c:forEach>--%>
					<%--							</ul>--%>
					<%--						</div>--%>
					<%--					</div>--%>
					<div class="b-loginM__input">
						<label>아이디</label>
						<input type="text" placeholder="휴대폰번호 ex) 01012341234" name="userId" autocomplete="off" onkeyup="numberChk(this);" onfocusout="numberChk(this);" onfocus="numberChk(this);">
					</div>
					<div class="b-loginM__input">
						<label>비밀번호</label>
						<input type="password" placeholder="4자리 이상" id="userPwChk1" name="userPw"  autocomplete="off">
					</div>
					<div class="b-loginM__input">
						<label>비밀번호<br/>확인</label>
						<input type="password" placeholder="4자리 이상" id="userPwChk2" autocomplete="off">
					</div>
					<div class="b-loginM__input">
						<label>회사명</label>
						<input type="text" name="userSS" value="" autocomplete="off">
					</div>
					<div class="b-loginM__input">
						<label>관리자명</label>
						<input type="text" name="userName" autocomplete="off">
					</div>
				</div>

				<div class="checkbox-group b-form-table-ck erpCheckText">
					<label>
						<div class="checkbox-f">
							<input type="checkbox" name="privacyChk" id="privacyChk" value="Y">
							<span class="checkmark"></span>
							<span>개인정보 수집 및 이용에 동의합니다.</span>
						</div>

						<button onclick="$.openLayerPrivaryPopUp('pop-personal', this);" onkeydown="if (event.keyCode == 13) return false;">
							<a>
								[ 개인정보취급방침 보기 ]
							</a>
						</button>
					</label>
				</div>

				<div class="b-loginM__btnGroup">
					<button class="b-loginM__btn add" type="button" onkeydown="if(event.keyCode == 13) return false;" onclick="$.join()">회원가입</button>
					<a href="/login" class="b-loginM__btn" type="button">로그인 화면</a>
				</div>
			</form>

			<div class="b-question">
				<%--				<img src="/resources/image/icons/ico_que.png" alt="" style="margin-bottom: 5px; margin-right: 10px; margin-top: 4px;" class="que-dis-mn" onclick="$.openLayerHelpMsgPopUp(this, 'W01-1');">--%>
				<span class="fc-point que-dis-mn" style="margin-top: 3px; font-weight: 500;">
				문의
			</span>
				<img src="/resources/image/icons/ico_que.png" alt="" class="que-dis-b que-icon" onclick="$.openLayerHelpMsgPopUp(this, 'W01-1');">
				<span>02-6012-7406 / 010-3717-7406</span>
			</div>
		</div>

	</section>
</div>
</body>
</html>