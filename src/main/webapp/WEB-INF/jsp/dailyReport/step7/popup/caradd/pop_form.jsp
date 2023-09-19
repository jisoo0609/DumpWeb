<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="layerMask dis-n pop-wrap" id="pop-caraddform" tabindex="0">
  <div class="layerMask__inner" style="height: 75vh; width: 95%">
    <section class="layer-popup" style="height: 100%;">
      <div class="pop-header modal-title" style="padding: 20px 15px;">
        <h3 id="helpMsgTitle"><%--도움말 (코드)--%>차량등록</h3>

        <button type="button" onclick="closePopUpTest(this);" class="pop-close">
          <i class="ico-close-b"></i>
          <span class="offscreen">닫기버튼</span>
        </button>
      </div>
      <div class="popSearch-listWrap unspecifiedFromArea" style="padding-bottom: 60px">
        <table class="popSearch-list list33">
          <colgroup>
            <col style="width: 17%">
            <col style="width: 33%">
            <col style="width: 33%">
            <col style="width: 17%">
          </colgroup>
          <tr>
            <th>차량번호</th>
            <th>전체 차량번호</th>
            <th>휴대폰 번호</th>
            <th>기사명</th>
          </tr>
          <tr>
            <td class="a-center"><input type="text" style="width: 100%;" name="carNoKey"></td>
            <td class="a-center"><input type="text" style="width: 100%;" name="carNoFull"></td>
            <td class="a-center"><input type="text" style="width: 100%;" name="carNoHp"></td>
            <td class="a-center"><input type="text" style="width: 100%;" name="carNoName"></td>
          </tr>
        </table>
        <div class="btn-area">
            <input type="button" class="btn btn-blue" value="등록">
            <input type="button" class="btn btn-white" value="닫기" onclick="closePopUpTest(this);">
        </div>
      </div>


    </section>
  </div>
</div>
