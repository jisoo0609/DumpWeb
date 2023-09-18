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

    public List<DailyReportStep4Sub> getSummary1() {
        // 1. login 정보 받아오기
        HttpSession session = commonUtil.getSession();
        Login loginData = (Login) session.getAttribute("loginInfo");

        // 2. login id와 tSheet의 CarNo가 똑같은 tuple값을 tSheet에서 가져옴.
        List<DailyReportStep4Main> tSheet = dailyReportStep4Mapper.getDailyReportByCarNo(loginData.getUserId());

        // 3. 가져온 튜플의 sheetID와 tSheetSub의 sheetID2가 똑같은 튜플 값을 tSheetSub에서 가져옴
        List<DailyReportStep4Sub> tSheetSub = new ArrayList<>();
        tSheet.stream().forEach(t -> tSheetSub.add(dailyReportStep4Mapper.getDailyReportMainBySheetID2(t.getSheetID())));

        // 로그로 DB 조회 결과 출력 (System.out.println 사용)
        System.out.println("DailyReport List tSheet_sub: " + tSheetSub);

        return tSheetSub;
    }

    public List<DailyReportStep4Main> getSummary2() {
        // 1. login 정보 받아오기
        HttpSession session = commonUtil.getSession();
        Login loginData = (Login) session.getAttribute("loginInfo");

        //2. login id와 tsheet의 CarNo가 똑같은 튜플 값을 tSheet에서 가져옴.
        List<DailyReportStep4Main> tSheet = dailyReportStep4Mapper.getDailyReportByCarNo(loginData.getUserId());

        tSheet.stream().forEach(t->System.out.println(t));

        return tSheet;
    }
}