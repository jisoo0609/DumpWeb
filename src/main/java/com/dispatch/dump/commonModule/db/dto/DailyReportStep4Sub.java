package com.dispatch.dump.commonModule.db.dto;

import lombok.Data;

@Data
public class DailyReportStep4Sub {

    private int sheetsubID;
    private String fromsite;         // LINE :: 상차지
    private String item;            // LINE :: 품목
    private double Qty;             // LINE :: 대수
    private int sheetID2;            // LINE :: tSheet FK
    private String tosite;          // LINE :: 하차지
}
