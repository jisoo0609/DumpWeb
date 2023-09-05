package com.dispatch.dump.commonModule.db.mapper;

import com.dispatch.dump.commonModule.db.dto.DailyReportMain;

import java.util.List;

public interface DailyReportMainMapper {

    /* FUNCTION ::  등록 */
    int insertDailyReportMain(DailyReportMain dailyReportMain);

    List<DailyReportMain> findJoinDailyReportList(DailyReportMain dailyReportMain);

    /* FUNCTION :: 일보 수정 *//*
    int updateDailyReport(DailyReport dailyReport);

    *//* FUNCTION :: 일보 상세보기 *//*
    DailyReport findDailyReportBySheetID(DailyReport dailyReport);

    /* FUNCTION :: 일보 리스트 조회(전체조건) */
    List<DailyReportMain> findDailyReportList(DailyReportMain dailyReportMain);

    //* FUNCTION :: 일보 리스트 조회 (제출처별) *//
/*    List<DailyReport> findDailyReportListByCarSubmit(DailyReport dailyReport);

    int deleteDailyReport(DailyReport dailyReport);*/
}
