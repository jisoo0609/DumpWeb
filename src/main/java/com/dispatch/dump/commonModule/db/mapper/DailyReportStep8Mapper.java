package com.dispatch.dump.commonModule.db.mapper;

import com.dispatch.dump.commonModule.db.dto.DailyReportStep8;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep8OptionForm;
import org.apache.ibatis.annotations.Mapper;
//import com.dispatch.dump.commonModule.db.dto.DailyReportStep8Main;
//import com.dispatch.dump.commonModule.db.dto.DailyReportStep8Sub;


import java.util.List;

@Mapper
public interface DailyReportStep8Mapper {

    List<DailyReportStep8> selectReceiptsByOption(DailyReportStep8OptionForm option);

    List<DailyReportStep8> getSelectBoxData(DailyReportStep8OptionForm option);
}
