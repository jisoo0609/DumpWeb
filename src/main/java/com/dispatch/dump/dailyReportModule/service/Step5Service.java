package com.dispatch.dump.dailyReportModule.service;

import com.dispatch.dump.commonModule.db.dto.DailyReportStep5;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep6;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep6OptionForm;
import com.dispatch.dump.commonModule.db.dto.Login;
import com.dispatch.dump.commonModule.db.mapper.DailyReportStep5Mapper;
import com.dispatch.dump.commonModule.util.CommonUtil;

import javax.servlet.http.HttpSession;

import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class Step5Service {
    private final CommonUtil commonUtil;
    private final DailyReportStep5Mapper dailyReportStep5Mapper;
    private final Logger log = LoggerFactory.getLogger(this.getClass());

    public Login getSessionLoginData() {
        return (Login) commonUtil.getSession().getAttribute("loginInfo");
    }


    public String save(DailyReportStep5 dailyReportStep5) {

        Map<String, Object> rtnMap = commonUtil.returnMap();

        try {
            dailyReportStep5.setCarNo(getSessionLoginData().getUserId());

            if (dailyReportStep5.getDriveID() == 0) {
                dailyReportStep5Mapper.insertDailyReportStep5(dailyReportStep5);
            } else { //update 수정
                dailyReportStep5Mapper.updateDailyReportStep5(dailyReportStep5);
            }
            rtnMap.put("httpCode", 200);

        } catch (Exception e) {
            log.error("Exception[" + e.getMessage() + "]");
        }

        return commonUtil.jsonFormatTransfer(rtnMap);
    }

    public List<DailyReportStep5> getCarListByDate(String date) {
        String userID = getSessionLoginData().getUserId();
        return dailyReportStep5Mapper.findCarListByDate(userID, date);
    }

    public DailyReportStep5 getDriveIDForm(int driveID) {
        String userID = getSessionLoginData().getUserId();
        return dailyReportStep5Mapper.findDriveIDForm(userID, driveID);
    }

}
