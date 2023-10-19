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
                <input type="hidden" id="parentIdx">
                <table class="list-table">
                    <tr>
                        <th style="width: 25%;">상차지</th>
                        <th style="width: 35%;">하차지</th>
                        <th style="width: 25%;">품목</th>
                        <th style="width: 15%;">대수</th>
                    </tr>
                    <tr>
                        <td style="width: 25%;" id="parent-fromsite">test</td>
                        <td style="width: 35%;" id="parent-tosite">test</td>
                        <td style="width: 25%;" id="parent-item">test</td>
                        <td style="width: 15%;" id="parent-qty">test</td>
                    </tr>
                </table>
            </div>
            <div style="padding: 20px;min-height: auto;box-sizing: border-box; display: flex">
                <input type="text" class="pop-search" style="width: 27%; height: 35px !important;" name="keyword" autocomplete="off">
                <input type="button" class="btn btn-blue" value="검색" style="width: 70px; height: 35px; line-height: 35px; margin: 0;">
                <span style="font-size: 12px; width: 28%; text-align: center; line-height: 35px;">(대수: <span id="view-count"></span> 대)</span>
                <div class="btn-area" style="width: 30%; margin: 0;">
                    <input type="button" class="btn btn-blue" style="width: 80px; height: 35px; line-height: 35px; margin: 0; padding: 0; font-size: 13px;" onclick="$.dispatchData();" value="일괄배차등록">
                </div>

            </div>
            <div style="display: flex; justify-content: space-between; padding: 10px;">
            <div style="min-height: auto;box-sizing: border-box; display: flex; align-items: center; font-size: 12px;">
<%--                <input type="checkbox" id="divisionChk"> 분리배차--%>

            </div>
            <div class="btn-area" style="width: 30%; margin: 0;">
                <input type="button" class="btn btn-blue" style="width: 80px; height: 35px; line-height: 35px; font-weight: 300; font-size: 13px; padding: 0;" onclick="openPopupTest('caraddform');" value="신규차량등록">
            </div>
            </div>
            <div class="popSearch-listWrap unspecifiedFromArea" style="padding-bottom: 60px">
                <%@include file="table_ajax.jsp"%>
            </div>

        </section>
    </div>
</div>

<%@ include file="caradd/pop_form.jsp"%>
