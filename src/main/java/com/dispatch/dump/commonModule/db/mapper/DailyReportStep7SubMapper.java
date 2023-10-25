package com.dispatch.dump.commonModule.db.mapper;

import com.dispatch.dump.commonModule.db.dto.DailyReportStep3Sub;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep7Main;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep7Sub;

public interface DailyReportStep7SubMapper {

    /* FUNCTION ::  등록 */
    int insertDailyReportStep7sub(DailyReportStep7Sub DailyReportStep7Sub);

    /* FUNCTION ::  수정 & 삭제를 위한 sheetID2 조회 */
    int findBySheetsubID(int sheetsubID);

    /* FUNCTION ::  삭제 */
    int deleteByOne(DailyReportStep7Sub dailyReportStep7Sub);

    DailyReportStep7Sub findSubInfoBySheetSubID(int sheetsubID);

    int editSubmitInfo(DailyReportStep7Sub DailyReportStep7Sub);
}
