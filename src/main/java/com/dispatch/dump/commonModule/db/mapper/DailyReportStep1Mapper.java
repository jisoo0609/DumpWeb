package com.dispatch.dump.commonModule.db.mapper;


import com.dispatch.dump.commonModule.db.dto.*;


import java.util.List;

public interface DailyReportStep1Mapper {

    DailyReportStep1Total selectCalTotal(DailyReportStep1Option option, String uuserID);

    List<DailyReportStep1Sub> selectDispatchSubmitList(String uuserID,String today);

    List<DailyReportStep1Tdrive> selectDispatchTdriveList(String userId);




}
