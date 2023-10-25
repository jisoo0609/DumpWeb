package com.dispatch.dump.commonModule.db.dto;

import lombok.Data;

@Data
public class DailyReportStep7Sub {

    //tSheetSub 테이블
    private int sheetsubID;
    private String drvDate;
    private int sheetID2;            // LINE :: tSheet FK
    private String fromsite;         // LINE :: 상차지
    private String tosite;           // LINE :: 하차지
    private String item;             // LINE :: 품목
    private double Qty;              // LINE :: 대수
    private Double Qtyup;            // LINE :: 단가
    private String Rem;              // LINE :: 비고
    private int sheetsubSS;          // LINE :: 회원 idx
    private int sheetsubSS2;         // LINE :: 회원 idx
    private int writeridx2;           // LINE :: 작성자 idx

    //thseet 테이블 (차량배차 정보)
    private String carNo;           // LINE :: 차량번호
}
