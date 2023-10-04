package com.dispatch.dump.commonModule.db.mapper;

import com.dispatch.dump.commonModule.db.dto.*;

import java.util.Date;
import java.util.List;

public interface DailyReportStep1Mapper {

    DailyReportStep1Total selectCalTotal(DailyReportStep1Option option, String userId);

    List<DailyReportStep1Sub> selectDispatchSubmitList(String userId,String today);

    List<DailyReportStep1Tdrive> selectDispatchTdriveList(String userId, String today);



    /*List<DailyReportStep1Main> findDailyReportMainByCarSubmitTel(String uuserID);
    DailyReportStep1Sub findDailyReportMainBySheetID2(long sheetID2);



    List<DailyReportStep1Sub> findJoinDailyReport(String uuserID);
    int findJoinDailyReportForTotalTransportationCost(String uuserID);


    List<DailyReportStep1Tdrive> findJoinTdrive(String uuserID);*/
}
