package com.dispatch.dump.commonModule.db.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class DailyReportStep2Option {

    String carNo;

    String startDate;

    String endDate;

    private Integer sheetSS2;           // LINE :: 제출처 idx

    private Integer sheetsubSS2;         // LINE :: 제출처 idx
}
