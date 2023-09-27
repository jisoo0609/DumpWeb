package com.dispatch.dump.commonModule.db.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class DailyReportStep1Total {
    double totalTransportationCost; // 총 운반 금액
    int totalQty;                   //Line :: 총운행대수

}