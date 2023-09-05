package com.dispatch.dump.dailyReportModule.service;

import com.dispatch.dump.commonModule.db.dto.DailyReport;
import com.dispatch.dump.commonModule.db.dto.Login;
import com.dispatch.dump.commonModule.db.mapper.DailyReportMapper;
import com.dispatch.dump.commonModule.util.CommonUtil;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class DailyReportService {

    private final DailyReportMapper dailyReportMapper;
    private final CommonUtil commonUtil;
    private final Logger log = LoggerFactory.getLogger(this.getClass());

    /**
     * FUNCTION :: 일보 리스트 페이지
     * @param model
     * @param dailyReport
     * @return
     */
    public String driver(Model model, DailyReport dailyReport) {
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
        return "/dailyReport/step1/driver";
    }

    public String manager(Model model, DailyReport dailyReport) {
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
        return "/dailyReport/step2/manager";
    }

    public String form(Model model, DailyReport dailyReport) {
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
        return "/dailyReport/step3/form";
    }

    public String list(Model model, DailyReport dailyReport) {
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
        return "/dailyReport/step4/list";
    }

    public String carcareform(Model model, DailyReport dailyReport) {
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
        return "/dailyReport/step5/carcareform";
    }


    public String nextcarcare(Model model, DailyReport dailyReport) {
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
        return "/dailyReport/step5/nextcarcare";
    }


    public String carcarelist(Model model, DailyReport dailyReport) {
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
        return "/dailyReport/step6/carcarelist";
    }

    public String receipts(Model model, DailyReport dailyReport) {
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
        return "/dailyReport/step7/receipts";
    }

    public String oldform(Model model, DailyReport dailyReport) {
        HttpSession session = commonUtil.getSession();
        Login loginData = (Login) session.getAttribute("loginInfo");
        dailyReport.setCarNo(loginData.getUserId());

        DailyReport view = dailyReportMapper.findDailyReportBySheetID(dailyReport);

        if (view != null) {

            List<DailyReport> groupList = dailyReportMapper.findDailyReportListByCarSubmit(dailyReport);
            model.addAttribute("view", view);
            model.addAttribute("groupList", groupList);
        }

        return "/dailyReport/oldform";
    }


    public String save(DailyReport dailyReport) {
        Map<String, Object> rtnMap = commonUtil.returnMap();
        HttpSession session = commonUtil.getSession();

        try {
            Login loginData = (Login) session.getAttribute("loginInfo");
            dailyReport.setWriter(loginData.getUserName());
            if (dailyReport.getSheetID() == 0) {
                dailyReportMapper.insertDailyReport(dailyReport);
            } else  {
                dailyReportMapper.updateDailyReport(dailyReport);
            }
            rtnMap.put("httpCode", 200);
        } catch (Exception e) {
            log.error("Exception["+ e.getMessage() +"]");
        }
        return commonUtil.jsonFormatTransfer(rtnMap); }


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
    }


}
