package com.dispatch.dump.commonModule.db.dto;
import lombok.Data;

import java.util.Date;

@Data
public class DailyReportStep6 {

    private int driveID; //테이블 인덱스 번호
    private String carNo; //차량번호
    private String drvClub; //구분(주유,정비등)
    private String drvDate; //날짜
    private long lastKm; //최종주행거리
    private long useAmt; //사용금액
    private String useOil; //주유량,요소수량
    private String drvRem; //비고
    private Boolean chk2; //결제체크
    private Date repDate; //등록시간
    private int repaddkm; //교환주행거리
    private Date rependdate; //교환예정일
    private Boolean rependchk; //교환확인체크

}
