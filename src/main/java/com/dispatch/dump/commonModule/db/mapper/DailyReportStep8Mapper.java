package com.dispatch.dump.commonModule.db.mapper;

import com.dispatch.dump.commonModule.db.dto.DailyReportStep8;
//import com.dispatch.dump.commonModule.db.dto.DailyReportStep8Main;
//import com.dispatch.dump.commonModule.db.dto.DailyReportStep8Sub;


import java.util.List;

public interface DailyReportStep8Mapper {


    /* FUNCTION :: 요약 내용보기 */
    List<DailyReportStep8> searchReceipts(String userId);

    List<DailyReportStep8> searchReceiptsWithCnt(String userId);

    List<DailyReportStep8> receiptsSearchCondition(DailyReportStep8 dailyReportStep8);

    List<DailyReportStep8> receiptsSearchConditionWithCnt(DailyReportStep8 dailyReportStep8);

}
