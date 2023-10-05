package com.dispatch.dump.commonModule.db.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class DailyReportStep1Total {
    double totalTransportationCost; //Line :: 총 운반 금액
    double totalQty;                   //Line :: 총 운행 대수
    String drvDate;         // LINE :: 날짜, 등록일
    double totalUseAmt; // 사용금액

}