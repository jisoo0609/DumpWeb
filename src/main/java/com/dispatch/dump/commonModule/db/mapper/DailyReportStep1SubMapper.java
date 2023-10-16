package com.dispatch.dump.commonModule.db.mapper;


import com.dispatch.dump.commonModule.db.dto.DailyReportStep1Recruit;

import java.util.List;

public interface DailyReportStep1SubMapper {
    List<DailyReportStep1Recruit>selectCarRecruitmentList(String today);
}
