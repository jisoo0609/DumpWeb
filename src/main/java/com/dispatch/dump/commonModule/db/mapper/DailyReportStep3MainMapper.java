package com.dispatch.dump.commonModule.db.mapper;

import com.dispatch.dump.commonModule.db.dto.DailyReport;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep3Main;

import java.util.List;

public interface DailyReportStep3MainMapper {

    /* FUNCTION ::  등록 */
    int insertDailyReportMain(DailyReportStep3Main dailyReportStep3Main);

    /* FUNCTION ::  제출처별 리스트 검색 */
    List<DailyReportStep3Main> selectByCarSubmit(DailyReportStep3Main dailyReportStep3Main);
    List<DailyReportStep3Main> selectByCarSubmitTel(DailyReportStep3Main dailyReportStep3Main);
    List<DailyReportStep3Main> selectBySalesman(DailyReportStep3Main dailyReportStep3Main);

    /* FUNCTION ::  삭제를 위한 chk1 조회 */
    Boolean selectBySheetID(int sheetID);

    /*나중에 지울 내용*/
    List<DailyReportStep3Main> findCarsubmitList(DailyReportStep3Main dailyReportStep3Main);
    
    //* FUNCTION :: 제출처 1건 조회 *//
    DailyReportStep3Main findBycarSubmitTel(DailyReportStep3Main dailyReportStep3Main);


    /* FUNCTION :: 일보 리스트 조회(전체조건) */
    DailyReportStep3Main findCarSubmitInfo(DailyReportStep3Main dailyReportStep3Main);


}
