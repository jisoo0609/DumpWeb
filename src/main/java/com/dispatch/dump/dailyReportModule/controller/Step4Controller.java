package com.dispatch.dump.dailyReportModule.controller;

import com.dispatch.dump.commonModule.db.dto.DailyReport;
import com.dispatch.dump.dailyReportModule.service.DailyReportService;
import com.dispatch.dump.dailyReportModule.service.Step4Service;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/dailyReport")
@RequiredArgsConstructor
public class Step4Controller {

    private final DailyReportService dailyReportService;
    private final Step4Service step4Service;


    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String step4(Model model, DailyReport dailyReport) {
        dailyReportService.list(model, dailyReport);
        model.addAttribute("tSheet", step4Service.getSummary());
        return "/dailyReport/step4/list";
    }

    @RequestMapping(value = "/totalTransportAmount", method = RequestMethod.GET)
    public String getTotalTransportAmount(Model model, DailyReport dailyReport) {
        dailyReportService.list(model, dailyReport);
        model.addAttribute("totalAmount", step4Service.getTotalTransportAmount());
        return "/dailyReport/step4/totalTransportAmount";
    }

}
