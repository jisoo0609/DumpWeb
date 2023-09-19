package com.dispatch.dump.dailyReportModule.service;

import com.dispatch.dump.commonModule.db.dto.DailyReportStep4;
import com.dispatch.dump.commonModule.db.dto.Login;
import com.dispatch.dump.commonModule.db.mapper.DailyReportStep4Mapper;
import com.dispatch.dump.commonModule.util.CommonUtil;
import javax.servlet.http.HttpSession;

import com.mysql.cj.log.Log;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

import java.util.List;

@Service
@RequiredArgsConstructor
public class Step4Service {

    private final DailyReportStep4Mapper dailyReportStep4Mapper;
    private final CommonUtil commonUtil;

    public List<DailyReportStep4> getSummary() {
        // 1. login 정보 받아오기
        HttpSession session = commonUtil.getSession();
        Login loginData = (Login) session.getAttribute("loginInfo");

        // 2. login id와 tSheet의 CarNo가 똑같은 tuple값을 tSheet에서 가져옴.
        List<DailyReportStep4> tSheet = dailyReportStep4Mapper.getDailyReportByCarNo(loginData.getUserId());

        // 로그로 DB 조회 결과 출력 (System.out.println 사용)
        System.out.println("DailyReport List tSheet: " + tSheet);

        return tSheet;
    }


    public List<DailyReportStep4> getTotalTransportAmount() {
        // 1. login 정보 받아오기
        HttpSession session = commonUtil.getSession();
        Login loginData = (Login) session.getAttribute("loginInfo");

        // 2. 총 운반금액을 가져오는 메서드 호출
        List<DailyReportStep4> totalAmount = dailyReportStep4Mapper.getTotalTransportAmount(loginData.getUserId());

        // 로그로 DB 조회 결과 출력 (System.out.println 사용)
        System.out.println("total: " + totalAmount);

        return totalAmount;
    }

}