package com.dispatch.dump.commonModule.db.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class DailyReportStep8OptionForm {

    private String carSubmitTel;
    private String searchStartDate;
    private String searchEndDate;
    private String fromsite;
    private String tosite;
    private String item;
    private  String CarNo;
    private  String searchType;

}
