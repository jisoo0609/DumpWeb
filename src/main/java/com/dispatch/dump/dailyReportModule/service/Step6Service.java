package com.dispatch.dump.dailyReportModule.service;

import com.dispatch.dump.commonModule.db.dto.DailyReportStep2Main;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep6;
import com.dispatch.dump.commonModule.db.dto.Login;
import com.dispatch.dump.commonModule.db.mapper.DailyReportStep6Mapper;
import com.dispatch.dump.commonModule.util.CommonUtil;
import javax.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import static com.mysql.cj.conf.PropertyKey.logger;

@Service
@RequiredArgsConstructor
public class Step6Service {

    private final DailyReportStep6Mapper dailyReportStep6Mapper;
    private final CommonUtil commonUtil;

    public List<DailyReportStep6> getcarlist(){
        //1. login 정보 받아오기.
        HttpSession session = commonUtil.getSession();
        Login loginData = (Login) session.getAttribute("loginInfo");

        List<DailyReportStep6> tdrive = new ArrayList<>();
        tdrive = dailyReportStep6Mapper.findDailyReportSix(loginData.getUserId());

        // 로그로 DB 조회 결과 출력 (System.out.println 사용)
        System.out.println("Car List Retrieved: " + tdrive);

        return tdrive;
    }

    public List<DailyReportStep6> findDailyReportClub(String carNo, String drvClub) {
        //1. login 정보 받아오기.
        HttpSession session = commonUtil.getSession();
        Login loginData = (Login) session.getAttribute("loginInfo");

        List<DailyReportStep6> tdclub = new ArrayList<>();
        tdclub = dailyReportStep6Mapper.findDailyReportClub(carNo, drvClub);

        return tdclub;
    }


}
