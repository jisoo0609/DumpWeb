package com.dispatch.dump.dailyReportModule.service;

import com.dispatch.dump.commonModule.db.dto.DailyReportStep6;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep6SelectForm;
import com.dispatch.dump.commonModule.db.dto.Login;
import com.dispatch.dump.commonModule.db.mapper.DailyReportStep6Mapper;
import com.dispatch.dump.commonModule.util.CommonUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class Step6Service {

    private final DailyReportStep6Mapper dailyReportStep6Mapper;
    private final CommonUtil commonUtil;

    public Login getSessionLoginData() {
        return (Login) commonUtil.getSession().getAttribute("loginInfo");
    }

    public List<DailyReportStep6> getCarListByOption(DailyReportStep6SelectForm selectForm) {
        selectForm.setCarNo(getSessionLoginData().getUserId());
        return dailyReportStep6Mapper.findCarListByOption(selectForm);
    }

}