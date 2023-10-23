<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/include/header.jsp" %>
<link rel="stylesheet" type="text/css" href="/resources/css/dailyreport.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.9/css/select2.min.css" rel="stylesheet"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.9/js/select2.min.js"></script>

<section id="canvas" style="">
    <div id="dailyreport">
        <%--<a target="_blank" href="https://icons8.com/icon/12653/microphone">Microphone</a> icon by <a target="_blank" href="https://icons8.com">Icons8</a>--%>
        <div class="sub-title" style="border-bottom: 1px solid #ddd; padding-bottom: 10px;">
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

                <%--<button class="btn addBtn" type="button" onclick="openPopSearch()">
                    이전 제출처 검색
                </button>--%>
            </div>

            <form method="post" name="frm">
                <input type="hidden" name="sheetID" id="sheetID" value="${!empty view ? view.sheetID : 0}">

                <div class="mtable" id="main-table" style="border-top: 2px solid #0068b7; ">
                    <ul class="mtable__ul" style="padding-top: 5px !important;">


                        <li>
                            <label class="t10">제출처</label>
                            <img src="/resources/image/icons/ico_mic.png" alt="마이크" class="icon_mic">
                            <span class="content">
                                <input type="text" class="wp100 voice input" name="carSubmit" id="carSubmit" oninput="validateInput1(this)"
                                    autocomplete="on" placeholder="제출처" value="${!empty view ? view.carSubmit : ''}" onkeyup="searchByCarsubmit(this)">
                            </span>

                        </li>

                        <li >
                            <label class="t10">담당자</label>
                            <img src="/resources/image/icons/ico_mic.png" alt="마이크" class="icon_mic">
                            <span class="content">
                                <input  type="text" class="wp100 voice input" name="salesman" id="salesman" value="${!empty view ? view.salesman : ''}"
                                       placeholder="담당자" autocomplete="on" oninput="validateInput2(this)" onkeyup="searchBySalesman(this)">
                            </span>
                        </li>

                        <li>
                            <div style="width: 60%; height: var(--main-height)">
                                <label class="t10">휴대폰</label>
                                <span class="content">
                                    <input  type="tel" class="wp100 input" name="carSubmitTel" id="carSubmitTel" value="${!empty view ? view.carSubmitTel : ''}"
                                           list="insiteDataList" placeholder="-없이 숫자8자리 입력" autocomplete="off" pattern="010[0-9]{8}" maxlength="11"
                                           style="margin-left: 75px; width: 100px;" onfocus="fill010()" oninput="validateInput3(this)" onkeyup="searchByCarsubmitTel(this)"
                                    >
                                </span>
                            </div>
                            <div id="invite">
                                <span id="isMember">거래처 상태</span>
                                <button type="button" class="btn addBtn" id ="inviteBtn" onclick="$.invite()">비회원 초대하기</button>
                            </div>
                        </li>

                        <li style="display: flex; justify-content: space-between;">
                            <div class="datediv" style="width: 59%; height: var(--main-height)">
                                <label class="t10">운행일</label>
                                <span class="content">
                                    <input type="text" class="datepicker input" id="date" name="date" style="width: 100px; margin-left: 75px; text-align: left; padding-left: 5px;"
                                        value="${!empty view ? view.date : ''}" placeholder="운행일" readonly autocomplete="off" onclick="pickDate()" onchange="listData()">
                                </span>
                            </div>
                            <%--
                            <div>
                                 <button type="button" class="dateBtn" style="margin-left:69px" id="prevDay" >&lt;</button>
                                 <button type="button" class="dateBtn" id="nextDay" >&gt;</button>
                            </div>
                            --%>
                            <div style="width: 41%; height: var(--main-height)">
                                <label>진행</label>
                                <span class="content">
                                    <select id="CurrStatus" name="CurrStatus" style="width: 70px; margin-left: auto;">
                                        <option value="배차">배차</option>
                                        <option value="상차">상차</option>
                                        <option value="하차">하차</option>
                                        <option value="제출" disabled>제출</option>
                                        <%-- 제출하기 버튼을 통해서만 제출을 선택 할 수 있다--%>
                                    </select>
                                </span>
                            </div>
                        </li>

                        <li>
                            <div id="mutualApproval">
                                <label>제출처 결재 확인</label>
                                <input type="checkbox" class="chkbx" name="chk0" value="0" onChange="mutallyApproved()">
                            </div>

                            <div id="approval">
                                <label>결재</label>
                                <input type="checkbox" class="chkbx" id="checkbox" name="chk1" value="0" onChange="approved()">
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="mt10">
                    <div class="title adjustMax359" style="border-bottom: 2px solid #0068b7;">
                        <p class="caption-like">
                            <span class="v-mid" data-trn-key="TR_MENU_KEY_375">운송 정보 등록</span>
                        </p>
                        <div class="haveTwo">
                            <button class="btn addBtn" type="button" style="margin: -1px 5px 0 auto; width: 100px;" onclick="openPop()">
                                운송 신규등록
                            </button>
                            <%@ include file="popupInput.jsp" %>
                            <%@ include file="camera.jsp" %>
                        </div>
                    </div>
                </div>
            </form>
        </div>


        <div>
            <table class="list-table mt5" >
                <colgroup>
                    <col width="22%">
                    <col width="22%">
                    <col width="18%">
                    <col width="10%">
                    <col width="28%">
                </colgroup>
                <thead style="border-top: 2px solid #ddd;">
                    <tr>
                        <th>상차지</th>
                        <th>하차지</th>
                        <th>품목</th>
                        <th>대수</th>
                        <th>비고</th>
                    </tr>
                </thead>
                <tbody id="transportContainer">
                </tbody>
            </table>
        </div>

        <div class="btn-area">
            <button type="button" class="btn btn-white" onclick="clearInputs()">전체삭제</button>
            <button type="button" class="btn btn-blue" id="submitBtn" onClick="$.editSales() submitConfirmation()">제출하기</button>
            <button type="button" class="btn btn-blue " onClick="$.editSales()">저장하기</button>
            <button type="button" class="btn btn-white " onClick="history.go(-1)">이전화면</button>
        </div>
    </div>
</section>


<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>


<script src="/resources/js/dailyReport/step3/dailyform-sub.js"></script>
<script src="/resources/js/dailyReport/step3/dailyform.js"></script>
<script src="/resources/js/dailyReport/step3/messages.js"></script>
<script src="/resources/js/dailyReport/step3/voicememo.js"></script>
