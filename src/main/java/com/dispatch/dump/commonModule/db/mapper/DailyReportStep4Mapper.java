// DailyReportStep4Mapper.java
package com.dispatch.dump.commonModule.db.mapper;

import com.dispatch.dump.commonModule.db.dto.DailyReportStep4Main;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep4Sub;

import java.util.List;

public interface DailyReportStep4Mapper {
    List<DailyReportStep4Main> getDailyReportByCarNo(String carNo);
    DailyReportStep4Sub getDailyReportMainBySheetID2(long sheetID2);
}