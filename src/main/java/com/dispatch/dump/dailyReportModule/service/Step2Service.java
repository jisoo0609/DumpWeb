package com.dispatch.dump.dailyReportModule.service;

import com.dispatch.dump.commonModule.db.dto.*;
import com.dispatch.dump.commonModule.db.mapper.DailyReportStep2Mapper;
import com.dispatch.dump.commonModule.util.CommonUtil;

import javax.servlet.http.HttpSession;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
@RequiredArgsConstructor
public class Step2Service {
    private final DailyReportStep2Mapper dailyReportStep2Mapper;
    private final CommonUtil commonUtil;

    public Login getSessionLoginData() {
        return (Login) commonUtil.getSession().getAttribute("loginInfo");
    }

    public String getToday(){
        SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date(System.currentTimeMillis());

        return formatter.format(date);
    }

    public DailyReportStep2Summary findCalSummary(DailyReportStep2Option option) {
        return dailyReportStep2Mapper.selectCalSummary(option, getSessionLoginData().getUserId());
    }

    public List<DailyReportStep2Sub> findDispatchStatusList() {
        System.out.println( dailyReportStep2Mapper.selectDispatchStatusList(getSessionLoginData().getUserId(),getToday()));
        return dailyReportStep2Mapper.selectDispatchStatusList(getSessionLoginData().getUserId(),getToday());
    }


}
