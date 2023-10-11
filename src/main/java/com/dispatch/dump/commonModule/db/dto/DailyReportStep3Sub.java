package com.dispatch.dump.commonModule.db.dto;

import lombok.Data;

@Data
public class DailyReportStep3Sub {

    //tSheet_sub테이블
    private int sheetsubID;
    private String fromsite;         // LINE :: 상차지
    private String item;             // LINE :: 품목
    private double Qty;              // LINE :: 대수
    private Double Qtyup;            // LINE :: 단가, * null값을 받기 위해 dataType double이 아닌 Double객체로 설정
    private String Rem;              // LINE :: 비고
    private int sheetID2;            // LINE :: tSheet FK
    private String tosite;           // LINE :: 하차지
    private int sheetsubSS;          // LINE :: 회원 idx
    private int sheetsubSS2;         // LINE :: 제출처 idx
    private int writeridx2;          // LINE :: 작성자 idx

}
