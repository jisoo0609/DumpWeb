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
    private String carNo;

    private String sortingCriteria;

    //VO
    private String carSubmitTel;
}
