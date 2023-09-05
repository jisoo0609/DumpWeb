<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/include/header.jsp" %>
<link rel="stylesheet" type="text/css" href="/resources/css/dailyreport.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.9/css/select2.min.css" rel="stylesheet"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.9/js/select2.min.js"></script>
<script type="text/javascript" src="/resources/js/dailyReport/form.js?jsVerType=20<fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyyMMddHHmmss"/>" ></script>
<script src="/resources/js/dailyReport/dailyform-sub.js"></script>
<script src="/resources/js/dailyReport/dailyform.js"></script>

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

        <div class="mt10" >
            <p class="caption-like">
                <span class="v-mid" data-trn-key="TR_MENU_KEY_375">제출처 정보 등록</span>
            </p>
            <form method="post" name="frm">
                <input type="hidden" name="sheetID" value="${!empty view ? view.sheetID : 0}">

                <div class="mtable" id="main-table" style="border-top: 2px solid #0068b7;">
                    <ul class="mtable__ul">
                        <li style="display: flex;">
                            <label class="t10">운행일</label>
                            <span class="content">
                                <input style="margin-left: 75px;" type="text" class="datepicker wp100" id="date" name="date"
                                       value="${!empty view ? view.date : ''}" placeholder="운행일" readonly autocomplete="off">
                            </span>
                        </li>


                        <li>
                            <label class="t10">제출처</label>
                            <img src="/resources/image/icons/ico_mic.png" alt="마이크" class="icon_mic">
                            <span class="content">
                                <input type="text" class="wp100 voice" name="carSubmit" id="carSubmit" placeholder="제출처" value="${!empty view ? view.carSubmit : ''}">
                            </span>
                        </li>

                        <li >
                            <label class="t10">담당자</label>
                            <img src="/resources/image/icons/ico_mic.png" alt="마이크" class="icon_mic">
                            <span class="content">
                                <input type="text" class="wp100 voice" name="salesman" id="salesman" value="${!empty view ? view.salesman : ''}"
                                       placeholder="담당자" autocomplete="off">
                            </span>
                        </li>

                        <li>
                            <label class="t10">휴대폰</label>
                            <div class="empty"></div>
                            <span class="content">
                                <div style="width: 55px; margin-left: 10px;">010 <span style="font-size: 13px;">—</span> </div>
                                <input type="tel" class="wp100" name="carSubmitTel" value="${!empty view ? view.carSubmitTel : ''}"
                                       list="insiteDataList" placeholder="제출처 담당자 휴대폰 번호" autocomplete="off" pattern="-[0-9]{4}-[0-9]{4}" maxlength="9"
                                >
                                <datalist id="insiteDataList">
                                        <option value=""></option>
                                </datalist>
                            </span>
                        </li>
                        <li style="align-items: center; height: 28px;">
                            <label for="checkbox">결재</label>
                            <input type="checkbox" id="checkbox" style="margin-left: 50px;" name="chk1" id="chk1" >
                            <button class="btn addBtn" type="button" style="margin: 0 0 0 auto;  width: 120px;">
                                거래처 저장
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
        </div>

        <%@ include file="camera.jsp" %>

        <table class="list-table mt10">
            <colgroup>
                <col width="22%">
                <col width="22%">
                <col width="16%">
                <col width="10%">
                <col width="29%">
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

            <tr>
                <td>상차상차</td>
                <td>하차하차</td>
                <td>당근바나나당근바나나</td>
                <td>22</td>
                <td>테스트라인입니다테스트라인입니다테스트라인입니다</td>
            </tr>

            <tr>
                <td>상차상차</td>
                <td>하차하차</td>
                <td>당근바나나당근바나나</td>
                <td>22</td>
                <td>테스트라인입니다테스트라인입니다테스트라인입니다</td>
            </tr>

            <tr>
                <td>상차상차</td>
                <td>하차하차</td>
                <td>당근바나나당근바나나</td>
                <td>22</td>
                <td>테스트라인입니다테스트라인입니다테스트라인입니다</td>
            </tr>
            <tr>
                <td>상차상차</td>
                <td>하차하차</td>
                <td>당근바나나당근바나나</td>
                <td>22</td>
                <td>테스트라인입니다테스트라인입니다테스트라인입니다</td>
            </tr>



            <tr>
                <td>당근당근</td>
                <td>바니바니</td>
                <td>당근바나나</td>
                <td>1</td>
                <td></td>
            </tr>



            <div id="popup" class="popup">
                <div class="popup-content">
                    <div class="mt10">
                        <form method="post" name="frm">
                            <input type="hidden" name="sheetID" value="${!empty view ? view.sheetID : 0}">

                            <div class="mtable">
                                <ul class="mtable__ul">
                                    <li>
                                        <label>상차지</label>
                                        <img src="/resources/image/icons/ico_mic.png" alt="마이크" class="icon_mic">
                                        <span class="content">
                                                <input type="text" class="wp100 voice" name="fromsite" id="fromsite" placeholder="상차지" value="${!empty view ? view.fromsite : ''}">
                                            </span>
                                    </li>

                                    <li>
                                        <label>하차지</label>
                                        <img src="/resources/image/icons/ico_mic.png" alt="마이크" class="icon_mic">
                                        <span class="content">
                                                <input type="text" class="wp100 voice" name="tosite" id="tosite" value="${!empty view ? view.tosite : ''}"
                                                       placeholder="하차지" autocomplete="off">
                                            </span>
                                    </li>

                                    <li>
                                        <label>품목</label>
                                        <img src="/resources/image/icons/ico_mic.png" alt="마이크" class="icon_mic">
                                        <span class="content">
                                                <input type="text" class="wp100 voice" name="item" id="item" value="${!empty view ? view.item : ''}"
                                                       placeholder="품목" autocomplete="off">
                                            </span>
                                    </li>

                                    <li>
                                        <label>대수</label>
                                        <span class="content">
                                                 <input type="number" class="wp100 ml75" name="Qty" id="Qty" placeholder="대수" autocomplete="off">
                                            </span>
                                    </li>

                                    <li>
                                        <label>비고</label>
                                        <span class="content">
                                            <textarea class="Rem ml75" name="Rem" id="Rem" cols="40" rows="1" placeholder="비고" autocomplete="off"
                                                      style="height: auto; overflow-y:scroll; resize:none"></textarea>
                                    </li>

                                    <div style="display: block; height: 30px; padding-top: 3px;">
                                        <label for="checkbox" id="checkboxLabel" style="height: 20px;">운반 금액 표시:</label>
                                        <input type="checkbox" id="showHideCheckbox" style="margin-left: 50%; width: 14px; height: 14px;" checked>
                                    </div>
                                    <div class="" id="hiddenPart">
                                        <form method="post" name="frm">
                                            <div>
                                                <ul>
                                                    <li>
                                                        <label>운반 단가</label>
                                                        <span class="content">
                                                                <input type="number" class="wp70 ml75" name="Qtyup" id="Qtyup"
                                                                       placeholder="운반 단가" autocomplete="off">
                                                            </span>
                                                    </li>
                                                    <li>
                                                        <label>운반 총액</label>
                                                        <span class="content">
                                                               <input type="number" class="wp70 ml75" name="totalAmount" id="totalAmount"
                                                                      placeholder="합계" readonly autocomplete="off">

                                                            </span>
                                                    </li>

                                                    <script>
                                                        const checkbox = document.getElementById("showHideCheckbox");
                                                        const hiddenPart = document.getElementById("hiddenPart");
                                                        const checkboxLabel = document.getElementById("checkboxLabel");

                                                        checkbox.addEventListener("change", function() {
                                                            if (checkbox.checked) {
                                                                hiddenPart.style.display = "block";
                                                            } else {
                                                                hiddenPart.style.display = "none";
                                                                checkboxLabel.style.color = "#aaa";
                                                            }
                                                        });
                                                    </script>

                                                    <script>
                                                        <!-- "대수"와 "운반 단가" 입력 요소 가져오기 -->
                                                        const QtyInput = document.getElementById('Qty');
                                                        const QtyupInput = document.getElementById('Qtyup');
                                                        const totalAmountInput = document.getElementById('totalAmount');

                                                        <!-- 입력 값이 변경될 때마다 합계 업데이트 함수 호출 -->
                                                        QtyInput.addEventListener('input', updateTotalAmount);
                                                        QtyupInput.addEventListener('input', updateTotalAmount);

                                                        <!-- 합계 업데이트 함수 -->
                                                        function updateTotalAmount() {
                                                            <!-- "대수"와 "운반 단가" 값을 가져옴 -->
                                                            const Qty = parseFloat(QtyInput.value);
                                                            const unitPrice = parseFloat(QtyupInput.value);

                                                            <!--값이 유효한 경우에만 합계 계산 및 표시-->
                                                            if (!isNaN(Qty) && !isNaN(unitPrice)) {
                                                                <!-- "대수"와 "운반 단가"를 곱하여 소수점 이하 2자리까지 표시 -->
                                                                totalAmountInput.value = Qty * unitPrice;
                                                            } else {
                                                                <!-- 값이 유효하지 않은 경우 합계 입력 상자를 비움 -->
                                                                totalAmountInput.value = '';
                                                            }
                                                        }
                                                    </script>
                                                </ul>
                                            </div>
                                        </form>
                                    </div>
                                </ul>
                                <button id="openPopupButton" class="addBtn" type="button" onclick="$.openLayerHelpMsgPopUp(this, 'W04')">저장</button>
                            </div>
                        </form>
                    </div>
                    <div class="popBtns">
                        <button class="btn btn-white btn-popup" onclick="closePop()">
                            삭제
                        </button>
                        <button class="btn btn-white btn-popup" onclick="closePop()" method="">
                            수정
                        </button>
                        <button class="btn btn-white btn-popup" onclick="$.save();" onkeydown="if(event.keyCode == 13) return false;" style="width: 80px;" method="">
                            저장
                        </button>
                        <button id="closePopupButton" class="btn btn-blue btn-popup" onclick="closePop()">
                            닫기
                        </button>
                    </div>
                </div>
            </div>
        </table>


        <div class="btn-area">
            <button type="button" class="btn btn-white " onclick="$.backMove();">이전화면</button>
            <button type="button" class="btn btn-white ">전체삭제</button>
            <button type="button" class="btn btn-white ">신규등록</button>
            <button type="button" class="btn  btn-blue">제출하기
            </button>
        </div>
    </div>
    </div>



</section>

<script>
    // 비고 사이즈 자동변경 기능
    const lineheight = 25;
    const freetext = document.querySelector('.Rem');

    freetext.oninput = event => {
        const $target = event.target;

        $target.style.height = 0;
        $target.style.height = lineheight + $target.scrollHeight + 'px';
    };

    $('#carSubmitTel').keyup(function (event) {
        event = event || window.event;
        var _val = this.value.trim();
        this.value = autoHypenTel(_val);
    });

    function autoHypenTel(str) {
        str = str.replace(/[^0-9]/g, '');
        var tmp = '';

        // 서울 전화번호일 경우 10자리까지만 나타나고 그 이상의 자리수는 자동삭제
        if (str.length < 4) {
            return str;
        } else if (str.length < 10) {
            tmp += str.substr(0, 4);
            tmp += '-';
            tmp += str.substr(4);
            return tmp;
        }
    }
</script>

<script>
    //    음성인식 API
    // 음성 인식 API를 지원하는지 확인
    if ('SpeechRecognition' in window || 'webkitSpeechRecognition' in window){
        const SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition;

        //Img와 Input 태그 전부 불러옴
        const Images = document.querySelectorAll('.icon_mic');
        const textInput = document.querySelectorAll('.voice');

        //이미지마다 이벤트리스너 연결
        Images.forEach((image,idx) => {
            image.addEventListener('click', () => {
                const recognition = new SpeechRecognition();

                // 음성 인식이 시작될 때 실행되는 이벤트 핸들러
                recognition.onstart = () => {
                    textInput[idx].placeholder = '음성 입력 중...';
                };

                // 음성 인식이 종료될 때 실행되는 이벤트 핸들러
                recognition.onresult = (event) => {
                    const transcript = event.results[0][0].transcript;

                    if transcript === ''
                        textInput[idx].value = transcript;
                    textInput[idx].placeholder = '';
                };

                // 음성인식으로 받은 transcript가 없을 때 placeholder = ""

                // 음성 입력 시작
                recognition.start();
            });
        })

    } else{
        alert("이 브라우저는 음성인식을 지원하지 않습니다.");
    }
</script>

<script>
    // 비고 사이즈 자동변경 기능
    const DEFAULT_HEIGHT = 25;
    const $textarea = document.querySelector('.salesman');

    $textarea.oninput = event => {
        const $target = event.target;

        $target.style.height = 0;
        $target.style.height = DEFAULT_HEIGHT + $target.scrollHeight + 'px';
    };
</script>

<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>