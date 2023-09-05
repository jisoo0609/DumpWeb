package com.dispatch.dump.dailyReportModule.service;

import com.dispatch.dump.commonModule.db.dto.DailyReport;
import com.dispatch.dump.commonModule.db.dto.DailyReportMain;
import com.dispatch.dump.commonModule.db.dto.DailyReportSub;
import com.dispatch.dump.commonModule.db.dto.Login;
import com.dispatch.dump.commonModule.db.mapper.DailyReportMainMapper;
import com.dispatch.dump.commonModule.db.mapper.DailyReportMapper;
import com.dispatch.dump.commonModule.db.mapper.DailyReportSubMapper;
import com.dispatch.dump.commonModule.util.CommonUtil;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import jakarta.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class DailyReportMainService {

    private final DailyReportMainMapper dailyReportMainMapper;
    private final DailyReportSubMapper dailyReportSubMapper;
    private final CommonUtil commonUtil;
    private final Logger log = LoggerFactory.getLogger(this.getClass());

    /**
     * FUNCTION :: 일보 리스트 페이지
     * @param model
     * @param dailyReportMain
     * @return
     */
    public String list(Model model, DailyReportMain dailyReportMain) {
        HttpSession session = commonUtil.getSession();

        try {
            Login loginData = (Login) session.getAttribute("loginInfo");
            dailyReportMain.setCarNo(loginData.getUserId());

            log.info(dailyReportMain.getCarNo());
            List<DailyReportMain> list = dailyReportMainMapper.findDailyReportList(dailyReportMain);
            model.addAttribute("list", list);
        } catch (Exception e) {
            log.error("Exception["+ e.getMessage() +"]");
        }
        return "/dailyReportMain/list";
    }

    public String save(DailyReportMain dailyReportMain, DailyReportSub dailyReportSub) {
        Map<String, Object> rtnMap = commonUtil.returnMap();
        HttpSession session = commonUtil.getSession();

        try {
            Login loginData = (Login) session.getAttribute("loginInfo");
            dailyReportMain.setCarNo(loginData.getUserName());
            if (dailyReportMain.getSheetID() == 0) {
                //dailyReportMain
                int sucess=dailyReportMainMapper.insertDailyReportMain(dailyReportMain);
                System.out.println(sucess);
                //dailyReportSub

                    dailyReportSubMapper.insertDailyReportSub(dailyReportSub);



            } else  {
                //dailyReportMainMapper.updateDailyReport(dailyReportMain);
            }
            rtnMap.put("httpCode", 200);
        } catch (Exception e) {
            log.error("Exception["+ e.getMessage() +"]");
        }
        return commonUtil.jsonFormatTransfer(rtnMap); }



/*
    public String form(Model model, DailyReport dailyReport) {
        HttpSession session = commonUtil.getSession();
        Login loginData = (Login) session.getAttribute("loginInfo");
        dailyReport.setCarNo(loginData.getUserId());

        DailyReport view = dailyReportMapper.findDailyReportBySheetID(dailyReport);

        if (view != null) {

            List<DailyReport> groupList = dailyReportMapper.findDailyReportListByCarSubmit(dailyReport);
            model.addAttribute("view", view);
            model.addAttribute("groupList", groupList);
        }

        return "/dailyReport/form";
    }

    public String carlist(Model model, DailyReport dailyReport) {
        HttpSession session = commonUtil.getSession();

        try {
            Login loginData = (Login) session.getAttribute("loginInfo");
            dailyReport.setCarNo(loginData.getUserId());

            log.info(dailyReport.getCarNo());
            List<DailyReport> list = dailyReportMapper.findDailyReportList(dailyReport);
            model.addAttribute("list", list);
        } catch (Exception e) {
            log.error("Exception["+ e.getMessage() +"]");
        }
        return "/dailyReport/carlist";
    }
*/


/*
    public String delete(DailyReport dailyReport) {
        Map<String, Object> rtnMap = commonUtil.returnMap();

        try {
            dailyReportMapper.deleteDailyReport(dailyReport);
            rtnMap.put("httpCode", 200);
        } catch (Exception e) {
            log.error("Exception["+ e.getMessage() +"]");
        }

        return commonUtil.jsonFormatTransfer(rtnMap);
    }

    public String dataSetting(DailyReport dailyReport) {
        Map<String, Object> rtnMap = commonUtil.returnMap();

        try {
            DailyReport settingData = dailyReportMapper.findDailyReportBySheetID(dailyReport);
            rtnMap.put("httpCode", 200);
            rtnMap.put("settingData", settingData);
        } catch (Exception e) {
            log.error("Exception["+ e.getMessage() +"]");
        }


        return commonUtil.jsonFormatTransfer(rtnMap);
    }*/


}
