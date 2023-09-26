package com.dispatch.dump.dailyReportModule.service;

import com.dispatch.dump.commonModule.db.dto.DailyReportStep7CarNo;
import com.dispatch.dump.commonModule.db.dto.Login;
import com.dispatch.dump.commonModule.db.mapper.DailyReportStep7Mapper;
import com.dispatch.dump.commonModule.db.mapper.DailyReportStep7MainMapper;
import com.dispatch.dump.commonModule.db.mapper.DailyReportStep7SubMapper;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep7Main;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep7Sub;
import com.dispatch.dump.commonModule.util.CommonUtil;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class Step7Service {

    private final CommonUtil commonUtil;
    private final DailyReportStep7MainMapper dailyReportStep7MainMapper;
    private final DailyReportStep7SubMapper dailyReportStep7SubMapper;
    private final DailyReportStep7Mapper step7Mapper;
    private final Logger log = LoggerFactory.getLogger(this.getClass());

    //제출처 주문 정보 저장
    public String saveOrder(DailyReportStep7Main dailyReportStep7Main, DailyReportStep7Sub dailyReportStep7Sub){

        Map<String, Object> rtnMap = commonUtil.returnMap();
        HttpSession session = commonUtil.getSession();

        try {
            Login loginData = (Login) session.getAttribute("loginInfo");
            dailyReportStep7Main.setCarNo(loginData.getUserId());
            dailyReportStep7Main.setSheetSS2(Integer.parseInt(loginData.getUuserID()));

            dailyReportStep7MainMapper.insertDailyReportStep7(dailyReportStep7Main);

            dailyReportStep7Sub.setSheetID2(dailyReportStep7Main.getSheetID());
            System.out.println("외래키는?"+dailyReportStep7Sub.getSheetID2());
            dailyReportStep7Sub.setSheetsubSS2(Integer.parseInt(loginData.getUuserID()));

            dailyReportStep7SubMapper.insertDailyReportStep7sub(dailyReportStep7Sub);
                rtnMap.put("httpCode", 200);

        } catch (Exception e) {
            log.error("Exception["+ e.getMessage() +"]");
        }
        return commonUtil.jsonFormatTransfer(rtnMap);

    }

    public String saveCarData(DailyReportStep7CarNo dailyReportStep7CarNo) {
        Map<String, Object> rtnMap = commonUtil.returnMap();
        try {
            HttpSession session = commonUtil.getSession();
            Login loginData = (Login) session.getAttribute("loginInfo");

            dailyReportStep7CarNo.setCarNoSS2(Integer.parseInt(loginData.getUuserID()));

            step7Mapper.insertCarData(dailyReportStep7CarNo);

            rtnMap.put("httpCode", 200);
        } catch (Exception e) {
            log.error("Exception [" + e.getMessage() +"]");
        }


        return commonUtil.jsonFormatTransfer(rtnMap);
    }

    public void carNoList(Model model) {
        model.addAttribute("carNoList", step7Mapper.findCarNoList());
    }

}
