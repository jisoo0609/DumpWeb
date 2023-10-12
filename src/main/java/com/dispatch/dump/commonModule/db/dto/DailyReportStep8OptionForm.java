package com.dispatch.dump.commonModule.db.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class DailyReportStep8OptionForm {


    private String startDate;
    private String endDate;

    private String fromsite;
    private String tosite;
    private String item;
    private String CarNo;

    private String sortingCriteria;

    private Integer sheetSS;            // LINE :: 회원 idx
    private Integer sheetSS2;           // LINE :: 제출처 idx
    private Integer writerIDX;          // LINE :: 작성자 idx


    private Integer sheetsubSS;          // LINE :: 회원 idx
    private Integer sheetsubSS2;         // LINE :: 제출처 idx
    private Integer writeridx2;          // LINE :: 작성자 idx

    //VO
    private String carSubmitTel;
}
