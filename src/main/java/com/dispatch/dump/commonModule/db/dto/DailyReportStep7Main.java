package com.dispatch.dump.commonModule.db.dto;

import lombok.Data;

import java.util.Date;

@Data
public class DailyReportStep7Main {

    //tSheet 테이블
    private int sheetID;
    private String carNo;           // LINE :: 차량번호
    private String date;            // LINE :: 운행일
    private String carSubmit;       // LINE :: 제출처
    private String carSubmitTel;    // LINE :: 제출처 연락처
    private String salesman;        // LINE :: 제출처 담당자
    private Boolean chk1;           // LINE :: 결재여부
    private int sheetSS;            // LINE :: 회원 idx
    private int sheetSS2;           // LINE :: 회원 idx
    private String currStatus;      // LINE :: 배차현황
    private int writerIDX;          // LINE :: 회원 idx

}
