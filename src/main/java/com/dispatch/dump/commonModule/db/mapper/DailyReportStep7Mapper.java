package com.dispatch.dump.commonModule.db.mapper;

import com.dispatch.dump.commonModule.db.dto.DailyReportStep2Main;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep2Sub;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep7CarNo;

import java.util.List;

public interface DailyReportStep7Mapper {

    int insertCarData(DailyReportStep7CarNo dailyReportStep7CarNo);

    String[] findCarNoList();

    List<DailyReportStep7CarNo> findCarNoByLoginData(DailyReportStep7CarNo dailyReportStep7CarNo);


}
