package com.dispatch.dump.commonModule.db.mapper;

import com.dispatch.dump.commonModule.db.dto.DailyReport;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep3Main;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep7Main;

import java.util.List;

public interface DailyReportStep7MainMapper {

    /* FUNCTION ::  등록 */
    int insertDailyReportStep7(DailyReportStep7Main dailyReportStep7Main);

    /* FUNCTION :: 일보 리스트 조회(전체조건) */
    DailyReportStep7Main findDailyReportMainList(DailyReportStep7Main dailyReportStep7Main);
}
