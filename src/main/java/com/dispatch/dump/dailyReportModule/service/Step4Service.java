package com.dispatch.dump.dailyReportModule.service;

import com.dispatch.dump.commonModule.db.dto.DailyReportStep4;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep4OptionForm;
import com.dispatch.dump.commonModule.db.dto.Login;
import com.dispatch.dump.commonModule.db.mapper.DailyReportStep4Mapper;
import com.dispatch.dump.commonModule.util.CommonUtil;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class Step4Service {

    private final DailyReportStep4Mapper dailyReportStep4Mapper;
    private final CommonUtil commonUtil;

//    login 정보
    public Login getSessionLoginData() {
        return (Login) commonUtil.getSession().getAttribute("loginInfo");
    }

//
    public List<DailyReportStep4> getSummary() {
        // login id와 tSheet의 CarNo가 똑같은 tuple값을 tSheet에서 가져옴.
        List<DailyReportStep4> tSheet = dailyReportStep4Mapper.getDailyReportByCarNo(getSessionLoginData().getUserId());

        return tSheet;
    }

//    상세 조건이 설정된 검색의 서비스
    public List<DailyReportStep4> getCarListByOption(DailyReportStep4OptionForm optionForm) {
        optionForm.setCarNo(getSessionLoginData().getUserId());

        return dailyReportStep4Mapper.findCarListByOption(optionForm);
    }

//    일괄결재 기능의 서비스
    public void submitOption(DailyReportStep4OptionForm optionForm) {
        optionForm.setCarNo(getSessionLoginData().getUserId());
        dailyReportStep4Mapper.submitOptionM(optionForm);
    }

//    일괄취소 기능의 서비스
    public void cancelOption(DailyReportStep4OptionForm optionForm) {
        optionForm.setCarNo(getSessionLoginData().getUserId());
        dailyReportStep4Mapper.cancelOptionM(optionForm);
    }
}