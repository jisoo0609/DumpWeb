package com.dispatch.dump.commonModule.db.mapper;

import com.dispatch.dump.commonModule.db.dto.DailyReportStep5;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep6;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep6OptionForm;

import java.util.List;

public interface DailyReportStep5Mapper {

    /* FUNCTION ::  등록 */
    void insertDailyReportStep5(DailyReportStep5 dailyReportStep5);
    void updateDailyReportStep5(DailyReportStep5 dailyReportStep5);

    List<DailyReportStep5> findCarListByDate(String userID,String date);

}
