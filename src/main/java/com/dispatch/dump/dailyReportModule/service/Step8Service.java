package com.dispatch.dump.dailyReportModule.service;

import com.dispatch.dump.commonModule.db.dto.*;
import com.dispatch.dump.commonModule.db.mapper.DailyReportStep6Mapper;
import com.dispatch.dump.commonModule.db.mapper.DailyReportStep8Mapper;


import com.dispatch.dump.commonModule.util.CommonUtil;

import javax.servlet.http.HttpSession;

import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class Step8Service {

    private final DailyReportStep8Mapper step8Mapper;
    private final CommonUtil commonUtil;

    public Login getSessionLoginData() {
        return (Login) commonUtil.getSession().getAttribute("loginInfo");
    }

    public List<DailyReportStep8> searchReceiptList(DailyReportStep8OptionForm option) {
        option.setCarSubmitTel(getSessionLoginData().getUserId());
        System.out.println(step8Mapper.selectCarListByOption(option));
        return step8Mapper.selectCarListByOption(option);
    }
}
