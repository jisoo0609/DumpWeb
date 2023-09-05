<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<div class="layerMask dis-n pop-wrap" id="pop-question" tabindex="0">
    <div class="layerMask__inner" style="min-height: 50px">
        <section class="layer-popup" style="min-height: 50px;">
            <div class="pop-header modal-title">
                <h3 id="helpMsgTitle">여기에 물어보기<%--도움말 (코드)--%></h3>

                <button type="button" onclick="$.closeLayerHelpMsgPopUp(this);" class="pop-close">
                    <i class="ico-close-b"></i>
                    <span class="offscreen">닫기버튼</span>
                </button>
            </div>

            <div id="pop-inform"style="padding: 20px 15px;overflow-y: scroll;min-height: 50px; max-height: 450px;">
                <pre style="white-space: break-spaces; font-family: 'NotoSansKR' !important;" id="helpMsgBody"></pre>
                내용을 여기에 쓰면 되나?
            </div>
        </section>
    </div>
</div>
