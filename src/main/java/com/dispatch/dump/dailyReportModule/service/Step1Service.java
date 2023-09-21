package com.dispatch.dump.dailyReportModule.service;

import com.dispatch.dump.commonModule.db.dto.DailyReportStep1Main;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep1Sub;
import com.dispatch.dump.commonModule.db.dto.Login;
import com.dispatch.dump.commonModule.db.dto.Summary;
import com.dispatch.dump.commonModule.db.mapper.DailyReportStep1Mapper;

import com.dispatch.dump.commonModule.util.CommonUtil;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
@RequiredArgsConstructor
public class Step1Service {
    private final DailyReportStep1Mapper dailyReportStep1Mapper;
    private final CommonUtil commonUtil;

    public List<DailyReportStep1Sub> getSub(){
        //login 정보 받아오기
        HttpSession session = commonUtil.getSession();
        Login loginData = (Login) session.getAttribute("loginInfo");



        //tsitepw의 uuserID 와 tsheet 의 sheetSS이 똑같은 튜플값을 리스트 tsheet에서 가져옴
        List<DailyReportStep1Main> tSheet = new ArrayList<>();
        tSheet = dailyReportStep1Mapper.findDailyReportMainByCarSubmitTel(loginData.getUuserID());

        // 가져온 튜플의 sheetID 와 tsheetSub의 sheetID2가 똑같은 튜플 값을 tsheetsub에서 가져옴
        List<DailyReportStep1Sub> tSheetSub = new ArrayList<>();
        tSheet.stream().forEach(t -> tSheetSub.add(dailyReportStep1Mapper.findDailyReportMainBySheetID2(t.getSheetID())));

        //연산 값을 summary dao에 저장
        Summary summary = new Summary(0, 0, 0, new Date());
        tSheetSub.stream().forEach(t -> summary.setTotalTransportationCost(summary.getTotalTransportationCost() + t.getQty() * t.getQtyup()));

        System.out.println(summary.getTotalTransportationCost());

        return tSheetSub;


    }
    public List<DailyReportStep1Sub> getMain(){
        //login 정보 받아오기
        HttpSession session = commonUtil.getSession();
        Login loginData = (Login) session.getAttribute("loginInfo");


        List<DailyReportStep1Sub> tSheet = new ArrayList<>();
        tSheet = dailyReportStep1Mapper.findJoinDailyReport(loginData.getUuserID());
        tSheet.forEach(t -> System.out.println(t));

        System.out.println(dailyReportStep1Mapper.findJoinDailyReportForTotalTransportationCost(loginData.getUuserID()));

        return tSheet;
    }



}
