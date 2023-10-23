package com.dispatch.dump.commonModule.db.dto;

import lombok.Data;

@Data
public class DailyReportStep1Sub {
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
    private int sheetsubSS2;         // LINE :: 제출처 idx
    private int writeridx2;          // LINE :: 작성자 idx


    // tSheet테이블 : 차량번호
    public String CarNo;
    private String carSubmit;
    private int sheetID;
    private int sheetSS;            // LINE :: 회원 idx
    private int writerIDX;
    private String CurrStatus;      // LINE :: 배차상태
    private int sheetSS2;           // LINE :: 제출처 idx


/*

    double totalTransportationCost; //Line :: 총 운반 금액
    double totalQty;                   //Line :: 총 운행 대수
*/




}
