package com.dispatch.dump.commonModule.db.mapper;

import com.dispatch.dump.commonModule.db.dto.DailyReportStep3Main;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep3Sub;

import java.util.List;

public interface DailyReportStep3SubMapper {

    /* FUNCTION ::  등록 */
    int insertTransportInfo(DailyReportStep3Sub DailyReportStep3Sub);

    /* FUNCTION ::  sheetsubSS2 수정 */
    int editBySheetsubSS2(DailyReportStep3Sub dailyReportStep3Sub);


    /* FUNCTION ::  수정 & 삭제를 위한 sheetID2 조회 */
    int findBySheetsubID(int sheetsubID);

    DailyReportStep3Sub findBySheetsubIDAll(int sheetsubID);

    /* FUNCTION ::  수정 */
    int editByTransportInfo(DailyReportStep3Sub dailyReportStep3Sub);

    /* FUNCTION ::  삭제 */
    int deleteByOne(int sheetsubID);

    /* FUNCTION ::  전체삭제 */
    int deleteByTransInfo(DailyReportStep3Main dailyReportStep3Main);
}
