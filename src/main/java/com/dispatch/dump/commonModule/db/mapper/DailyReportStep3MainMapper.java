package com.dispatch.dump.commonModule.db.mapper;

import com.dispatch.dump.commonModule.db.dto.DailyReport;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep3Main;

import java.util.List;

public interface DailyReportStep3MainMapper {

    /* FUNCTION ::  등록 */
    int insertCarSubmitInfo(DailyReportStep3Main dailyReportStep3Main);

    /* FUNCTION ::  제출처별 리스트 검색 */
    List<DailyReportStep3Main> findByCarSubmit(DailyReportStep3Main dailyReportStep3Main);
    List<DailyReportStep3Main> findByCarSubmitTel(DailyReportStep3Main dailyReportStep3Main);
    List<DailyReportStep3Main> findBySalesman(DailyReportStep3Main dailyReportStep3Main);

    /* FUNCTION ::  제출처 정보 수정 */
    int editByCarSubmit(DailyReportStep3Main dailyReportStep3Main);

    /* FUNCTION ::  삭제를 위한 chk1 조회 */
    Boolean findBySheetID(int sheetID);

    /* FUNCTION :: 일보 리스트 조회(전체조건) */
    DailyReportStep3Main findCarSubmitInfo(DailyReportStep3Main dailyReportStep3Main);


}
