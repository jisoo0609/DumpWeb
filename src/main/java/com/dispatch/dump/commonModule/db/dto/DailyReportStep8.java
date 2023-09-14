package com.dispatch.dump.commonModule.db.dto;

import lombok.Data;

@Data
public class DailyReportStep8 {
    // tSheet 테이블
    private int sheetID;
    private String CarNo;           // LINE :: 차량번호
    private String carSubmit;       // LINE :: 제출처
    private String carSubmitTel;    // LINE :: 제출처 연락처
    private Boolean chk1;           // LINE :: 결재여부
    private String date;            // LINE :: 운행일
    private String salesman;        // LINE :: 제출처 담당자

    //tSheet_sub테이블
    private int sheetsubID;
    private String fromsite;         // LINE :: 상차지
    private String item;            // LINE :: 품목
    private double Qty;             // LINE :: 대수
    private double Qtyup;           // LINE :: 단가
    private String Rem;             // LINE :: 비고
    private int sheetID2;            // LINE :: tSheet FK
    private String tosite;          // LINE :: 하차지

    //cnt추가
    private String totalData;

    // VO
    //private long idx;
}
