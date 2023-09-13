package com.dispatch.dump.commonModule.db.mapper;

import com.dispatch.dump.commonModule.db.dto.DailyReportStep6;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DailyReportStep6Mapper {

    List<DailyReportStep6> findDailyReportSix (String carNo);
    List<DailyReportStep6> findDailyReportClub(String carNo, String drvClub);

}
