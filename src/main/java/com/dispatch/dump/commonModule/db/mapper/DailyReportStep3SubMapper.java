package com.dispatch.dump.commonModule.db.mapper;

import com.dispatch.dump.commonModule.db.dto.DailyReportStep3Main;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep3Sub;

import java.util.List;

public interface DailyReportStep3SubMapper {

    /* FUNCTION ::  등록 */
    int insertDailyReportSub(DailyReportStep3Sub DailyReportStep3Sub);

    /* FUNCTION ::  삭제를 위한 sheetID2 조회 */
    int selectBySheetSubID(int sheetsubID);

    /* FUNCTION ::  삭제 */
    int deleteByOne(int sheetsubID);
}
