package com.dispatch.dump.commonModule.db.mapper;

import com.dispatch.dump.commonModule.db.dto.DailyReportStep8Main;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep8Sub;


import java.util.List;

public interface DailyReportStep8Mapper {


    /* FUNCTION :: 요약 내용보기 */
    List<DailyReportStep8Main> searchReceiptsMainByCarSubmitTel(String userId);

    DailyReportStep8Sub searchReceiptsMainBySheetID2(long sheetID2);

}
