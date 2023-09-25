<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="e" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<table class="popSearch-list list33" style="font-size: 12px;">
    <colgroup>
        <col style="width: 8%">
        <col style="width: 18%">
        <col style="width: 22%">
        <col style="width: 28%">
        <col style="width: 13%">
        <col style="width: 11%">
    </colgroup>
    <tr>
        <th><input type="checkbox" id="batchChk" onchange="$.batchSelectCarNo(this);"></th>
        <th>차량번호</th>
        <th>전체 차량번호</th>
        <th>휴대폰 번호</th>
        <th>기사명</th>
        <th>대수</th>
    </tr>
<%--    <c:forEach var="list" items="${carNoList}">--%>
<%--        <c:set var="carNoChk" value=""></c:set>--%>
<%--        <c:forEach var="carNo" items="${carNoArr}">--%>
<%--            <c:if test="${carNo eq list.carNo}">--%>
<%--                <c:set var="carNoChk" value="checked"></c:set>--%>
<%--            </c:if>--%>
<%--        </c:forEach>--%>
<%--        <tr style="${trStyle}">--%>
<%--            <td class="a-center">--%>
<%--                <input type="checkbox" class="enableYN" onchange="$.selectCarNo(this, '${list.carNo}')" ${carNoChk}>--%>
<%--            </td>--%>
<%--            <td class="a-center carList" id="unspecified-carNo" style="padding-left: 15px; font-size: 14px; text-align: left;">${list.carNo}</td>--%>
<%--            <td class="a-center" style="font-size: 14px;"><input type="text" id="unspecified-qty" class="a-center wp100" style="background: #ccc;" value="1" onchange="$.saveQtyTemp('${list.carNo}', this);" autocomplete="off" disabled></td>--%>
<%--        </tr>--%>
<%--    </c:forEach>--%>
    <tr>

        <td class="a-center"><input type="checkbox" class="enableYN" onchange="$.selectCarNo(this, '4444')"></td>
        <td class="a-left">4444</td>
        <td class="a-center">43테4444</td>
        <td class="a-center">010-0000-0000</td>
        <td class="a-center">김준형</td>
        <td class="a-center"><input type="text" value="1" class="a-center wp100" style="background: #ccc; padding: 0;" disabled></td>
    </tr>

</table>