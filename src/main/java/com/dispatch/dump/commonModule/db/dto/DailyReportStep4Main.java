package com.dispatch.dump.commonModule.db.dto;

import lombok.Data;

@Data
public class DailyReportStep4Main {

    private int sheetID;
    private String CarNo;           // LINE :: 차량번호
    private String carSubmit;       // LINE :: 제출처
    private String date;            // LINE :: 운행일

}
