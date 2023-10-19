<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="e" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="ko">
<head>
	<meta name="description" content="">
	<meta name="keyword" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">

	<meta name="msapplication-TileImage" content="/resources/image/favicon/favicon.png">
	<link rel="shortcut icon" href="/resources/image/favicon/favicon.png">

	<!-- Style-->
	<link href="/resources/js/jquery.modal-master/css/jquery.modal.css?version=1.2&<fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyyMMddHHmmss"/>"  type="text/css" rel="stylesheet" />
	<link href="/resources/js/jquery.modal-master/css/jquery.modal.theme-xenon.css?version=1.2&<fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyyMMddHHmmss"/>"  type="text/css" rel="stylesheet" />
	<link href="/resources/js/jquery.modal-master/css/jquery.modal.theme-atlant.css?version=1.2&<fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyyMMddHHmmss"/>"  type="text/css" rel="stylesheet" />

	<link href="/resources/css/style.css?jsVerType=<fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyyMMddHHmmss"/>" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="/resources/css/loading.css">
	<style type="text/css">

		.default-tab__ul.cnt8 li {
			width: 12.5%; }

		.wp70{width: 70%;}
		.wp90{width: 90%;}
		@media screen and (min-width: 1025px) {
			.onlyMobileFunction{display: none;}

		}

		@media screen and (max-width: 1024px) {
			.workplan_select {
				width: 23px;
				position: absolute;
				top: 0;
				right: 0;
				border-left: none;
				padding-left: 0;
			}

			.search-form-details label {
				position: absolute;
				left: 0;
				font-size: 13px;
				width: 35%;
			}
			.search-form-details li {
				width: 100%;
				float: none;
				margin-right: 0;
				position: relative;
				padding-bottom: 10px;
			}
			.search-form-details .input-group {
				width: 100%;
				padding-left: 120px; }
		}

		.po-re{
			position: relative;
		}

		.po-ab{
			position: absolute;
			top: 0;
			right: 30px;
		}

		.table_text_word {
			 word-break:break-all;
			 wrap: hard;
		 }

		.table_text_word_keep {
			word-break:break-word;
			wrap: hard;
		}

		.pre_text_word {
			white-space: pre-wrap; /* CSS3*/
			white-space: -moz-pre-wrap; /* Mozilla, since 1999 */
			white-space: -pre-wrap; /* Opera 4-6 */
			white-space: -o-pre-wrap; /* Opera 7 */
			word-wrap: break-all; /* Internet Explorer 5.5+ */
		}

		.mobile_helpBox_list {
			position: relative;
			z-index: 1
		}

		.opacity_0_5 {
			opacity: 0.5;
		}

		.ui-datepicker{font-size: 12px; width: 250px}
		.ui-datepicker select.ui-datepicker-month{width: 30%; font-size: 11px; margin-left: 5%; height:20px}
		.ui-datepicker select.ui-datepicker-year{width: 30%; font-size: 11px; height:20px}

		#banner_wrap {margin:0 auto;text-align:center;}
		#banner_quick_bg {margin:0 auto;text-align:center;width:1000px;position:relative;}
		#banner_quick {position:absolute;z-index:2;top:15px;width:150px; height: 30px; right:-270px;  border: 1px solid rgba(51, 86, 123, 0.8); border-width: 5px; background-color: #002c5a}
		#banner_quick a {color: white;}
		#banner_container {position:relative;}

		.lineFirstBold:first-line {color:#6f1111; font-weight:bold;}


		.comp-name-mode {
			max-width: 310px;
			position: absolute;
			top: 80%;
			left: 50%;
			transform: translate(-50%, -50%);
			font-weight: 600; }

		.comp-name-mode-question {
			max-width: 310px;
			position: absolute;
			top: 80%;
			left: 52%;
			transform: translate(-50%, -50%);
			font-weight: 600; }


		@media screen and (max-width: 1024px) {
			.onlyPCFunction{ display: none;}
			.mobile-fw-300 {font-weight: 300;}
		}

		#graph_donut_title{
			width:40%;
			text-align:center;
			font-size: 22px;
			font-weight: bold;
		}

		.schedule-bg{
			color : rgb(0, 104, 183);
			font-weight: bold;
			border: 1px solid rgb(0, 104, 183);
		}

		/* LINE :: focus mouse change */
		.pointer {cursor:pointer;}

		/* LINE :: th align center */
		.list-table th.center {
			text-align: center; }

		.mobile-navi-dept1 a.active {
			background: #0068b7;
			color: #fff;
		}

		.closeMask {position:fixed;z-index:99; width:100%; height:100%; background:rgba(0,0,0,0.5);}
	</style>


	<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>


	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
	<script src="//code.jquery.com/jquery.min.js"></script>
	<script src="//code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/waypoints/4.0.1/jquery.waypoints.min.js"></script>

	<script src="/resources/js/common.js?jsVerType=20<fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyyMMddHHmmss"/>"></script>
	<script src="/resources/js/include/header.js?jsVerType=20<fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyyMMddHHmmss"/>"></script>

	<script type="text/javascript" src="/resources/js/jquery.modal-master/js/jquery.modal.js?jsVerType=<fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyyMMddHHmmss"/>" ></script>

	<title>일보관리시스템</title>
</head>


<body>

	<div class="layer-mask"></div>
	<header class="header">
		<div class="header-top">
			<div class="maxwrap">
				<div class="header-topWrap">
					<span style="font-weight: bold; font-size: 0; display: inline-block;">
						<img src="/resources/image/login/ico-call.png" alt="" onclick="document.location.href='tel:01037177406'">

						<span style="padding-left: 10px;">
									<a href="https://kw.worknsales.com/dump" target="_blank"><img src="/resources/image/icons/ico_que.png" alt="" class="que-dis-mn" onclick=";"></a>
							</span>
					</span>

					<!--업체명-->
					<span class="comp-name">
						${sessionScope.loginInfo.userId}
					</span>

					<div class="header-top-right">
						<ul class="header-top__ul">
							<li><a href="#" onclick="$.logout();" style="width: auto; font-size: 17px; font-weight: bold;">로그아웃</a></li>
							<li>
								<button class="header__btn-menu" onclick="$.toggleLeftMenu()" style="width: 35px; font-size: 17px; font-weight: bold;">
									메뉴
								</button>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div><!--header-top-->

		<%@ include file="mobile_left_menu.jsp" %>   <%-- 모바일 웹 메뉴 --%>
	</header>

	<div id="page_loading_progressbar" style="z-index:9998; position:fixed; visibility:hidden; left:calc(100%/2); top:calc(100%/2);">
		<div class="closeMask" style="left:0px; top:0px;"></div>

		<div id="ajaxloader2">
			<div class="outer"></div>
			<div class="inner" style="top: -40px;"></div>
			<p style="color:#fff; text-align:center;">Checking...</p>
		</div>
	</div>

	<%-- 도움말 --%>
	<%@ include file="pop-question.jsp" %>