package com.dispatch.dump.commonModule.db.dto;

import lombok.Data;

@Data

public class DailyReportStep1Recruit {
    //tSheet_sub 테이블
    private int sheetsubID;
    private String fromsite;         // LINE :: 상차지
    private String item;            // LINE :: 품목
    private double Qty;             // LINE :: 대수
    private double Qtyup;           // LINE :: 단가
    private String Rem;             // LINE :: 비고
    private int sheetID2;            // LINE :: tSheet FK
    private String tosite;          // LINE :: 하차지
    private int sheetsubSS;          // LINE :: 회원 idx


    // tSheet테이블
    public String CarNo;
    private String carSubmit;
    private String date;
    private int sheetID;
    private String carSubmitTel;    // LINE :: 제출처 연락처
    private String salesman;        // LINE :: 제출처 담당자



}
