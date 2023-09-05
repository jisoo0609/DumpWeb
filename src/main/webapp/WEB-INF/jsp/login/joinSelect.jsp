<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="e" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>Work&Sales</title>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="msapplication-TileImage" content="/resources/image/favicon/favicon.png">
    <link rel="shortcut icon" href="/resources/image/favicon/favicon.png">


    <!-- js -->
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

    <link href="/resources/css/login.css?jsVerType=<fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyyMMddHHmmss"/>" rel="stylesheet" type="text/css">

    <link href="/resources/js/jquery.modal-master/css/jquery.modal.css?version=1.2&<fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyyMMddHHmmss"/>"  type="text/css" rel="stylesheet" />
    <link href="/resources/js/jquery.modal-master/css/jquery.modal.theme-xenon.css?version=1.2&<fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyyMMddHHmmss"/>"  type="text/css" rel="stylesheet" />
    <link href="/resources/js/jquery.modal-master/css/jquery.modal.theme-atlant.css?version=1.2&<fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyyMMddHHmmss"/>"  type="text/css" rel="stylesheet" />

    <script type="text/javascript" src="/resources/js/jquery.modal-master/js/jquery.modal.js?jsVerType=<fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyyMMddHHmmss"/>" ></script>
    <script type="text/javascript">
        function setType(obj) {
            var cls = $(obj).attr("class");
            var clsArr = cls.split(" ");
            var type = clsArr[clsArr.length -1];
            console.log(type);

            var frm = document.joinfrm;

            $("[name=type]").val(type);
            frm.action = "/join/step2";
            frm.submit();
        }
    </script>
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
    .select_area {
        padding: 0 25px;
        margin-top: 30px;
    }

    .select_box {
        width: 100%;
        height: 150px;
        display: flex;
        margin: 10px 0;
    }
    .select_box > div {
        width: 50%;
    }
</style>
<body>
<div class="b-loginM">
    <section class="b-loginM__inner join ">
        <div class="b-loginM-wrap">
<%--            <h1 class="b-loginM__tit">회원가입</h1>--%>
                <h2 style="text-align: center; font-size: 18px;">회원가입 유형을 선택해주세요.</h2>
            <form name="joinfrm" method="post">
                <input type="hidden" name="type">
            </form>

            <div class="select_area">
                <div class="select_box driver" onclick="setType(this);">
                    <img src="/resources/image/login/driver_btn.png" style="width: 100%; height: 95%;">
                </div>
                <div class="select_box manager" onclick="setType(this);">
                    <img src="/resources/image/login/manager_btn.png" style="width: 100%; height: 95%;">

                </div>
            </div>

<%--            <div class="b-question">--%>
<%--                <img src="/resources/image/icons/ico_que.png" alt="" style="margin-bottom: 5px; margin-right: 10px; margin-top: 4px;" class="que-dis-mn" onclick="$.openLayerHelpMsgPopUp(this, 'W01-1');">--%>
<%--                <span class="fc-point que-dis-mn" style="margin-top: 3px;">--%>
<%--				문의--%>
<%--			</span>--%>
<%--                <img src="/resources/image/icons/ico_que.png" alt="" class="que-dis-b que-icon" onclick="$.openLayerHelpMsgPopUp(this, 'W01-1');">--%>
<%--                <span>02-6012-7406 (주)기원테크</span>--%>
<%--            </div>--%>
        </div>
    </section>
</div>
</body>
</html>

