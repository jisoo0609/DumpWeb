package com.dispatch.dump.commonModule.db.dto;
import lombok.Data;

import java.util.Date;

@Data
public class DailyReportStep6 {

    private int driveID; //테이블 인덱스 번호
    private String carNo; //차량번호
    private Date datetime;
    private String drvDate; //날짜
    private int lastKm; //구분(주유,정비등)
    private int useAmt; //사용금액
    private int useOil; //주유,요소수량
    private String drvRem; //비고
    private Boolean ck2;
    private Date repDate;
    private int repaddkm;
    private Date rependdate;
    private Boolean rependchk;

}
