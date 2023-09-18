package com.dispatch.dump.commonModule.db.mapper;

import com.dispatch.dump.commonModule.db.dto.DailyReport;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep3Main;

import java.util.List;

public interface DailyReportStep3MainMapper {

    /* FUNCTION ::  등록 */
    int insertDailyReportMain(DailyReportStep3Main dailyReportStep3Main);

    /* FUNCTION ::  제출처 리스트 검색 */
    List<DailyReportStep3Main> findCarsubmitList(DailyReportStep3Main dailyReportStep3Main);
    /*DailyReportStep3Main findJoinDailyReportList(DailyReportStep3Main dailyReportStep3Main);*/

    //* FUNCTION :: 제출처 1건 조회 *//
    DailyReportStep3Main findBycarSubmitTel(DailyReportStep3Main dailyReportStep3Main);

    /* FUNCTION :: 일보 수정 *//*
    int updateDailyReport(DailyReport dailyReport);

    *//* FUNCTION :: 일보 상세보기 *//*
    DailyReport findDailyReportBySheetID(DailyReport dailyReport);

    /* FUNCTION :: 일보 리스트 조회(전체조건) */
    DailyReportStep3Main findDailyReportMainList(DailyReportStep3Main dailyReportStep3Main);



    int deleteDailyReport(DailyReport dailyReport);
}
