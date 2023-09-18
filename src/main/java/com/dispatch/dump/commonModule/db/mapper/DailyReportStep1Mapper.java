package com.dispatch.dump.commonModule.db.mapper;

import com.dispatch.dump.commonModule.db.dto.DailyReportStep1Main;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep1Sub;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep2Sub;

import java.util.List;

public interface DailyReportStep1Mapper {

    List<DailyReportStep1Main> findDailyReportMainByCarSubmitTel(String userId);
    DailyReportStep1Sub findDailyReportMainBySheetID2(long sheetID2);



    List<DailyReportStep1Main> findJoinDailyReport(String userId);
    int findJoinDailyReportForTotalTransportationCost(String userId);

}
