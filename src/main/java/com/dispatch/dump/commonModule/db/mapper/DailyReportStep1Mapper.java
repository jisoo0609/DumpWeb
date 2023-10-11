package com.dispatch.dump.commonModule.db.mapper;


import com.dispatch.dump.commonModule.db.dto.*;

import java.util.Date;
import java.util.List;

public interface DailyReportStep1Mapper {

    DailyReportStep1Total selectCalTotal(DailyReportStep1Option option, String uuserID);

    List<DailyReportStep1Sub> selectDispatchSubmitList(String uuserID,String today);

    List<DailyReportStep1Tdrive> selectDispatchTdriveList(String userId);

    List<DailyReportStep1Recruit>selectCarRecruitmentList(String today);



    /*List<DailyReportStep1Main> findDailyReportMainByCarSubmitTel(String uuserID);
    DailyReportStep1Sub findDailyReportMainBySheetID2(long sheetID2);



    List<DailyReportStep1Sub> findJoinDailyReport(String uuserID);
    int findJoinDailyReportForTotalTransportationCost(String uuserID);


    List<DailyReportStep1Tdrive> findJoinTdrive(String uuserID);*/
}
