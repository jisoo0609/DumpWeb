package com.dispatch.dump.dailyReportModule.controller;

import com.dispatch.dump.commonModule.db.dto.DailyReport;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep4Sub;
import com.dispatch.dump.dailyReportModule.service.DailyReportService;
import com.dispatch.dump.dailyReportModule.service.Step4Service;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
@RequestMapping("/dailyReport")
@RequiredArgsConstructor
public class Step4Controller {

    private final DailyReportService dailyReportService;
    private final Step4Service step4Service;


    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String step4(Model model, DailyReport dailyReport) {
        dailyReportService.list(model, dailyReport);
        return "/dailyReport/step4/list";
    }

    @RequestMapping(value = "/step4/getDailyReportList", method = RequestMethod.GET)
    @ModelAttribute("DailyReportList")
    public List<DailyReportStep4Sub> getDailyReportList() {
       List<DailyReportStep4Sub> DailyReportList = step4Service.getSummary();
       return DailyReportList;
    }


}
