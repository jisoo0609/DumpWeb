package com.dispatch.dump.commonModule.db.mapper;

import com.dispatch.dump.commonModule.db.dto.DailyReportStep2Main;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep2Sub;


import java.util.List;

public interface DailyReportStep2Mapper {

    /* FUNCTION :: 순수 db값을 불러와 나머지 연산 BE에서 처리 */
    List<DailyReportStep2Main> findDailyReportMainByCarSubmitTel(String userId);
    DailyReportStep2Sub findDailyReportMainBySheetID2(long sheetID2);



    /* FUNCTION :: sql에서 전체 연산 처리 */
    List<DailyReportStep2Sub> findJoinDailyReport(String userId);

    int findJoinDailyReportForTotalTransportationCost(String userId);


}
