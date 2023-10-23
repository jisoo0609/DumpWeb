package com.dispatch.dump.commonModule.db.mapper;

import com.dispatch.dump.commonModule.db.dto.DailyReportStep2Main;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep2Sub;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep7CarNo;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep7Sub;

import java.util.List;

public interface DailyReportStep7Mapper {

    int insertCarData(DailyReportStep7CarNo dailyReportStep7CarNo);

    String[] findCarNoList();

    List<DailyReportStep7CarNo> findCarNoByLoginData(DailyReportStep7CarNo dailyReportStep7CarNo);

    int autoDispatchData(DailyReportStep7CarNo dailyReportStep7CarNo);

    int autoDispatchSubDataSub(DailyReportStep7CarNo dailyReportStep7CarNo);

    int updateQtyParentsData (DailyReportStep7Sub dailyReportStep7Sub);

    DailyReportStep7CarNo findMemberChkByUserId(DailyReportStep7CarNo dailyReportStep7CarNo);


}
