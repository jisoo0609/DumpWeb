package com.dispatch.dump.commonModule.db.dto;

import lombok.Data;

@Data
public class DailyReportStep7CarNo {

    //tSheetCarNo 테이블
    private int carNoID;
    private int carNoKey;
    private String carNoFull;
    private String carNoHp;
    private String carNoName;
    private int carNoSS;
    private int carNoSS2;
    
    //VO
    private int parentID;       // LINE :: 미지정 배차주문 부모 IDX
    private int subID;          // LINE :: 미지정 배차주문 IDX
    private int carQty;         // LINE :: 배차수량

}
