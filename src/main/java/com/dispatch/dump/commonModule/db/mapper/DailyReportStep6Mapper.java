package com.dispatch.dump.commonModule.db.mapper;

import com.dispatch.dump.commonModule.db.dto.DailyReportStep6;

import java.util.List;

public interface DailyReportStep6Mapper {

    List<DailyReportStep6> findDailyReportSix (String carNo);
}
