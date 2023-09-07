<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<style>
 .search-container {
    display: flex;
    align-items: center;
    width: 100%;
    border: 1px solid #ccc;
    padding: 1px 4px 1px 0;
}

/* Style for the text input */
#search-input {
    flex: 1;
    padding: 2px 5px 2px 5px;
    border: none;
}
.search-button {
    background-color: #0068b7;
    color: #fff;
    padding: 2px 5px 2px 5px;
    cursor: pointer;
}
 </style>

<div id="popSearch" class="popup" style="z-index: 99;">
    <div class="popup-content">
         <div class="search-container" >
             <input type="text" id="search-input" placeholder="거래처 검색">
             <button class="search-button">검색</button>
         </div>
         <div style="border-top: 2px solid #0068b7; margin-top: 5px; padding-top: 5px;">
            <table class="list-table">
                <colgroup>
                    <col width="22%">
                    <col width="22%">
                    <col width="35%">
                    <col width="21%">
                </colgroup>
                <thead style="border-top: 2px solid #ddd;">
                <tr>
                    <th>제출처</th>
                    <th>담당자</th>
                    <th>휴대폰</th>
                    <th></th>
                </tr>
                </thead>

                <tr>
                    <td>기원테크</td>
                    <td>jiji</td>
                    <td>01012344321</td>
                    <td>
                        <button class="addBtn" style="width: 40px; margin-top: 0;">
                            선택
                        </button>
                    </td>
                </tr>

                <tr>
                    <c:forEach var="list" items="${groupList}" varStatus="status">
                        <tr onclick="$.updateData(${list.sheetID}, '${list.carSubmit}')">
                            <td>${list.carSubmit}</td>
                            <td>${list.salesman}</td>
                            <td>${list.carSubmitTel}</td>
                            <td>
                                <button class="btn addBtn" style="width: 40px; margin-top: 0;">
                                    선택
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                </tr>
            </table>

         </div>
        <button class="btn addBtn" onclick="closePopSearch()" >
            나가기
        </button>
    </div>
</div>
