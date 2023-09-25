// DailyReportStep4Mapper.java
package com.dispatch.dump.commonModule.db.mapper;


import com.dispatch.dump.commonModule.db.dto.DailyReportStep4;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep4OptionForm;

import java.util.List;

public interface DailyReportStep4Mapper {
    List<DailyReportStep4> getDailyReportByCarNo(String carNo);
    List<DailyReportStep4> getTotalTransportAmount(String carNo);

    List<DailyReportStep4> findCarListByOption(DailyReportStep4OptionForm optionForm);
}