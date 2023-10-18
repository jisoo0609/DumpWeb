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

        System.out.println(dailyReportStep5.getRependdate());

        System.out.println(dailyReportStep5);

        // 필수 항목의 빈 값 체크
        if (dailyReportStep5.getDrvClub() == null || dailyReportStep5.getDrvDate() == null ||
                dailyReportStep5.getLastKm() == 0 || dailyReportStep5.getUseAmt() == 0) {
            rtnMap.put("httpCode", 400); // 클라이언트 오류를 나타내는 HTTP 상태 코드 (Bad Request)
            rtnMap.put("message", "모든 필수 항목을 입력해 주세요.");
            return commonUtil.jsonFormatTransfer(rtnMap);
        }
//        if ("요소수".equals(dailyReportStep5.getDrvClub())) {
//            if (dailyReportStep5.getRependdate() == null || dailyReportStep5.getRepaddkm() == 0) {
//                rtnMap.put("httpCode", 400);
//                rtnMap.put("message", "요소수 항목을 선택하면 교환 예정일과 교환 주행거리를 입력해야 합니다.");
//                return commonUtil.jsonFormatTransfer(rtnMap);
//            }
//        }


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
