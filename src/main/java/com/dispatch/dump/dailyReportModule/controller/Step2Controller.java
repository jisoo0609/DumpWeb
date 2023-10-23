package com.dispatch.dump.dailyReportModule.controller;

import com.dispatch.dump.commonModule.db.dto.DailyReport;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep2Option;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep2Sub;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep2Summary;
import com.dispatch.dump.dailyReportModule.service.DailyReportService;
import com.dispatch.dump.dailyReportModule.service.Step2Service;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/dailyReport")
@RequiredArgsConstructor
public class Step2Controller {

    private final Step2Service step2Service;

    @RequestMapping(value = "/manager", method = RequestMethod.GET)
    public String step2() {
        return "/dailyReport/step2/manager";
    }

    @RequestMapping(value = "/manager/ajax/summary", method = RequestMethod.POST)
    @ResponseBody
    public DailyReportStep2Summary tDriveSummary(DailyReportStep2Option option) {
        return step2Service.findCalSummary(option);
    }

    @RequestMapping(value = "/manager/ajax/submitlist", method = RequestMethod.GET)
    @ResponseBody
    public List<DailyReportStep2Sub> dispatchStatusList() {
        return step2Service.findDispatchStatusList();
    }

    // 제출 받은 일보
    @RequestMapping(value = "/manager/ajax/submittedlist", method = RequestMethod.GET)
    @ResponseBody
    public List<DailyReportStep2Sub> submittedReportList() {return step2Service.findSubmittedReportList(); }

    // 금일 차량 모집 공고
    @RequestMapping(value = "/manager/ajax/recruitmentlist", method = RequestMethod.GET)
    @ResponseBody
    public List<DailyReportStep2Sub> recruitmentReportList() {return step2Service.findRecruitmentReportList(); }
}

