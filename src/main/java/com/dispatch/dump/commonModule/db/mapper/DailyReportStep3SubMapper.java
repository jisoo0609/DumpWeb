package com.dispatch.dump.commonModule.db.mapper;

import com.dispatch.dump.commonModule.db.dto.DailyReportStep3Main;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep3Sub;

import java.util.List;

public interface DailyReportStep3SubMapper {

    /* FUNCTION ::  등록 */
    int insertDailyReportSub(DailyReportStep3Sub DailyReportStep3Sub);

    /*List<DailyReportStep3Sub> findDailyReportSubList(DailyReportStep3Main dailyReportStep3Main);*/

    /* FUNCTION :: 일보 수정 *//*
    int updateDailyReport(DailyReport dailyReport);

    *//* FUNCTION :: 일보 상세보기 *//*
    DailyReport findDailyReportBySheetID(DailyReport dailyReport);

    *//* FUNCTION :: 일보 리스트 조회(전체조건) *//*
    List<DailyReport> findDailyReportList(DailyReport dailyReport);

    *//* FUNCTION :: 일보 리스트 조회 (제출처별) *//*
    List<DailyReport> findDailyReportListByCarSubmit(DailyReport dailyReport);

    int deleteDailyReport(DailyReport dailyReport);*/
}
