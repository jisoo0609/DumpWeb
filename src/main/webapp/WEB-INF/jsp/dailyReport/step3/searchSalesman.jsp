<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<div id="salesmanBox" class="hidden" >
    <table class="droptable" >
       <colgroup>
            <col width="25%">
            <col width="25%">
            <col width="35%">
            <col width="10%">
       </colgroup>
       <thead>
            <tr>
                <th>담당자</th>
                <th>제출처</th>
                <th>휴대폰</th>
                <th><button type="button" class="autoCloseBtn" onclick="hideSalesmanBox()">
                    <img src="/resources/image/icons/ico_close.png" alt="닫기" style="height: 15px;" /></button>
                </th>
            </tr>
       </thead>
       <tbody id="salesList" class="hiddenDrop">
       </tbody>
    </table>
</div>