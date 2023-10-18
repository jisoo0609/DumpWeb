package com.dispatch.dump.commonModule.db.dto;

import lombok.Data;

@Data
public class DailyReportStep2Sub {

    private int sheetsubID;

    private String fromsite;         // LINE :: 상차지

    private String item;            // LINE :: 품목

    private double Qty;             // LINE :: 대수

    private double Qtyup;           // LINE :: 단가

    private String Rem;             // LINE :: 비고

    private int SheetID;            // LINE :: tSheet PK

    private int sheetID2;            // LINE :: tSheet_sub FK

    private String tosite;          // LINE :: 하차지

    private int sheetSS2;           // LINE :: 제출처 idx

    private int sheetsubSS2;           // LINE :: 제출처 idx

    private String currStatus;

    private String CarNo;
}
