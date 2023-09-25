package com.dispatch.dump.commonModule.db.dto;

import lombok.Data;

@Data
public class DailyReportStep4 {

    // tSheet
    private int sheetID;
    private String CarNo;           // LINE :: 차량번호
    private String carSubmit;       // LINE :: 제출처
    private String carSubmitTel;    // LINE :: 제출처 연락처
    private String date;            // LINE :: 운행일
    private String CurrStatus;      // LINE :: 진행상태
    private Boolean chk1;           // LINE :: 결재여부


    // tSheet_sub
    private int sheetsubID;
    private String fromsite;         // LINE :: 상차지
    private String item;            // LINE :: 품목
    private int Qty;             // LINE :: 대수
    private int Qtyup;           // LINE :: 단가
    private int sheetID2;            // LINE :: tSheet FK
    private String tosite;          // LINE :: 하차지
}
