package com.dispatch.dump.commonModule.db.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class DailyReportStep2Summary {
    double totalTransportationCost; // 총 운반 금액
    double totalTrips; // 총 운반 대수

}
