package com.dispatch.dump.dailyReportModule.service;

import com.dispatch.dump.commonModule.db.dto.*;
import com.dispatch.dump.commonModule.util.CommonUtil;
import com.dispatch.dump.commonModule.db.mapper.DailyReportStep1Mapper;
import javax.servlet.http.HttpSession;

import com.sun.org.apache.xml.internal.serializer.AttributesImplSerializer;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
@RequiredArgsConstructor
public class Step1Service {
    private final DailyReportStep1Mapper dailyReportStep1Mapper;
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
        return dailyReportStep1Mapper.selectCalTotal(option, getSessionLoginData().getUserId());
    }

    public List<DailyReportStep1Sub> findDispatchSubmitList() {
        System.out.println( dailyReportStep1Mapper.selectDispatchSubmitList(getSessionLoginData().getUserId(),getToday()));
        return dailyReportStep1Mapper.selectDispatchSubmitList(getSessionLoginData().getUserId(),getToday());
    }

    public List<DailyReportStep1Tdrive> findDispatchTdriveList() {
        System.out.println( dailyReportStep1Mapper.selectDispatchTdriveList(getSessionLoginData().getUserId(),getToday()));
        return dailyReportStep1Mapper.selectDispatchTdriveList(getSessionLoginData().getUserId(),getToday());
    }





/*

    public List<DailyReportStep1Sub> getSub(){
        //login 정보 받아오기
        HttpSession session = commonUtil.getSession();
        Login loginData = (Login) session.getAttribute("loginInfo");

        //tsitepw의 uuserID 와 tsheet 의 sheetSS이 똑같은 튜플값을 리스트 tsheet에서 가져옴
        List<DailyReportStep1Main> tSheet = new ArrayList<>();
        tSheet = dailyReportStep1Mapper.findDailyReportMainByCarSubmitTel(loginData.getUuserID());

        // 가져온 튜플의 sheetID 와 tsheetSub의 sheetID2가 똑같은 튜플 값을 tsheet에서 가져옴
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
    //tdrive
    public List<DailyReportStep1Tdrive> getTdrive(){
        //login 정보 받아오기
        HttpSession session = commonUtil.getSession();
        Login loginData = (Login) session.getAttribute("loginInfo");


        List<DailyReportStep1Tdrive> tDrive = new ArrayList<>();
        tDrive = dailyReportStep1Mapper.findJoinTdrive(loginData.getUuserID());
        tDrive.forEach(t -> System.out.println(t));

        System.out.println(dailyReportStep1Mapper.findJoinDailyReportForTotalTransportationCost(loginData.getUuserID()));

        return tDrive;
    }
*/

}

