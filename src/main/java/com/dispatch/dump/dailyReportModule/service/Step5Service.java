package com.dispatch.dump.dailyReportModule.service;

import com.dispatch.dump.commonModule.db.dto.DailyReportStep5;
import com.dispatch.dump.commonModule.db.dto.Login;
import com.dispatch.dump.commonModule.db.mapper.DailyReportStep5Mapper;
import com.dispatch.dump.commonModule.util.CommonUtil;
import javax.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
@RequiredArgsConstructor
public class Step5Service {
    private final CommonUtil commonUtil;
    private final DailyReportStep5Mapper dailyReportStep5Mapper;
    private final Logger log = LoggerFactory.getLogger(this.getClass());




    //    public String list()
    public String save(DailyReportStep5 dailyReportStep5){
        Map<String, Object> rtnMap = commonUtil.returnMap();
        HttpSession session = commonUtil.getSession();

        try {
            Login loginData = (Login) session.getAttribute("loginInfo");
            dailyReportStep5.setCarNo(loginData.getUserId());
            //해당 driveid가 없다면 (insert 신규등록)
            if (dailyReportStep5.getDriveID() == 0) {
                dailyReportStep5Mapper.insertDailyReportStep5(dailyReportStep5);
                System.out.println("if Received POST request body:");
                System.out.println(dailyReportStep5);
            } else { //update 수정
                dailyReportStep5Mapper.insertDailyReportStep5(dailyReportStep5);
                System.out.println("else Received POST request body:");
                System.out.println(dailyReportStep5);
            }
           rtnMap.put("httpCode", 200);
           rtnMap.put("message", "저장 완료.");
            return "ok";

        } catch (Exception e) {
            System.out.println("Received POST request body:");
            System.out.println(dailyReportStep5);
            log.error("Exception["+ e.getMessage() +"]");


        }
        return commonUtil.jsonFormatTransfer(rtnMap);
    }
//    public String delete()
}
