<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="layerMask dis-n pop-wrap" id="pop-dispatchform" tabindex="0">
    <div class="layerMask__inner" style="height: 95vh; width: 95%">
        <section class="layer-popup" style="height: 100%;">
            <div class="pop-header modal-title" style="padding: 20px 15px;">
                <h3 id="helpMsgTitle">차량배차</h3>

                <button type="button" onclick="closePopUpTest(this);" class="pop-close">
                    <i class="ico-close-b"></i>
                    <span class="offscreen">닫기버튼</span>
                </button>
            </div>
            <div style="min-height: 60px; padding: 10px;">
                <table class="list-table">
                    <tr>
                        <th style="width: 25%;">상차지</th>
                        <th style="width: 25%;">하차지</th>
                        <th style="width: 25%;">품목</th>
                        <th style="width: 25%;">미지정대수</th>
                    </tr>
                    <tr>
                        <td style="width: 25%;">test</td>
                        <td style="width: 25%;">test</td>
                        <td style="width: 25%;">test</td>
                        <td style="width: 25%;">test</td>
                    </tr>
                </table>
            </div>
            <div style="padding: 20px;min-height: auto;box-sizing: border-box; display: flex">
                <input type="text" class="pop-search" style="width: 27%; height: 35px !important;" name="keyword" autocomplete="off">
                <input type="button" class="btn btn-blue" value="검색" style="width: 70px; height: 35px; line-height: 35px; margin: 0;" onclick="$.unspecifiedFormSearch();">
                <span style="font-size: 12px; width: 28%; text-align: center; line-height: 35px;">(대수: <span id="view-count"></span> 대)</span>
                <div class="btn-area" style="width: 30%; margin: 0;">
                    <input type="button" class="btn btn-blue" style="width: 70px; height: 35px; line-height: 35px; margin: 0;" onclick="alert('개발 중 입니다.')" value="차량배차">
                </div>

            </div>
            <div style="display: flex; justify-content: space-between;">
            <div style="padding: 20px;min-height: auto;box-sizing: border-box; display: flex;">
                <input type="checkbox" id="divisionChk"> 분리배차

            </div>
            <div class="btn-area" style="width: 30%; margin: 0;">
                <input type="button" class="btn btn-blue" style="width: 70px; height: 35px; line-height: 35px;" onclick="openPopupTest('caraddform');" value="차량등록">
            </div>
            </div>
            <div class="popSearch-listWrap unspecifiedFromArea" style="padding-bottom: 60px">
                <%@include file="table_ajax.jsp"%>
            </div>

        </section>
    </div>
</div>

<%@ include file="caradd/pop_form.jsp"%>
