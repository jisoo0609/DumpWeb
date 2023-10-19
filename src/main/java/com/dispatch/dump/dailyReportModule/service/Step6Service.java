package com.dispatch.dump.dailyReportModule.service;

import com.dispatch.dump.commonModule.db.dto.DailyReportStep6;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep6OptionForm;
import com.dispatch.dump.commonModule.db.dto.Login;
import com.dispatch.dump.commonModule.db.mapper.DailyReportStep6Mapper;
import com.dispatch.dump.commonModule.util.CommonUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class Step6Service {

    private final DailyReportStep6Mapper dailyReportStep6Mapper;
    private final CommonUtil commonUtil;

    public Login getSessionLoginData() {
        return (Login) commonUtil.getSession().getAttribute("loginInfo");
    }

    public List<DailyReportStep6> getCarListByOption(DailyReportStep6OptionForm optionForm) {
        optionForm.setCarNo(getSessionLoginData().getUserId());
        System.out.println(dailyReportStep6Mapper.findCarListByOption(optionForm));
        return dailyReportStep6Mapper.findCarListByOption(optionForm);
    }

    public void cancelCarListByOption(DailyReportStep6OptionForm optionForm) {
        optionForm.setCarNo(getSessionLoginData().getUserId());
        dailyReportStep6Mapper.cancelCarListByOption(optionForm);
    }

    public void PayCarListByOption(DailyReportStep6OptionForm optionForm) {
        optionForm.setCarNo(getSessionLoginData().getUserId());
        dailyReportStep6Mapper.PayCarListByOption(optionForm);
    }

}
