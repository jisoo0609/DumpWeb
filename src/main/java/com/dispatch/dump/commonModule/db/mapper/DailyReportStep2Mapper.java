package com.dispatch.dump.commonModule.db.mapper;

import com.dispatch.dump.commonModule.db.dto.DailyReportStep2Option;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep2Sub;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep2Summary;


import java.util.List;

public interface DailyReportStep2Mapper {
    DailyReportStep2Summary selectCalSummary(DailyReportStep2Option option);
    List<DailyReportStep2Sub> selectDispatchStatusList(String uuserID, String today);

    List<DailyReportStep2Sub> submittedReportList(String uuserID, String today);

    List<DailyReportStep2Sub> recruitmentReportList(String uuserID, String today);

}