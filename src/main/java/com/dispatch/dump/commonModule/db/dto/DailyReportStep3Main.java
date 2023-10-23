package com.dispatch.dump.commonModule.db.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;


@Data
public class DailyReportStep3Main {

    // tSheet 테이블
    private int sheetID;
    private String CarNo;           // LINE :: 차량번호
    private String carSubmit;       // LINE :: 제출처
    private String carSubmitTel;    // LINE :: 제출처 연락처
    private boolean chk1;           // LINE :: 결재여부
    private boolean chk2;           // LINE :: 제출처 결재여부
    private String date;            // LINE :: 운행일
    private String salesman;        // LINE :: 제출처 담당자
    private int sheetSS;            // LINE :: 회원 idx
    private int sheetSS2;           // LINE :: 제출처 idx
    private int writerIDX;          // LINE :: 작성자 idx
    private String CurrStatus;      // LINE :: 배차상태

    private int UuserID;

    private List<DailyReportStep3Sub> dailyReportStep3SubList;//mybatis의 collection에 사용
    
    private MultipartFile imageFile;    // LINE :: 전표이미지 파일

    // VO
    //private long idx;
}
