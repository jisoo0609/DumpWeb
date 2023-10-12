package com.dispatch.dump.dailyReportModule.service;

import com.dispatch.dump.commonModule.db.dto.DailyReportStep5;
import com.dispatch.dump.commonModule.db.dto.Login;
import com.dispatch.dump.commonModule.db.mapper.DailyReportStep5Mapper;
import com.dispatch.dump.commonModule.util.CommonUtil;
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


    public String saveTDrive(DailyReportStep5 dailyReportStep5) {
        Map<String, Object> rtnMap = commonUtil.returnMap();

        System.out.println(dailyReportStep5);


        try {
            dailyReportStep5.setCarNo(getSessionLoginData().getUserId());

            if (dailyReportStep5.getDriveID() == 0) {
                dailyReportStep5Mapper.insertTDrive(dailyReportStep5);
            } else {
                dailyReportStep5Mapper.updateTDrive(dailyReportStep5);
            }
            rtnMap.put("httpCode", 200);

        } catch (Exception e) {
            log.error("Exception[" + e.getMessage() + "]");
        }

        return commonUtil.jsonFormatTransfer(rtnMap);
    }

    public List<DailyReportStep5> findTDriveList(String date) {
        return dailyReportStep5Mapper.selectTDriveList(getSessionLoginData().getUserId(), date);
    }

    public List<DailyReportStep5> findFirstTDriveList() {
        return dailyReportStep5Mapper.selectFirstTDriveList(getSessionLoginData().getUserId());
    }

    public void removeTDrive(int driveID) {
        dailyReportStep5Mapper.deleteTDrive(getSessionLoginData().getUserId(), driveID);
    }

    public DailyReportStep5 findTDriveDetails(int driveID) {
        return dailyReportStep5Mapper.selectTDriveDetails(getSessionLoginData().getUserId(), driveID);
    }
}
