package com.dispatch.dump.commonModule.db.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class DailyReportStep4OptionForm {
    String carNo;
    String fromDate;
    String toDate;
    String club;
    String fromSite;
    String toSite;
    String item;
    String tel;
    Boolean state;
}
