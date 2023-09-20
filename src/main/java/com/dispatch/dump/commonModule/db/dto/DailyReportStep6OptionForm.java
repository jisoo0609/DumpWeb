package com.dispatch.dump.commonModule.db.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class DailyReportStep6OptionForm {
    String carNo;
    String startDate;
    String endDate;
    String selectOption;
    String searchType;
}
