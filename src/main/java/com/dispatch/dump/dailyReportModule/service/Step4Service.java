package com.dispatch.dump.dailyReportModule.service;

import com.dispatch.dump.commonModule.db.dto.DailyReportStep4Main;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep4Sub;
import com.dispatch.dump.commonModule.db.dto.Login;
import com.dispatch.dump.commonModule.db.mapper.DailyReportStep4Mapper;
import com.dispatch.dump.commonModule.util.CommonUtil;
import javax.servlet.http.HttpSession;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

import java.util.List;

@Service
@RequiredArgsConstructor
public class Step4Service {

    private final DailyReportStep4Mapper dailyReportStep4Mapper;
    private final CommonUtil commonUtil;

    public List<DailyReportStep4Sub> getSummary() {
        // 1. login 정보 받아오기
        HttpSession session = commonUtil.getSession();
        Login loginData = (Login) session.getAttribute("loginInfo");

        // 2. login id와 tSheet의 CarNo가 똑같은 tuple값을 tSheet에서 가져옴.
        List<DailyReportStep4Main> tSheet = dailyReportStep4Mapper.getDailyReportByCarNo(loginData.getUserId());

        // 3. 가져온 튜플의 sheetID와 tSheetSub의 sheetID2가 똑같은 튜플 값을 tSheetSub에서 가져옴
        List<DailyReportStep4Sub> tSheetSub = new ArrayList<>();
        for (DailyReportStep4Main t : tSheet) {
            tSheetSub.addAll(dailyReportStep4Mapper.getDailyReportMainBySheetID2(t.getSheetID()));
        }

        return tSheetSub;
    }
}