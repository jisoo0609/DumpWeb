package com.dispatch.dump.commonModule.db.mapper;

import com.dispatch.dump.commonModule.db.dto.DailyReportStep6;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DailyReportStep6Mapper {

    List<DailyReportStep6> findCarListByDate (String carNo);
    List<DailyReportStep6> findCarListByItem(String carNo, String selectOption);

}
