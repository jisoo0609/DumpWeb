package com.dispatch.dump.commonModule.db.mapper;

import com.dispatch.dump.commonModule.db.dto.DailyReportStep6;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep6SelectForm;

import java.util.List;

public interface DailyReportStep6Mapper {
    List<DailyReportStep6> findCarListByOption(DailyReportStep6SelectForm selectForm);
}