package com.dispatch.dump.commonModule.db.mapper;

import com.dispatch.dump.commonModule.db.dto.DailyReportStep3Sub;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep7Main;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep7Sub;

public interface DailyReportStep7SubMapper {

    /* FUNCTION ::  등록 */
    int insertDailyReportStep7sub(DailyReportStep7Sub DailyReportStep7Sub);

    DailyReportStep7Sub findSubInfoBySheetSubID(int sheetSubID);
}
