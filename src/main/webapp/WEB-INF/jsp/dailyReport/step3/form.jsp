<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/include/header.jsp" %>
<link rel="stylesheet" type="text/css" href="/resources/css/dailyreport.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.9/css/select2.min.css" rel="stylesheet"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.9/js/select2.min.js"></script>
<script type="text/javascript" src="/resources/js/dailyReport/form.js?jsVerType=20<fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyyMMddHHmmss"/>" ></script>


<section id="canvas" style="">
    <div id="dailyreport">
        <%--<a target="_blank" href="https://icons8.com/icon/12653/microphone">Microphone</a> icon by <a target="_blank" href="https://icons8.com">Icons8</a>--%>
        <div class="sub-title" style="border-bottom: 1px solid #ddd;">
            <h1 class="sub-title__h1">
                <span class="v-mid">운행 일보 등록</span>
                <img src="/resources/image/icons/ico_que.png" alt="" class="que-dis-mn"
                     onclick="">
            </h1>

            <ul class="location__ul">
                <li><span class="offscreen">홈</span></li>
                <li>
                    <span class="trn">운행 일보 등록</span>
                </li>
            </ul>
        </div>

        <%-- 차량번호 확인하기 --%>
        <input type="hidden" type="text" name="CarNo" id="CarNo" value="${sessionScope.loginInfo.userId}" />


        <form name="layerFrm" method="post">
            <input type="hidden" name="gubun" />
            <input type="hidden" name="searchText"/>
            <input type="hidden" name="qckSearch"/>
        </form>


        <form name="pagefrm" method="post">
            <input type="hidden" name="sheetID" value=""/>
            <input type="hidden" name="carNo" value=""/>
            <input type="hidden" name="date" value=""/>
            <input type="hidden" name="carSubmit" value=""/>
            <input type="hidden" name="carSubmitTel" value=""/>
            <input type="hidden" name="salesman" value=""/>
            <input type="hidden" name="chk1" value=""/>
        </form>

        <%@ include file="/WEB-INF/jsp/dailyReport/step3/searchPop.jsp" %>

        <div class="mt10" >
            <div class="title">
                <p class="caption-like">
                    <span class="v-mid" data-trn-key="TR_MENU_KEY_375">제출처 정보 등록</span>
                </p>

                <button class="btn addBtn" type="button" onclick="openPopSearch()">
                    이전 제출처 검색
                </button>
            </div>

            <form method="post" name="frm">
                <input type="hidden" name="sheetID" value="${!empty view ? view.sheetID : 0}">

                <div class="mtable" id="main-table" style="border-top: 2px solid #0068b7;">
                    <ul class="mtable__ul">


                        <li>
                            <label class="t10" style="font-size : var(--main-font-size);">제출처</label>
                            <img src="/resources/image/icons/ico_mic.png" alt="마이크" class="icon_mic">
                            <span class="content">
                                <input  type="text" class="wp100 voice" name="carSubmit" id="carSubmit" placeholder="제출처" value="${!empty view ? view.carSubmit : ''}">
                            </span>
                        </li>

                        <li >
                            <label class="t10" style="font-size : var(--main-font-size);">담당자</label>
                            <img src="/resources/image/icons/ico_mic.png" alt="마이크" class="icon_mic">
                            <span class="content">
                                <input  type="text" class="wp100 voice" name="salesman" id="salesman" value="${!empty view ? view.salesman : ''}"
                                       placeholder="담당자" autocomplete="off">
                            </span>
                        </li>

                        <li>
                            <label class="t10" style="font-size : var(--main-font-size);">휴대폰</label>
                            <div class="empty"></div>
                            <span class="content">
                                <input  type="tel" class="wp100" name="carSubmitTel" id="carSubmitTel" value="${!empty view ? view.carSubmitTel : ''}"
                                       list="insiteDataList" placeholder="-없이 숫자8자리를 입력해주세요" autocomplete="off" pattern="010[0-9]{8}" maxlength="11"
                                       style="margin-left: 56px;" onfocus="fill010()"}
                                >
                                <datalist id="insiteDataList">
                                        <option value=""></option>
                                </datalist>
                            </span>
                        </li>

                        <li style="display: flex;">
                            <label class="t10" style="font-size : var(--main-font-size);">운행일</label>
                            <div class="datediv">
                                <span class="content">
                                    <input type="text" class="datepicker wp100" id="date" name="date"
                                        value="${!empty view ? view.date : ''}" placeholder="운행일" readonly autocomplete="off">
                                </span>
                                <button type="button" id="prev-day" onclick="prevday()">
                                    <img src="/resources/image/icons/ico_gray_next.png" alt="<" style="transform: rotateY(180deg);">
                                </button>
                                <button type="button" id="next-day" onclick="nextday()">
                                    <img src="/resources/image/icons/ico_gray_next.png" alt=">">
                                </button>
                            </div>
                        </li>

                        <li style="align-items: center; height: var(--main-height);">
                            <label for="checkbox" style="font-size : var(--main-font-size);">결재요청</label>
                            <input type="checkbox" id="checkbox" name="chk1" style="margin-left: 70px;"
                            value="0">
                            <div id="dateDisplay" style="margin-left: 10px; width: 150px; font-size : var(--main-font-size);">결재일 : <span id="currentDate" ></span></div>
                            <button class="btn addBtn" type="button" onclick="$.saveCarSubmit();"style="margin: 0 0 0 auto;  width: 120px;">
                                제출처 저장
                            </button>
                        </li>
                    </ul>
                </div>
            </form>
        </div>

        <div class="mt10" style="border-bottom: 2px solid #0068b7;">
            <p class="caption-like">
                <span class="v-mid" data-trn-key="TR_MENU_KEY_375">운송 정보 등록</span>
            </p>
        </div

        <div class="mt10">
             <%@ include file="camera.jsp" %>
            <button class="btn addBtn" type="button" style="margin: 0px; width: 100px;" onclick="openPop()">
                운송 신규등록
            </button>
        </div>

        <%@ include file="popupInput.jsp" %>

        <table class="list-table mt10">
            <colgroup>
                <col width="22%">
                <col width="22%">
                <col width="18%">
                <col width="13%">
                <col width="25%">
            </colgroup>
            <thead style="border-top: 2px solid #ddd;">
            <tr>
                <th style="font-size: var( --main-font-size);">상차지</th>
                <th style="font-size: var( --main-font-size);">하차지</th>
                <th style="font-size: var( --main-font-size);">품목</th>
                <th style="font-size: var( --main-font-size);">대수</th>
                <th style="font-size: var( --main-font-size);">비고</th>
            </tr>
            </thead>

            <tr>
                <td>상차상차</td>
                <td>하차하차</td>
                <td>아이템아이템</td>
                <td>33</td>
                <td>비고비고비고</td>
            </tr>

            <tr>
                <c:forEach var="list" items="${groupList}" varStatus="status">
                    <tr onclick="$.updateData(${list.sheetID}, '${list.carSubmit}')">
                        <td>${list.status}</td>
                        <td>${list.fromsite}</td>
                        <td>${list.tosite}</td>
                        <td>${list.item}</td>
                        <td>${list.Qty}</td>
                        <td>${list.Rem}</td>
                    </tr>
                </c:forEach>
            </tr>
        </table>


        <div class="btn-area">
            <button type="button" class="btn btn-white " onClick="history.go(-1)">이전화면</button>
            <button type="button" class="btn btn-white" onclick="clearInputs()">전체삭제</button>
            <button type="button" class="btn btn-blue" id="submitBtn" onClick="checkBox()">제출하기</button>
        </div>
    </div>
</section>




<script src="/resources/js/dailyReport/step3/dailyform-sub.js"></script>
<script src="/resources/js/dailyReport/step3/dailyform.js"></script>

<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>