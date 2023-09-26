package com.dispatch.dump.commonModule.db.mapper;

import com.dispatch.dump.commonModule.db.dto.DailyReportStep6;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep6OptionForm;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface DailyReportStep6Mapper {
    List<DailyReportStep6> findCarListByOption(DailyReportStep6OptionForm optionForm);

    void cancelCarListByOption(DailyReportStep6OptionForm optionForm);


    void PayCarListByOption(DailyReportStep6OptionForm optionForm);
}