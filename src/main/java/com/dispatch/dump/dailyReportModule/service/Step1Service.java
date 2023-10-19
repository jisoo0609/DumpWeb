package com.dispatch.dump.dailyReportModule.service;

import com.dispatch.dump.commonModule.db.dto.*;
import com.dispatch.dump.commonModule.db.mapper.DailyReportStep1SubMapper;
import com.dispatch.dump.commonModule.util.CommonUtil;
import com.dispatch.dump.commonModule.db.mapper.DailyReportStep1Mapper;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;

import java.util.Date;
import java.util.List;

@Service
@RequiredArgsConstructor
public class Step1Service {
    private final DailyReportStep1Mapper dailyReportStep1Mapper;
    private final DailyReportStep1SubMapper dailyReportStep1SubMapper;
    private final CommonUtil commonUtil;


    //login 정보 가져오기
    public Login getSessionLoginData() {
        return (Login) commonUtil.getSession().getAttribute("loginInfo");
    }

    public String getToday(){
        SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date(System.currentTimeMillis());

        return formatter.format(date);
    }

    public DailyReportStep1Total findCalTotal(DailyReportStep1Option option) {
        return dailyReportStep1Mapper.selectCalTotal(option, getSessionLoginData().getUuserID());
    }


    public List<DailyReportStep1Sub> findDispatchSubmitList() {
        System.out.println( dailyReportStep1Mapper.selectDispatchSubmitList(getSessionLoginData().getUuserID(),getToday()));
        return dailyReportStep1Mapper.selectDispatchSubmitList(getSessionLoginData().getUuserID(),getToday());
    }

    public List<DailyReportStep1Tdrive> findDispatchTdriveList() {
        System.out.println( dailyReportStep1Mapper.selectDispatchTdriveList(getSessionLoginData().getUserId()));
        return dailyReportStep1Mapper.selectDispatchTdriveList(getSessionLoginData().getUserId());
    }

    public List<DailyReportStep1Recruit> findCarRecruitmentList() {
        System.out.println( dailyReportStep1SubMapper.selectCarRecruitmentList(getToday()));
        return dailyReportStep1SubMapper.selectCarRecruitmentList(getToday());
    }







}

